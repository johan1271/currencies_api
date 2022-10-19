import 'dart:convert';
import 'package:currencies_api/Models/curriencies_models.dart';
import "package:currencies_api/Models/countries_currecies.dart";
import 'package:http/http.dart' as http;


//CurrenciesProvider is a class that provides the data of the currencies
//CurrenciesProvider fetches the data from the api and returns it
class CurrenciesProvider {

  //Base url
  final String _url = "https://api.frankfurter.app/";

  //https://api.frankfurter.app/latest?amount=1&from=USD&to=EUR
  //getConvertCurrencies is a function that fetches the convertion between two currencies and returns a Future<Currencies>
  Future<Currencies> getConvertCurrencies(
      num amount, String currency1, String currency2) async {
    

    final response = await http.get(
        Uri.parse("${_url}latest?amount=$amount&from=$currency1&to=$currency2"));
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      
      final decodedData = jsonDecode(body);

      final currencies = Currencies.fromJsonMap(decodedData);

      //return the currencies object
      return currencies;
    } else {
      throw Exception("Ocurrio algo ${response.statusCode}");
    }
  }


  //get rates of a currency and returns a Future<Currencies>
  //https://api.frankfurter.app/latest?from=USD
  Future<Currencies> getRates(String from) async {
    
    final response = await http.get(Uri.parse("${_url}latest?from=$from"));
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final decodedData = jsonDecode(body);

      //create a currency object with the rates
      final currencies = Currencies.fromJsonMap(decodedData);
      
      //return the currency object with the rates
      return currencies;
    } else {
      throw Exception("Ocurrio algo ${response.statusCode}");
    }
  }


  //get a map of currencies and returns a Future<Map<String, dynamic>>
  //https://api.frankfurter.app/currencies
  Future<Map<String, dynamic>> getCurrencyList() async {


    final response = await http.get(Uri.parse("${_url}currencies"));
    
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      //create a countriesCurrencies object
      final countriesC = CountriesCurrencies.fromJsonMap(jsonData);

      //return a map of the countriesCurrencies object
      return countriesC.countriesCurrencies;
    } else {
      throw Exception("Ocurrio Algo ${response.statusCode}");
    }
  }
}
