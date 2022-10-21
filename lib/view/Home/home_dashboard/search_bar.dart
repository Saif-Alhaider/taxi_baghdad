import 'package:flutter/material.dart';
import 'package:taxi_baghdad/themes/main_colors.dart';
import 'package:taxi_baghdad/view/widgets/custom_text.dart';
import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 60,
      decoration: BoxDecoration(
        color: MainColors.ghostseeker,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0,0)
          )
        ],
      ),
      child: Row(
        children: [
          horizontal_space(5),
          const Icon(
            Icons.search,
            size: 30,
            color: Colors.blue,
          ),
          horizontal_space(5),
          const CustomText(
            text: "حدد وجهتك ...",
            size: 20,
          )
        ],
      ),
    );
  }
}
