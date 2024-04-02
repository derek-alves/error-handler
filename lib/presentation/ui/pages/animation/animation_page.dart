import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

const defaultWidth = 100.0;

class _AnimationPageState extends State<AnimationPage> {
  bool _isZoomedIn = false;
  var _buttonTitle = 'Zoom in';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                curve: _curve,
                duration: const Duration(milliseconds: 370),
                width: _width,
                child: Image.asset('assets/images/wallpaper.jpg'),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  _isZoomedIn = !_isZoomedIn;
                  _buttonTitle = _isZoomedIn ? 'Zoom out' : 'Zoom in';
                  _width = _isZoomedIn
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceIn;
                },
              );
            },
            child: Text(_buttonTitle),
          )
        ],
      ),
    );
  }
}
