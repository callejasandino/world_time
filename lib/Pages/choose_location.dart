import 'dart:developer';
import 'package:world_time/Services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'the united kingdom of great britain and northern ireland'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya'),
    WorldTime(url: 'Asia/Manila', location: 'Philippines', flag: 'philippines'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'the united states of america'),
    WorldTime(
        url: 'Asia/Seoul', location: 'Seoul', flag: 'the republic of korea'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya'),
    WorldTime(url: 'Asia/Manila', location: 'Philippines', flag: 'philippines'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'the united states of america'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Choose a Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/', arguments: {
                  'location': locations[index].location,
                  'flag': locations[index].flag,
                  'url': locations[index].url,
                });
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://countryflagsapi.com/png/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
