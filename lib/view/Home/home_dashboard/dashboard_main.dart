import 'package:flutter/material.dart';
import 'package:taxi_baghdad/view/Home/home_dashboard/search_bar.dart';
import 'package:taxi_baghdad/view/widgets/custom_text.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          )),
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "مرحبا بك",
              color: Color.fromARGB(150, 0, 0, 0),
              size: 20,
            ),
            vertical_space(6),
            const CustomText(
              text: "الى اين تريد الذهاب ؟",
              size: 25,
              fontWeight: FontWeight.bold,
            ),
            vertical_space(20),
            SearchBar()
          ],
        ),
      ),
    );
  }
}
