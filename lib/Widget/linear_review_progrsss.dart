import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LinearProgress extends StatefulWidget {
  final Color color;
  final int trail;
  final String heading;
  double progress;

  LinearProgress({Key key, this.color, this.heading, this.trail, this.progress})
      : super(key: key);

  @override
  _LinearProgressState createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  GlobalKey _globalKey;
  double _renderWidth;
  @override
  void initState() {
    super.initState();
    _globalKey = LabeledGlobalKey(widget.heading);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final RenderBox _renderObject =
          _globalKey.currentContext.findRenderObject();
      _renderWidth = _renderObject.size.width;
      setState(() {});
    });
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.heading,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: Colors.black54,
        ),
        SizedBox(width: 5),
        CustomPaint(
          child: Container(
            key: _globalKey,
            height: 8,
            width: _size.width * 0.3,
            constraints: BoxConstraints(maxWidth: 400, minWidth: 80),
          ),
          painter: _LinearPainter(widget.progress * animationController.value,
              widget.color, _renderWidth, widget.trail),
        ),
        SizedBox(width: 5),
        Text(
          widget.trail.toString(),
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontStyle: FontStyle.italic),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class _LinearPainter extends CustomPainter {
  var progress;
  Color color;
  final double renderWidth;
  final int persons;
  _LinearPainter(this.progress, this.color, this.renderWidth, this.persons);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, 5), Offset(size.width, 5), paint);
    if (persons > 0) {
      Paint coloredPaint = Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 4.0
        ..style = PaintingStyle.stroke;
      canvas.drawLine(
          Offset(0, 5), Offset(progress * renderWidth, 5), coloredPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
