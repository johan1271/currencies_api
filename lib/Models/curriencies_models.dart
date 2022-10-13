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



  


class CurrenciesList {
  late List<Currencies> currencies;

  CurrenciesList();

  CurrenciesList.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    
    print("llegue aca");
    currencies = jsonList.map((item) => Currencies.fromJsonMap(item)).toList();
    print(currencies);
    // for (var item in jsonList) {
    //   final currencie = Currencies.fromJsonMap(item);
    //   currencies.add(currencie);
    // }
  }
}
