import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:taxi_baghdad/view/widgets/space_widget.dart';

class CreateAccountViaSites extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  const CreateAccountViaSites({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
  }) : super(key: key);
  static final List<Map> sitesAuthWidgets = [
    {
      "name": "google",
      "logo": SvgPicture.asset('Assets/svg/google.svg'),
    },
    {
      "name": "facebook",
      "logo": SvgPicture.asset('Assets/svg/facebook.svg'),
    },
    {
      "name": "apple",
      "logo": SvgPicture.asset('Assets/svg/apple.svg'),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vertical_space(10),
        Column(
          children: [
             Text(
              textAlign: TextAlign.center,
              firstTitle,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            vertical_space(5),
             Text(
              textAlign: TextAlign.center,
              secondTitle,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(119, 0, 0, 0)),
            ),
          ],
        ),
        vertical_space(10),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 90,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: sitesAuthWidgets.map((site) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 2.5,left: 2.5),
                  decoration: BoxDecoration(
                  color: Color(0xffF8F8FA),
                  borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SizedBox(height: 40,width: 40,child: site['logo']),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        vertical_space(20),
         Text(
                  textAlign: TextAlign.center,
                  thirdTitle,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(119, 0, 0, 0)),
                )
      ],
    );
  }
}
