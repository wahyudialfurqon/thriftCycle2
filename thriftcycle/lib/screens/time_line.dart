import 'package:flutter/material.dart';
import '../wigedts/steps_screen.dart';

class TimeLine extends StatefulWidget {
  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  PageController _controller = PageController(initialPage: 0);
  dynamic _totalProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _totalProgress = _controller.page;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: PageView(
          children: [],
        )),
        StepsProgress(steps: 3, progress: 3),
      ]),
    );
  }
}
