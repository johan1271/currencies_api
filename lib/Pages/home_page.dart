import 'package:currencies_api/Widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:currencies_api/Models/curriencies_models.dart';
import 'package:currencies_api/Provider/curriencies_provider.dart';
import 'package:currencies_api/Models/value_models.dart';

class MyHomeApp extends StatefulWidget {
  MyHomeApp({Key? key}) : super(key: key);

  

  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp> {
  late Future<List<String>> _listCurrencies;
  late Value _value;
  

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    final currenciesProvider = CurrenciesProvider();
    print("hola");
    _listCurrencies = currenciesProvider.getCurrencyList();
    //print(_listCurrencies);
    _value = Value("AUD","USD");
    
    print(_value.getValueFrom);
    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(

          future: _listCurrencies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("llegue aca");
              return customDropDown(snapshot.data as List<String>, _value.getValueFrom, (val) {
                setState(() {
                  
                  _value.setValueFrom = val;
                  
                });
              });
                      
            } else if (snapshot.hasError) {
              throw Exception("Ocurrio Algo ${snapshot.error}");
              
            }
            return const SizedBox();
          },
          
          
        );// This trailing comma makes auto-formatting nicer for build methods.
        
  }


  

}
