import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(const MaterialApp(home: Loading()));

class Loading extends StatefulWidget {
  const Loading({Key? key, this.location, this.flag, this.url})
      : super(key: key);

  final String? location;
  final String? flag;
  final String? url;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: widget.location!, flag: widget.flag!, url: widget.url!);
    await instance.getTime();

    print(instance);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

    // setState(() {
    time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: const Center(
          child: SpinKitDualRing(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
