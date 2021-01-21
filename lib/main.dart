import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  int _value = 0;

  void _add() => setState(() => _value++);

  void _remove() => setState(() => _value--);

  String _valueString = '';

  void _onClicked() => setState(() => _valueString = DateTime.now().toString());

  void _onClick(String value) => setState(() => _valueString = value);

  List<BottomNavigationBarItem> _items;
  int _indexNav = 0;
  String _valueIndex = '';

  @override
  void initState() {
    _items = new List();
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.people), label: 'People'));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.weekend), label: 'Weekend'));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.message), label: 'Message'));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Bar Title'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _remove)
        ],
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(
            icon: new Icon(Icons.timer), onPressed: () => _onClick('Button 1')),
        new IconButton(
            icon: new Icon(Icons.people),
            onPressed: () => _onClick('Button 2')),
        new IconButton(
            icon: new Icon(Icons.map), onPressed: () => _onClick('Button 3')),
      ],
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Drawer'),
              new RaisedButton(
                onPressed: _onClicked,
                child: new Text('Get Date'),
              ),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Close'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onClicked,
        backgroundColor: Colors.red,
        mini: true,
        child: new Icon(Icons.timer),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(
                  _value.toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 37.0),
                ),
                new Text(_valueString, style: new TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          )),
      bottomNavigationBar: new BottomNavigationBar(items: _items,
        fixedColor: Colors.blue,
        currentIndex: _indexNav,
        onTap: (int item) {
          setState(() {
            _indexNav = item;
            _valueIndex = 'Current index is $_indexNav';
          });
          }),
    );
  }
}
