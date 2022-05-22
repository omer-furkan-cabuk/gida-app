import 'package:fit_kal/utils/app_colors.dart';
import 'package:fit_kal/utils/app_paddings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     
      Expanded(
        child: GridView.builder(
          padding: AppPaddings().horizontalPaddingMin,
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            
            return Padding(
              padding: AppPaddings().paddingMedium,
              child: InkWell(
                
                onTap: (){},

                child: Container(
                  height: 60,
                  width: 60,
                  
                  color: AppColors.kYellow.withOpacity(0.3),
                ),
              ),
            );
          },
        ),
      )
      
    ;
  }
}
