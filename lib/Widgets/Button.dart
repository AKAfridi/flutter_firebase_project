import 'package:flutter/material.dart';
class Button_Round extends StatelessWidget {
  Button_Round({super.key, required this.title, required this.OnTap, this.loading=false});
  final String title;
  final VoidCallback OnTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: OnTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal
          ),
          child: Center(child:loading? CircularProgressIndicator():Text(title,style: const TextStyle(fontSize: 16),)),
        ),
      );
  }
}
