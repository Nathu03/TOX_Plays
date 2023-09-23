import 'package:flutter/material.dart';
import 'package:ym_flutter_integration/models/botEvents.dart';
import 'package:ym_flutter_integration/ym_flutter_integration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BotPage(),
        ));
  }
}

class BotPage extends StatefulWidget {
  static String routeName = "/BotPage";
  const BotPage({Key? key}) : super(key: key);
  @override
  _BotPageState createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  late YmFlutterIntegration ymFlutterIntegration;
  String botId = "x1587041004122";

  @override
  void initState() {
    super.initState();
    ymFlutterIntegration = YmFlutterIntegration();

    ymFlutterIntegration.setConfig(
        context: context,
        botId: botId,
        enableHistory: false,
        enableSpeech: false,
        enableCloseButton: true);

    ymFlutterIntegration.addPayload(key: "name", value: "Yellowmessenger");
    ymFlutterIntegration.addPayload(
        key: "desc", value: "A Conversational AI Platform");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: ymFlutterIntegration.getBotWidget(
              botEventListener: (BotEvent botEvent) {
                switch (botEvent.code) {
                  case "choosen_other_option":
                    print("code is ${botEvent.code}, data is ${botEvent.data}");
                    break;
                  default:
                    print("No data");
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
