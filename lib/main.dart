import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(FirstApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FirstApp();
  }
  }
class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Simple calculator';
    return new MaterialApp(
        theme: ThemeData.dark().copyWith(brightness: Brightness.dark, accentColor: Colors.deepPurple),
        home : Builder (
          builder: (context) =>
        Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            backgroundColor: Colors.deepPurple,
          ),
        body: AddTwoNumbers(),
        drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader (
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName: Text('Raul Pratap Singh'),
                  accountEmail: Text("raulpsingh2@gmail.com"),
                  currentAccountPicture: Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage('https://sun1-14.userapi.com/s/v1/ig2/pWD9LqxaqpEWs70aigoeRGuwpG_kriwqgnQMQpoYTeqUX8iQE8PbWBCU7_OmyCcJWLPnoLX-zz51FSl5g0uzqWLg.jpg?size=400x0&quality=96&crop=30,0,855,855&ava=1'),
                        ),
                      ),
                      )
                  ),
                ),
              new ListTile(
                  title: new Text("Simple Calculator"),
                  leading: Icon(Icons.calculate),
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstApp()),
                  );}
              ),
              new ListTile(
                  title: new Text("Converter"),
                  leading: Icon(Icons.swap_horiz),
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondApp()),
                  );}
              )
            ],
          ),
        ),
        ),
    ));
  }
}
class SecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Converter';
    return new MaterialApp(
      theme: ThemeData.dark().copyWith(brightness: Brightness.dark, accentColor: Colors.deepPurple),
        home : Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.deepPurple,
        ),
        body: Convert(),
        drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader (
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName: Text('Raul Pratap Singh'),
                  accountEmail: Text("raulpsingh2@gmail.com"),
                  currentAccountPicture: Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage('https://sun1-14.userapi.com/s/v1/ig2/pWD9LqxaqpEWs70aigoeRGuwpG_kriwqgnQMQpoYTeqUX8iQE8PbWBCU7_OmyCcJWLPnoLX-zz51FSl5g0uzqWLg.jpg?size=400x0&quality=96&crop=30,0,855,855&ava=1'),
                  ),
                ),
                  ),
                ),
              ),
              new ListTile(
                  title: new Text("Simple Calculator"),
                  leading: Icon(Icons.account_box),
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstApp()),
                  );}
              ),
              new ListTile(
                  title: new Text("Converter"),
                  leading: Icon(Icons.settings),
                  onTap: (){}
              )
            ],
          ),
        ),
        ),
    );
  }
}
class AddTwoNumbers extends StatefulWidget {
  @override
  _AddTwoNumbersState createState() => _AddTwoNumbersState();
}


class _AddTwoNumbersState extends State<AddTwoNumbers> {
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  String resulttext = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Number 1 : "),
              new Flexible(
                child: new TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  keyboardType: TextInputType.number,
                  controller: num1controller,
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Text("Number 2 : "),
              new Flexible(
                child: new TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  keyboardType: TextInputType.number,
                  controller: num2controller,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("+"),
                color: Colors.black26,
                onPressed : () {
                  setState(() {
                    int result = int.parse(num1controller.text) + int.parse(num2controller.text);
                    resulttext = result.toString();
                  });
                },
              ),
              RaisedButton(
                child: Text("-"),
                color: Colors.black26,
                onPressed : () {
                  setState(() {
                    int result = int.parse(num1controller.text) - int.parse(num2controller.text);
                    resulttext = result.toString();
                  });
                },
              ),
              RaisedButton(
                child: Text("x"),
                color: Colors.black26,
                onPressed : () {
                  setState(() {
                    int result = int.parse(num1controller.text) * int.parse(num2controller.text);
                    resulttext = result.toString();
                  });
                },
              ),
              RaisedButton(
                child: Text("/"),
                color: Colors.black26,
                onPressed : () {
                  setState(() {
                    double result = double.parse(num1controller.text)/double.parse(num2controller.text);
                    resulttext = result.toStringAsPrecision(3);
                  });
                },
              ),
            ],
          ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

              RaisedButton(
                child: Text("^"),
                color: Colors.black26,
                onPressed : () {
                  setState(() {
                    double result =pow(double.parse(num1controller.text), double.parse(num2controller.text));
                    resulttext = result.toStringAsPrecision(3);
                  });
                },
              ),
           ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Result:",
                style: TextStyle(
                  fontSize: 30,
                ),),
              new Text(resulttext,
                style: TextStyle(
                  fontSize: 30,
                ),),
            ],
          ),
        ],
      ),
    );
  }
}

class Convert extends StatefulWidget {
  @override
  _ConvertState createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  TextEditingController unitController = new TextEditingController();
  var result = '';
  var value = false;
  var unit = "Convert from miles to kilometers";



  void swap(){
    result="";
    if(value){
      setState(() {
        unit = "Convert from miles to kilometers";
        value=false;
      });
    }else{
      setState(() {
      unit = "Convert from kilometers to miles";
      value= true;
      });
      }
  }

  void convertUnit(){
    if(unitController.text.isEmpty) {
      return;
    }
    if(value==false) {
      setState(() {
        double res = (double.parse(unitController.text)*1.609344);
        result = res.toString();
      });
    }if(value==true){
      setState(() {
        double res = (double.parse(unitController.text)*0.621371);
        result = res.toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child :Column(
          children: <Widget>[
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: <Widget>[
            Text(unit,style: TextStyle(fontSize: 20, color: Colors.grey)),
        FlatButton.icon(onPressed: swap, icon: Icon(Icons.swap_horiz),
        label: Text("Swap")),
        ]
       ),
        new Flexible(
            child:new TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
              keyboardType: TextInputType.number,
              controller: unitController,
            ),
           ),
     Container(
       width: 150,
       height: 50,
       child: RaisedButton(
       child: Text("Convert"),
       color: Colors.black26,
       onPressed:convertUnit,
         ),
     ),
            Text("Result:",
              style: TextStyle(
                fontSize: 30,
              ),),
            new Text(result,
              style: TextStyle(
                fontSize: 30,
              ),),

      ],
      ),
      );
  }
}

