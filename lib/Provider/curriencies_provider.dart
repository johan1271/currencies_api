import 'dart:convert';
import 'package:currencies_api/Models/curriencies_models.dart';
import 'package:http/http.dart' as http;

class CurrenciesProvider {

  
  
  final String _url = "https://api.frankfurter.app/currencies";
  
  

  Future<Currencies> getConvertCurrencies(double amount, String currency1, String currency2) async {
    final String url2 = "https://api.frankfurter.app/latest?amount=$amount&from=$currency1&to=$currency2";
    final response = await http.get(Uri.parse(url2));
    final decodedData = json.decode(response.body);
    final currencies = Currencies.fromJsonMap(decodedData);
    return currencies;
  }

  


  
  
  
  

  Future<Map<String,dynamic>> getCurrencyList() async {
    final response = await http.get(Uri.parse(_url));
    
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      
      final jsonData = jsonDecode(body) ;
      print("llegue aca");
      Map<String, dynamic> map = jsonData;
      print(map);
      //List<String> currencies = map.keys.toList();
      //print(currencies);
      
      
      final countriesC = CountriesCurrencies.From(map);
      print(countriesC.countriesCurrencies);
      print("hola key");
      print("estas son las keys $countriesC.countriesCurrencies.keys");
      // countriesC.countriesCurrencies.forEach((key, value) {
      //   print("esta es la key $key");
      //   print(value);
      // }); 
      
      print("retorno esto $countriesC.countriesCurrencies"); 
      //print(currencies);
      
      return countriesC.countriesCurrencies;
    } else {
      throw Exception("Ocurrio Algo ${response.statusCode}");
    }
      
    
    
  }

  
}