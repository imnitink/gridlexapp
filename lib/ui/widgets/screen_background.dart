import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../constants/query.dart';

class ScreenBackground extends StatelessWidget {
  final double? backgroundHeight;
  final Widget child;
  final Future<void> Function()? onRefresh;
  final Widget? floatingActionButton;
  const ScreenBackground(
      {Key? key,
        required this.child,
        this.onRefresh,
        this.backgroundHeight,
        this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        body: RefreshIndicator(
          onRefresh: onRefresh ?? () async {},
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: deviceHeight(context) * 0.5,
                  left: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent.withOpacity(0.25),
                    radius: 300,
                  ),
                ),
                GlassmorphicContainer(
                  width: deviceWidth(context),
                  blur: 50,
                  height: backgroundHeight ?? deviceHeight(context),
                  borderRadius: 0,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.2),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                ),
                child
              ],
            ),
          ),
        ),
      ),
    );
  }
}
