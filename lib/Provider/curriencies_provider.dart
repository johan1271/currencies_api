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


  Future _getFlag(String flag) async {
    final response = await http.get(Uri.parse("https://countryflagsapi.com/png/$flag"));
    final decodedData = json.decode(response.body);
    return decodedData;
  }
  
  
  

  Future<List<String>> getCurrencyList() async {
    final response = await http.get(Uri.parse(_url));
    
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      
      final jsonData = jsonDecode(body) ;

      Map<String, dynamic> map = jsonData;
      
      List<String> currencies = map.keys.toList();
      
      //print(currencies);
      

      
      
      return currencies;
    } else {
      throw Exception("Ocurrio Algo ${response.statusCode}");
    }
      
    
    
  }

  
}