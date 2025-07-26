import 'package:flutter/material.dart';

class InforTileWidget extends StatelessWidget {
  final String label;
  final String value;

  const InforTileWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
      child: Column(
        children: [
          Divider(thickness: 1),
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
              SizedBox(width: 35),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  letterSpacing: .7,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
