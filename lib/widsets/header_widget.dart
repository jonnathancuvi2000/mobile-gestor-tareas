import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const HeaderWidget({super.key, required this.title, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            alignment: Alignment.topLeft,
            // color: Colors.amber,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 5,
            // color: Colors.red,
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
