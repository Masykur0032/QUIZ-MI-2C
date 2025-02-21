import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<String> listViewItem = List<String>();
  int max = 1;
  int min = 6;
  int stat1 = 0, stat2 = 0, stat3 = 0, stat4 = 0, stat5 = 0, stat6 = 0;
  Random random = new Random();
  void _incrementCounter() {
    setState(() {
      _counter = random.nextInt(6);
      _counter++;

      listViewItem.add(_counter.toString());

      if (_counter == 1)
        stat1 += 1;
      else if (_counter == 2)
        stat2 += 1;
      else if (_counter == 3)
        stat3 += 1;
      else if (_counter == 4)
        stat4 += 1;
      else if (_counter == 5)
        stat5 += 1;
      else if (_counter == 6) stat6++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            Text("RIWAYAT"),
            Expanded(
              child: ListView.builder(
                itemCount: listViewItem.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      listViewItem[index],
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
              children: [
                Text("STATISTIK"),
                Text("Angka 1 muncul sebanyak : " + "$stat1 kali"),
                Text("Angka 2 muncul sebanyak : " + "$stat2 kali"),
                Text("Angka 3 muncul sebanyak : " + "$stat3 kali"),
                Text("Angka 4 muncul sebanyak : " + "$stat4 kali"),
                Text("Angka 5 muncul sebanyak : " + "$stat5 kali"),
                Text("Angka 6 muncul sebanyak : " + "$stat6 kali")
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
