import 'package:flutter/material.dart';

class WideTextButtonWidget extends StatelessWidget {
  const WideTextButtonWidget({
    super.key,
    required GlobalKey<FormState> signInKey,
  }) : _signInKey = signInKey;

  final GlobalKey<FormState> _signInKey;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          if (_signInKey.currentState!.validate()) {
            debugPrint('form validated');
            // onSubmittCliked(context);
          } else {
            debugPrint("form not vlidated");
          }
        },
        child: const Text("submit", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
