import 'package:currencies_api/Widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:currencies_api/Models/curriencies_models.dart';
import 'package:currencies_api/Provider/curriencies_provider.dart';

class MyHomeApp extends StatefulWidget {
  MyHomeApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp> {
  late Future<List<String>> _listCurrencies;
  late String _valueFrom;
  late String _valueTo;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    final currenciesProvider = CurrenciesProvider();
    print("hola");
    _listCurrencies = currenciesProvider.getCurrencyList();
    //print(_listCurrencies);
    _valueFrom = "AUD";
    _valueTo = "USD";
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<String>>(

          future: _listCurrencies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customDropDown(snapshot.data as List<String>, _valueFrom, (val) {
                    setState(() {
                      _valueFrom = val;
                    });
                  }),
                  customDropDown(snapshot.data as List<String>, _valueTo, (val) {
                    setState(() {
                      _valueTo = val;
                    });
                  }),
                ],
              );
                      
            } else if (snapshot.hasError) {
              throw Exception("Ocurrio Algo ${snapshot.error}");
              
            }
            return const SizedBox();
          },
          
          
        ),);// This trailing comma makes auto-formatting nicer for build methods.
        
  }

}
