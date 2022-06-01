import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home(
      {Key? key, this.flag, this.location, this.time, this.isDayTime = false})
      : super(key: key);
  final String? flag;
  final String? location;
  final String? time;
  final bool isDayTime;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String bgImage = widget.isDayTime ? 'day.png' : 'night.png';

    Color? bgColor = widget.isDayTime ? Colors.orange : Colors.grey[900];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.location!,
          style: TextStyle(
              fontSize: 28.0, letterSpacing: 2.0, color: Colors.grey[50]),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://countryflagsapi.com/png/${widget.flag}"),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Time now:',
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[50]),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.time!,
                      style: TextStyle(
                          fontSize: 66.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[50]),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/location'),
                      icon: const Icon(Icons.edit_location),
                      label: const Text(
                        'Choose Location',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
