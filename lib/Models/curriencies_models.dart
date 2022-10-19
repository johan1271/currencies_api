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
    

    rates = json["rates"].cast<String, dynamic>();
    
    amount = json['amount'];
    
  }
}



class CountriesCurrencies{
  //map of currencies and countries
  Map<String,dynamic> countriesCurrencies = {};
  

  CountriesCurrencies();
  

  //create a countriesCurrencies object from a json map
  CountriesCurrencies.fromJsonMap(Map<String,dynamic> jsonCountriesCurrencies){
    

    //Save the json in a map
    countriesCurrencies = jsonCountriesCurrencies;

    //create a list of countries names
    List<dynamic> countries = ["Australia","Bulgaria","Brazil","Canada","Switzerland","China","Czechia","Denmark","Eur", "The United Kingdom Of Great Britain And Northern Ireland", "Hong Kong", "Croatia","Hungary","Indonesia", "Israel","India","Iceland","Japan","South Korea","Mexico","Malaysia","Norway","New Zealand","Philippines","Poland","Romania","Sweden","Singapore","Thailand","Turkey","United States Of America","South Africa"];

    //update the map values with the countries names
    countriesCurrencies.forEach((key, value) {
      countriesCurrencies[key] = countries[countriesCurrencies.values.toList().indexOf(value)];
      
    });

    
    
  }

}



