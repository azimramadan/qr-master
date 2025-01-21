import 'package:flutter/widgets.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(51, 51, 51, 0.84),
        image: DecorationImage(
          image: AssetImage('assets/images/Group 786.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
