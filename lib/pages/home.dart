import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  String bgimg;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    bgimg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color color = data['isDayTime'] ? Colors.blue : Colors.black45;
    Color text = data['isDayTime'] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: color,
     body :SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('images/$bgimg'),
            fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
      },
                  icon:Icon(
                      Icons.edit_location,
                    color:text,
                  ),
                  label:Text(
                      'Edit loaction',
                      style:TextStyle(
                        color:text,
                      ),
                  ),
    ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  data['location'],
                  style:TextStyle(
                  fontSize: 32.0,
                  letterSpacing: 2.0,
                    color:text
                  )
    )
            ],
            ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style:TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 2.0,
                    color:text
    )
    )


              ]),
          ),
        ),
    ));
  }
}
