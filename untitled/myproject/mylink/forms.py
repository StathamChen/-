from django import forms


DISTRICT_CHOICES = (('baoshan', '宝山'), ('putuo', '普陀'), ('songjiang', '松江'))
PRICE_CHOICES = (('p2', '200-300万'), ('p3', '300-400万'), ('p4', '400-500万'), ('p5', '500-800万'))
BEDROOM_CHOICES = (('l3', '三室'), ('l4', '四室'))

class HouseChoiceForm(forms.Form):
    district = forms.CharField(label="区域", widget=forms.RadioSelect(choices=DISTRICT_CHOICES))
    price = forms.CharField(label="价格", widget=forms.RadioSelect(choices=PRICE_CHOICES))
    bedroom = forms.CharField(label="房型", widget=forms.RadioSelect(choices=BEDROOM_CHOICES))

