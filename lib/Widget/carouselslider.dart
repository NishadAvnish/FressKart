import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int _currentCarouselIndex;
  PageController _pagecontroller;
  Timer _timer;
  int _start = 0;
  List<String> _carouselItem = [
    "assets/Images/fruits.png",
    "assets/Images/veggies.png",
    "assets/Images/fruits.png",
    "assets/Images/fruits.png",
    "assets/Images/veggies.png",
    "assets/Images/fruits.png",
    "assets/Images/fruits.png",
  ];

  @override
  void initState() {
    _currentCarouselIndex = 0;
    _pagecontroller = PageController(initialPage: _currentCarouselIndex);

    startTimer(_start);
    super.initState();
  }

  void startTimer(int timerDuration) {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _start = timerDuration;
    });

    _timer = new Timer.periodic(
      Duration(milliseconds: 4000),
      (Timer timer) => setState(
        () {
          setState(() {
            _currentCarouselIndex += 1;

            _currentCarouselIndex =
                _currentCarouselIndex % _carouselItem.length;
          });
          _pagecontroller.animateToPage(_currentCarouselIndex,
              duration: Duration(milliseconds: 600), curve: Curves.decelerate);
        },
      ),
    );
  }

  Future<void> pauseTimer() async {
    if (_timer != null) _timer.cancel();
    await Future.delayed(Duration(seconds: 5));
    startTimer(_start);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.2,
      width: _size.width,
      constraints: BoxConstraints(
        maxHeight: 162,
        minHeight: 100,
      ),
      decoration: BoxDecoration(color: Colors.white),
      child: GestureDetector(
        onHorizontalDragCancel: () {
          pauseTimer();
        },
        child: GestureDetector(
          onTap: () {
            pauseTimer();
          },
          child: PageView.builder(
            controller: _pagecontroller,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            itemCount: _carouselItem.length,
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.tight,
                      child: Image.asset(
                        _carouselItem[index],
                        fit: BoxFit.contain,
                      )),
                  Flexible(
                      flex: 2,
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                  text: "Welcome You to FreshKart\n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Fresh Vegetables and Goods",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic))
                            ]),
                      )))
                ],
              );
            },
            onPageChanged: (int index) {
              _currentCarouselIndex = index;
            },
          ),
        ),
      ),
    );
  }
}
