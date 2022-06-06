import 'package:fit_kal/models/product.dart';
import 'package:fit_kal/utils/app_paddings.dart';
import 'package:fit_kal/views/product_detail_page.dart';
import 'package:fit_kal/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductBuilder extends StatelessWidget {
  final List<Product>? productModel;
  const ProductBuilder
({ Key? key,  required this.productModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GridView.builder(
            padding: AppPaddings().horizontalPaddingMin,
            itemCount: productModel!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: AppPaddings().paddingMin,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                                  selectedProduct: productModel![index],
                                )));
                  },
                  child: ProductCard(
                    product: productModel![index],
                  ),
                ),
              );
            },
          );
  }
}