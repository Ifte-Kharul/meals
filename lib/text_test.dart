import 'package:flutter/material.dart';

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'test1',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'test2',
              style: TextStyle(fontFamily: 'Raleway', fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
