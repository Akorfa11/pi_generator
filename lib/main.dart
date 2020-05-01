
import 'package:flutter/material.dart';

void main() => runApp(
               MaterialApp(
                 home: Scaffold(
                   backgroundColor: Colors.white,
                   appBar: AppBar(
                     backgroundColor: Colors.orange,
                     title: Text('Pi Generator'),
                   ),
                   body: MyApp(),
                 ),
               )
);

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Pi Generator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();


  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
      children:<Widget>[
        Container(
          child: Text('Please input the desired decimal places       [MAX:3] ',
          style: TextStyle(
            fontSize: 24,
            fontStyle:FontStyle.italic
          ),),
        ),


        TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          controller: _controller,
          onSubmitted: ( String value) async {
            if (value == '1') {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Great!'),
                    content:
                    Text('Your value is "3.1".'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },

              );
            }
            else if ( value == '2') {
              await showDialog<void>(
                context: context,
                builder:  (BuildContext) {
                  return AlertDialog(
                    title: const Text('Great!'),
                    content:
                    Text('Your value is 3.14'),
                    actions: <Widget>[
                      FlatButton(onPressed: () {Navigator.pop(context);
                      },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }else if(value == '3'){
              await showDialog<void>(
                  context: context,
                  builder:  (BuildContext) {
                    return AlertDialog(
                        title: const Text('Great!'),
                        content:
                        Text('Your value is 3.142'),
                        actions: <Widget>[
                          FlatButton(onPressed: () {
                            Navigator.pop(context);
                          },
                            child: Text('OK'),
                          ),
                        ]);
                  });
            }   else {
              await showDialog<void>(
                  context: context,
                  builder:   (BuildContext) {
                    return AlertDialog(
                      title: const Text('Sorry'),
                      content:
                      Text('Unavailable at the moment'),
                    );
                  }
              );
            }
          })],
    ),
    ));


}}
