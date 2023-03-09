import 'package:dop_logger/dop_logger.dart';
import 'package:flutter/material.dart';
import 'package:dialog_kit_widget/dialog_kit_widget.dart';

Future<void> main() async {
  await DopLogger.init(
    '',
    false,
    false,
    () => runApp(const MyApp()),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    DialogKitWidget.setContext = navigatorKey.currentContext!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                const _BottomSheet().openBottomSheet();
              },
              child: const Text('Open BottomSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                const _BottomSheet().openSimpleDialog();
              },
              child: const Text('Open Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheet extends DialogWidget {
  const _BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 2,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            100,
            (index) => Text(
              index.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColor
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
