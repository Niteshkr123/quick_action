import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quick Actions',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  QuickActions quickActions = QuickActions();

  _navigate(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  void initState() {
    super.initState();
    quickActions.initialize((String shortcutType) {
      switch (shortcutType) {
        case 'ironman':
          return _navigate(IronMan());
        case 'spiderman':
          return _navigate(SpiderMan());

        default:
          return MaterialPageRoute(builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No Page defined for $shortcutType'),
              ),
            );
          });
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(type: 'ironman', localizedTitle: 'Tony Stark', icon: 'iron'),
      ShortcutItem(
          type: 'spiderman', localizedTitle: 'Peter Parker', icon: 'spider'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avenger Assemble'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to Marvel Page',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class IronMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tony Stark'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('LOVE YOU 3000',
        style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}

class SpiderMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peter Parker'),
        centerTitle: true,
      ),
      body: const Center(
        widthFactor: 3.0,
        child: Text("Just Don't Do Anything I Would Do..\nAnd Definitely Don't Do Anything I Wouldn't Do",
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}
