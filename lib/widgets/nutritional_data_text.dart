
import 'package:fit_kal/utils/app_colors.dart';
import 'package:fit_kal/utils/app_paddings.dart';
import 'package:flutter/material.dart';

class NutritionalDataText extends StatelessWidget {
  final String title;
  final String value;

  const NutritionalDataText({Key? key,  required this.title,required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kBackGround,
      elevation: 1,
      child: Padding(
        padding: AppPaddings().paddingMin,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                  
                  style: TextStyle(fontSize: 16),
                ),
                Text( value, style: TextStyle(fontSize: 16)),
              ],
            ),
            /*
            Divider(
              thickness: 1,
              color: Colors.black38,
            )
            */
          ],
        ),
      ),
    );
  }
}
