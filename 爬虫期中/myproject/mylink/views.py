from django.shortcuts import render
from .models import HouseInfo
from .forms import HouseChoiceForm
from django.core.paginator import Paginator
from django.http import HttpResponseRedirect


from fake_useragent import UserAgent
import requests
from bs4 import BeautifulSoup
import re

# Create your views here.

def house_index(request):
    form = HouseChoiceForm()
    house_list = HouseInfo.objects.all().order_by('-add_date')
    if house_list:
        paginator = Paginator(house_list, 20)
        page = request.GET.get('page')
        page_obj = paginator.get_page(page)

        return render(request, 'mylink/index.html',
                      {'page_obj': page_obj, 'paginator': paginator,
                       'is_paginated': True, 'form': form,})
    else:
        return render(request,'mylink/index.html', {'form': form,})

def house_spider(request):
    if request.method == 'POST':
        form = HouseChoiceForm(request.POST)
        if form.is_valid():
            district = form.cleaned_data.get('district')
            price = form.cleaned_data.get('price')
            bedroom = form.cleaned_data.get('bedroom')
            url = 'https://sh.lianjia.com/ershoufang/{}/{}{}'.format(district, price, bedroom)

            home_spider = HomeLinkSpider(url)
            home_spider.get_max_page()
            home_spider.parse_page()
            home_spider.save_data_to_model()
            return HttpResponseRedirect('/mylink/')
    else:
        return HttpResponseRedirect('/mylink/')


class HomeLinkSpider(object):
    def __init__(self, url):
        self.ua = UserAgent(verify_ssl=False)
        self.headers = {"User-Agent": self.ua.random}
        self.data = list()
        self.url = url

    def get_max_page(self):
        response = requests.get(self.url, headers=self.headers)
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            a = soup.select('div[class="page-box house-lst-page-box"]')
            max_page = eval(a[0].attrs["page-data"])["totalPage"]
            return max_page
        else:
            print("请求失败 status:{}".format(response.status_code))
            return None

    def parse_page(self):
        max_page = self.get_max_page()
        for i in range(1, max_page + 1):
            url = "{}pg{}/".format(self.url, i)
            response = requests.get(url, headers=self.headers)
            soup = BeautifulSoup(response.text, 'html.parser')
            ul = soup.find_all("ul", class_="sellListContent")
            li_list = ul[0].select("li")
            for li in li_list:
                detail = dict()
                detail['title'] = li.select('div[class="title"]')[0].get_text()

            house_info = li.select('div[class="houseInfo"]')[0].get_text()
            house_info_list = house_info.split(" | ")

            detail['house'] = house_info_list[0]
            detail['bedroom'] = house_info_list[1]
            detail['area'] = house_info_list[2]
            detail['direction'] = house_info_list[3]

            position_info = li.select('div[class="positionInfo"]')[0].get_text().split(' - ')

            floor_pattern = re.compile(r'.+\)')
            match1 = re.search(floor_pattern, position_info[0])
            if match1:
                detail['floor'] = match1.group()
            else:
                detail['floor'] = "未知"

            year_pattern = re.compile(r'\d{4}')
            match2 = re.search(year_pattern, position_info[0])
            if match2:
                detail['year'] = match2.group()
            else:
                detail['year'] = "未知"
                detail['location'] = position_info[1]

                price_pattern = re.compile(r'\d+')
                total_price = li.select('div[class="totalPrice"]')[0].get_text()
                detail['total_price'] = re.search(price_pattern, total_price).group()

                unit_price = li.select('div[class="unitPrice"]')[0].get_text()
                detail['unit_price'] = re.search(price_pattern, unit_price).group()
                self.data.append(detail)

    def save_data_to_model(self):
        for item in self.data:
            new_item = HouseInfo()
            new_item.title = item['title']
            new_item.house = item['house']
            new_item.bedroom = item['bedroom']
            new_item.area = item['area']
            new_item.direction = item['direction']
            new_item.floor = item['floor']
            new_item.year = item['year']
            new_item.location = item['location']
            new_item.total_price = item['total_price']
            new_item.unit_price = item['unit_price']
            new_item.save()

