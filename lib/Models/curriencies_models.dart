
//class Currencies
// *amount: amount of the currency
// *base: base currency
// *date: date of the currency
// *rates: map of the rates of the currency

class Currencies {
  //atributes
  late num amount;
  late String base;
  late String date;
  late Map<String,dynamic> rates;

  
  //constructor
  Currencies(this.amount, this.base, this.date, this.rates);

  //create a currency object from a json map
  Currencies.fromJsonMap(Map<String, dynamic> json) {
    
    base = json['base'];
    date = json['date'];
    
    //cast the rates to a map
    rates = json["rates"].cast<String, dynamic>();
    
    amount = json['amount'];
    
  }
}









