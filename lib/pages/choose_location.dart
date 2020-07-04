import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<worldtime> locations = [
    worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldtime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    worldtime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
  ];

  void updateTime(index) async {
    worldtime instance = locations[index];
    await instance.getTime();

    // novget to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
