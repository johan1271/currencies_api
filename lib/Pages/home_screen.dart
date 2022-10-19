import 'package:currencies_api/Widgets/convert_card.dart';
import 'package:currencies_api/Widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:currencies_api/Models/curriencies_models.dart';
import 'package:currencies_api/Provider/curriencies_provider.dart';
import "package:currencies_api/Widgets/flag_card.dart";
import 'package:currencies_api/Widgets/exchange_card.dart';
import 'package:flutter/services.dart';

//HomeScreen is the main page of the app
//HomeScreen displays currency flags, dropdowns,  convert button , exchange rates , convertion result and amount to be converted
//HomeScreen 
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  late Future<Map<String, dynamic>> _mapCurrencies;
  late Future<Currencies> _curriencesRates;
  late Future<Currencies> _currencieData;

  late String _rates;
  late Currencies _currencie;
  late String _from;
  late String _to;

  late TextEditingController _amountController;
  late num _amount;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    //initialize the currencies provider
    final currenciesProvider = CurrenciesProvider();

    //fetch the currencies map
    _mapCurrencies = currenciesProvider.getCurrencyList();

    //initialize the amount controller
    _amountController = TextEditingController();

    //initialize _from and _to variables
    _from = "AUD";

    _to = "USD";

    //initialize the _rates variable
    _rates = "0";

    
    

    //fetch the rates of the currency
    _currencieData = currenciesProvider.getRates("AUD");

    //initialize the amount
    _amount = 0;


    //initialize the currencies object
    _currencie = Currencies(_amount, "AUD", "2022-10-18", {});

    //initialize the currencies rates object
    _curriencesRates = currenciesProvider.getRates("AUD");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Currency Converter",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
    
                //call the flag card widget
                flagCard(),
    
                //call the exchange card widget
                exchangeCard(),
    
                //call the convert card widget
                convertCard(),
              ],
            ),
          ),
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }

  //get the rates of the currency
  getRates(String nameFrom) async {
    final currenciesProvider = CurrenciesProvider();

    //fetch the rates of the currency
    _currencieData = currenciesProvider.getRates(nameFrom);
    var response = _currencieData;
    setState(() {
      //set the rates of the currency in a future object
      _curriencesRates = response;
    });
  }


  //get method the convertion of the currencies
  getConvert(String from, String to, num amount) async {
    final currenciesProvider = CurrenciesProvider();

    //fetch the currencie object with the convertion of the currencies
    var response =
        await currenciesProvider.getConvertCurrencies(amount, from, to);

    setState(() {
      //set the currencie object from the response
      _currencie = response;
      
    });
  }

  //create a future builder widget to get the list of currencies and set it to the dropdown widget
  Widget convertCard() {
    return FutureBuilder<Map<String, dynamic>>(
      future: _mapCurrencies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ConvertCard(
            dropdown1: customDropDown(snapshot.data!, _from, (val) {
              setState(() {
                //set the value of the first dropdown
                _from = val;

                //get the rates of the currency
                getRates(_from);
              });
            }),
            dropdown2: customDropDown(snapshot.data!, _to, (val) {
              setState(() {
                //set the value of the second dropdown
                _to = val;
              });
            }),
            textfield: textFieldModified(),
            buttonConvert: elevatedButton(),
          );
        } else {

          return const CircularProgressIndicator();
        }
      },
    );
  }

  //create a future builder widget that  to update a flag card
  Widget flagCard() {
    return FutureBuilder<Map<String, dynamic>>(
      future: _mapCurrencies,
      builder: (context, snapshot) {

        //create a map of the currencies
        Map<String, dynamic>? map = snapshot.data;
        if (snapshot.hasData) {

          // return a flag card widget
          //send the parameters to the flag card widget
          return FlagCard(
            //takes the flag of both currency, from and to
            flags: [map![_from], map[_to]],

            //takes the symbol of both currency, from and to
            symbol: [_from, _to],

            //takes rates of the currency verify if the rates is not null
            to: _currencie.rates[_to].toString()=='null' ? _rates : _currencie.rates[_to].toString(),

            //takes amount to convert
            amount: _amount.toString(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  //create a future builder widget to update a exchange rate card
  Widget exchangeCard() {
    return FutureBuilder<Currencies>(
      future: _curriencesRates,
      builder: (context, snapshot) {

        //create a currencies object
        Currencies? currenciesData2 = snapshot.data;
        if (snapshot.hasData) {
          return ExchangeRateCard(

              //takes the rates of the currency
              rate: _from != _to ? currenciesData2!.rates[_to].toString() : "1",

              //takes the symbol of the currency to convert
              from: _from,

              //takes the symbol of the currency to be converted
              to: _to);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }



  //create a widget for the elevated button
  Widget elevatedButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          fixedSize: const Size(270, 43),
          
          foregroundColor: Colors.black,
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        onPressed: () {
          setState(() {

            //when the button is pressed, get the convertion of the currencies if the amount is not empty and the from and to currencies are not the same
            if (_amountController.text.isEmpty) {
              _amount = 0;
            } else {
              
              if (_from != _to) {
                //parse the amount to a number
                _amount = num.parse(_amountController.text);

                //get the convertion of the currencies
                getConvert(_from, _to, _amount);
              } 
            }        
          });
        },
        child: const Text("Convert"));
  }


  //create a widget for the textfield
  Widget textFieldModified() {
    return SizedBox(
      width: 270,
      height: 40,
      child: TextField(
        controller: _amountController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.amber, width: 1.0),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.black)),
          labelText: 'Amount',
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 105, 103, 103),
          ),
        ),
      ),
    );
  }
}
