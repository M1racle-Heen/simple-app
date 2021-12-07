// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myapp2/BauncyPageRoute.dart';
import 'package:myapp2/TimeApp/choose_loc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp2/services/world_time.dart';
import '/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTime data = WorldTime(location: 'Almaty', flag:'flags/kz.png', url: "Asia/Almaty");
  String time = "";
  late bool isDayTime;

  @override
  void initState(){
    super.initState();
    getTime();
  }

  Future<void> getTime() async{
    await data.getTime();
    setState((){
      time = data.time;
      isDayTime = data.isDayTime;
    });
  }

  @override
  Widget build(BuildContext context) {


    String bgImage = data.isDayTime ? 'day.png' : 'night.png';
    Color bgColor = data.isDayTime ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Time App",
          style: GoogleFonts.raleway(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.push(context,
                        BouncyPageRoute(widget: const ChooseLocation()));
                    setState(() {
                      data.location = result['location'];
                      data.time = result['time'];
                      time = result['time'];
                      data.isDayTime = result['isDayTime'];
                      isDayTime = result['isDayTime'];
                      data.flag = result['flag'];
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    size: 40,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    "Change location",
                    style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 30
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data.location,
                      style: GoogleFonts.barlow(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2.0,
                        color: yellow,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 66.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
