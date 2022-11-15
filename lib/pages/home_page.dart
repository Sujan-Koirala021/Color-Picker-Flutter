import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => globals.pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 38, 38, 0.4),
        title: const Center(
          child: Text('Color Picker'),
        ),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //  Draw Heart Shape
          CustomPaint(
            size: const Size(200, 210),
            painter: HeartPainter(),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(38, 49, 88,1)),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: const Text(
                      'Pick a color!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        enableAlpha: false,
                        pickerColor: globals.pickerColor,
                        onColorChanged: changeColor,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Got it',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        onPressed: () {
                          setState(
                              () => globals.currentColor = globals.pickerColor);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },

                // raise the [showDialog] widget
              );
            },
            child: const Text('Pick Color'),
          )
        ]),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1
      ..color = globals.currentColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
