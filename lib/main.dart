import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '0',
                    style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                  ),
                ),
              ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(backgroundColor: Theme.of(context).primaryColorLight, foregroundColor: Theme.of(context).primaryColorDark, text: 'C'),
              CalculatorButton(backgroundColor: Theme.of(context).primaryColorLight, foregroundColor: Theme.of(context).primaryColorDark, text: '+/-'),
              CalculatorButton.Icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                icon: Icons.backspace,
                text: 'Backspace',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;

  CalculatorButton({super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text
  });

  CalculatorButton.Icon({super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: backgroundColor,
        child: Center(
            child: icon == null
                ? Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: foregroundColor),
            )
                : Icon(
              icon,
              color: foregroundColor,
            )
        ),
      ),
    );
  }
}
