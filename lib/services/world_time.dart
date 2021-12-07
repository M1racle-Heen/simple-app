import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag = "";
  String url = "";
  bool isDayTime = false;
  String pm = "";

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var response = await get(
          Uri.parse("http://www.worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);


      //get property from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(0, 3);

      //create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);


      pm = time.toString().substring(time.toString().length - 2, time.toString().length);

      isDayTime = (now.hour > 6 && pm == 'AM' && now.hour < 11) || (now.hour < 20 && pm == 'PM' && now.hour > 11) ? true : false;

    } catch (e) {
      time = 'could not get time data';
    }
  }
}
