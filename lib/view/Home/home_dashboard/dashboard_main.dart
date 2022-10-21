import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/widgets/custom_text.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: 240,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomText(
              text: "مرحبا بك",
              color:Color.fromARGB(150, 0, 0, 0),
              size: 20,
            ),
            vertical_space(10),
            const CustomText(text: "الى اين تريد الذهاب ؟",size: 25,fontWeight: FontWeight.bold,)
          ],
        ),
      ),
    );
  }
}
