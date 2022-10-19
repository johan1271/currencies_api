
//CountriesCurrencies is a class that contains a map of countries and currencies
class CountriesCurrencies{
  //map of currencies and countries
  Map<String,dynamic> countriesCurrencies = {};



  //list of countries names
  List<dynamic> countries = ["Australia","Bulgaria","Brazil","Canada","Switzerland","China","Czechia","Denmark","Eur", "The United Kingdom Of Great Britain And Northern Ireland", "Hong Kong", "Croatia","Hungary","Indonesia", "Israel","India","Iceland","Japan","South Korea","Mexico","Malaysia","Norway","New Zealand","Philippines","Poland","Romania","Sweden","Singapore","Thailand","Turkey","United States Of America","South Africa"];
  

  CountriesCurrencies();
  

  //create a countriesCurrencies object from a json map
  CountriesCurrencies.fromJsonMap(Map<String,dynamic> jsonCountriesCurrencies){
    

    //Save the json in a map
    countriesCurrencies = jsonCountriesCurrencies;

    
    

    //update the map values with the countries names
    countriesCurrencies.forEach((key, value) {
      countriesCurrencies[key] = countries[countriesCurrencies.values.toList().indexOf(value)];
      
    });
  }
}
    
