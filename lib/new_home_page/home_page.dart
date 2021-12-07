import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp2/BMICalculator/input_page.dart';
import 'package:myapp2/GoogleMap/map.dart';
import 'package:myapp2/MainPage/search.dart';
import 'package:myapp2/MainPage/settings.dart';
import 'package:myapp2/NoteApp/screens/taskscreen.dart';
import 'package:myapp2/PaintApp/paint.dart';
import 'package:myapp2/TextRecognition/text_recognition.dart';
import 'package:myapp2/TimeApp/home.dart';
import 'package:myapp2/Weather_app/weather_runner.dart';
import 'package:myapp2/calculatorApp/calculatar.dart';
import 'package:myapp2/chatdir/chat_app.dart';
import 'package:myapp2/colors.dart';
import 'package:myapp2/components_of_music_app/music_player.dart';
import 'package:myapp2/services/world_time.dart';
import 'package:video_player/video_player.dart';
import '../BauncyPageRoute.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/back.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller!.play();
        _controller!.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(

            toolbarHeight: 70.0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: const ChatApp()));
                },
                icon: const Icon(Icons.chat),
              ),
              IconButton(
                  onPressed: () async {
                    showSearch(context: context, delegate: WidgetSearch());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: Settings()));
                  },
                  icon: const Icon(Icons.settings)),
            ],
            backgroundColor: dark,
            // centerTitle: true,
            // title: const Text(
            //   "Simple App",
            //   style: TextStyle(fontSize: 30.0),
            // ),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              const DrawerHeader(
                child: Text(
                  "Apps",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(color: dark),
              ),
              ListTile(
                  title: const Text("Time"),
                  leading: const Icon(Icons.access_time),
                  onTap: (){
                    Navigator.push(context, BouncyPageRoute(widget: const Home()));
                  }),
              ListTile(
                  title: const Text("Weather"),
                  leading: const Icon(Icons.cloud),
                  onTap: () {
                    Navigator.push(context, BouncyPageRoute(widget: Weather()));
                  }),
              ListTile(
                  title: const Text("BMI Calculator"),
                  leading: const Icon(Icons.accessibility_new_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: const InputPage()));
                  }),
              ListTile(
                  title: const Text("Music Player"),
                  leading: const Icon(Icons.music_note_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: const MusicApp()));
                  }),
              ListTile(
                  title: const Text("Note"),
                  leading: const Icon(Icons.sticky_note_2_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: const TasksScreen()));
                  }),
              ListTile(
                  title: const Text("Map"),
                  leading: const Icon(Icons.map_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: MapScreen()));
                  }),
              ListTile(
                  title: const Text("Text Recognition"),
                  leading: const Icon(Icons.text_fields_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: TextRecognition()));
                  }),
              ListTile(
                  title: const Text("Paint"),
                  leading: const Icon(Icons.color_lens_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: const PaintApp()));
                  }),
              ListTile(
                  title: const Text("Calculator"),
                  leading: const Icon(Icons.calculate_rounded),
                  onTap: () {
                    Navigator.push(
                        context, BouncyPageRoute(widget: CalculatorApp()));
                  }),
            ],
          )),
          body: Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller!.value.size.width,
                    height: _controller!.value.size.height,
                    child: VideoPlayer(_controller!),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  height: 60,
                  child: DefaultTextStyle(
                    style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('Bunch of useful apps'),
                        RotateAnimatedText('Live easily'),
                        RotateAnimatedText('Love sincerely'),
                        RotateAnimatedText('Create your own future'),
                      ],
                      repeatForever: true,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
