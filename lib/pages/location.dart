import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {

    List<WorldTime> location = [
    WorldTime(location:'Maldives', url:'Indian/Maldives', flag:'day.jpg'),
    WorldTime(location:'Cairo', url:'Africa/Cairo', flag:'symbol.jpg'),
    WorldTime(location:'Cambridge_Bay', url:'America/Cambridge_Bay', flag:'symbol.jpg'),
    WorldTime(location:'Los_Angeles', url:'America/Los_Angeles', flag:'symbol.jpg'),
    WorldTime(location:'Yellowknife', url:'America/Yellowknife', flag:'symbol.jpg'),
    WorldTime(location:'Bangkok', url:'Asia/Bangkok', flag:'symbol.jpg'),
    WorldTime(location:'Dubai', url:'Asia/Dubai', flag:'symbol.jpg'),
    WorldTime(location:'Cape_Verde', url:'Atlantic/Cape_Verde', flag:'symbol.jpg'),
    WorldTime(location:'Sydney', url:'Australia/Sydney', flag:'symbol.jpg'),
    WorldTime(location:'Paris', url:'Europe/Paris', flag:'symbol.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title:Text('Add location'),
        centerTitle: true,
        elevation:0,
      ),
      body:ListView.builder(
        itemCount:location.length,
        itemBuilder:(context, index){
          return Card(
            child:ListTile(
              onTap: () async{
                WorldTime inst = WorldTime(location:location[index].location, flag:location[index].flag, url:location[index].url);
                await inst.getTime();
                Navigator.pushReplacementNamed(context, '/home',arguments: {'location':inst.location, 'flag':inst.flag, 'time':inst.time, 'isDayTime':inst.isDayTime});},
              title: Text(location[index].location),
              /*leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${location[index].flag}'),
    ),*/
          )
          );
    }
        )
    );
  }
}
