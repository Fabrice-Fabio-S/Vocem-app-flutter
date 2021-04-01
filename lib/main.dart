import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Vocem App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
  }

  Future speakParams() async {
    //langues
    await flutterTts.setLanguage("en-US");
    // await flutterTts.setLanguage("ja-JP");
    await flutterTts.setLanguage("fr-FR");

    //voices
    // await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});
    await flutterTts.setVoice({"name": "Thomas", "locale": "fr-FR"});
    // await flutterTts.setVoice({"name": "Daniel", "locale": "en-GB"});

  }

  Future speak() async{
    // print(await flutterTts.getVoices);
    // print(await flutterTts.getLanguages);
    await speakParams();
    // await flutterTts.speak("Hey Fabio welcome. It's you're friend Voçem");
    await flutterTts.speak("Bonjour et bienvenue Mr Fabio. Voçem pour te servir.");
    await flutterTts.speak("Ceci est le début d'une grande avanture. Nous ferons de grande chose ensemble");
    await flutterTts.speak("J'espère que vous êtes prêts à changer le monde.");

    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future pause() async{
    print("pause");
    await flutterTts.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // alignment: Alignment.topLeft,
                  child: Image.asset("assets/Vocem.jpeg", width: 200,)
              ),
              SizedBox(height: 30,),
              Text("Votre voix porte", style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              OutlinedButton(
                child: Text("Welcome"),
                onPressed: ()=>speak(),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue[200]),
                ),
              ),
              OutlinedButton(
                child: Text("Pause"),
                onPressed: ()=>pause(),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.red[200]),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
