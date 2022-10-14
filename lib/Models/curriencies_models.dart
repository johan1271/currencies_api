class Currencies {
  late double amount;
  late String base;
  late String date;
  late Map<String, double> rates;

  Currencies(this.amount, this.base, this.date, this.rates);

  Currencies.fromJsonMap(Map<String, dynamic> json) {
    amount = json['amount'];
    base = json['base'];
    date = json['date'];
    rates = json['rates'];
    json['rates'].forEach((k, v) {
      rates[k] = v.toDouble();
    });
  }
}

class CountriesCurrencies{
  Map<String,dynamic> countriesCurrencies = {};
  

  CountriesCurrencies();
  


  CountriesCurrencies.From(Map<String,dynamic> countriesCurrencies){
    print("llego aca");
    // countriesCurrencies.forEach((key, value) {
    //   this.countriesCurrencies[key] = value;
    // });

    List<dynamic> countries = ["Australia","Bulgaria","Brazil","Canada","Switzerland","China","Czechia","Denmark","Eur", "The United Kingdom Of Great Britain And Northern Ireland", "Hong Kong", "Croatia","Hungary","Indonesia", "Israel","India","Iceland","Japan","South Korea","Mexico","Malaysia","Norway","New Zealand","Philippines","Poland","Romania","Sweden","Singapore","Thailand","Turkey","United States Of America","South Africa"];
  
    this.countriesCurrencies.forEach((key, value) {
      this.countriesCurrencies[key] = countries[countriesCurrencies.values.toList().indexOf(value)];
      
    });

    
    
  }

}


class CurrenciesList {
  late List<Currencies> currencies;

  CurrenciesList();

  CurrenciesList.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    
    
    currencies = jsonList.map((item) => Currencies.fromJsonMap(item)).toList();
    
    
  }
}
