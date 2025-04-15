import 'package:sensors_plus/sensors_plus.dart';

class ActivityLoggerScreen extends StatefulWidget {
  @override
  _ActivityLoggerScreenState createState() => _ActivityLoggerScreenState();
}

class _ActivityLoggerScreenState extends State<ActivityLoggerScreen> {
  double _magnitude = 0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      final magnitude =
          event.x * event.x + event.y * event.y + event.z * event.z;
      setState(() => _magnitude = magnitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Motion Detected: $_magnitude"));
  }
}
