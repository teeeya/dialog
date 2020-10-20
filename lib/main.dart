import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Testing Dialogs",
      home: TestDialog(),
    );
  }
}

class TestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final longList = List<Widget>.generate(100, (i) => Text("Item $i"));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello, World'),
        ),
        body: Column(
          children: [
            FlatButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Alert Dialog'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hey You! I love flutter!'),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    )
                  ],
                ),
              ),
              child: Text('press me'),
            ),
            FlatButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Alert Dialog'),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: longList),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: Text('press me'),
            ),
            FlatButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Alert Dialog'),
                      Flexible(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: longList.length,
                          itemBuilder: (context, index) => longList[index],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: Text('press me'),
            ),
          ],
        ),
      ),
    );
  }
}
