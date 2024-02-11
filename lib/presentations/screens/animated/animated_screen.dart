import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const String name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
    final random = Random(); 
    width = random.nextInt(300).toDouble() + 50;
    height = random.nextInt(300).toDouble() + 50;
    borderRadius = random.nextInt(100).toDouble() + 2;
    color = Color.fromRGBO(
      random.nextInt(256), 
      random.nextInt(256), 
      random.nextInt(256), 
      1,
    );
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: width,
          height: height,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: color, 
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:changeShape,
        child: const Icon(Icons.play_arrow),
      )
    );
  }
}