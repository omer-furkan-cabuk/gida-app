import 'package:fit_kal/data/data.dart';
import 'package:fit_kal/enum/preferences_key.dart';
import 'package:fit_kal/models/product.dart';
import 'package:fit_kal/utils/app_colors.dart';
import 'package:fit_kal/utils/app_paddings.dart';
import 'package:fit_kal/utils/utils.dart';
import 'package:fit_kal/widgets/nutritional_data_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  final Product selectedProduct;

  const ProductDetailPage({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGround,
      body: Column(children: [
        const DetailAppbar(),
        Card(
          elevation: 8,
          child: Container(
            color: Colors.white,
            height: DeviceSize().deviceHeight(context) * 0.35,
            width: DeviceSize().deviceHeight(context) * 0.35,
            padding: AppPaddings().paddingMin,
            child: Image.network(
              widget.selectedProduct.image,
              height: DeviceSize().deviceHeight(context) * 0.3,
            ),
          ),
        ),
        Padding(
          padding: AppPaddings().paddingMediumOnlyTop,
          child: Text(
            widget.selectedProduct.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        Text(
          widget.selectedProduct.productDetail.gram,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        Expanded(
          child: Padding(
            padding: AppPaddings().paddingMediumOnlyTop,
            child: SingleChildScrollView(
              child: ExpansionTile(
                iconColor: Colors.black,
                textColor: Colors.black,
                title: const Text(
                  "Besin Değerleri ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                children: [
                  /* Divider(
                    thickness: 1,
                    color: Colors.black38,
                  ), */
                  NutritionalDataText(
                    title: "Enerji (kcal)",
                    value: widget.selectedProduct.productDetail.calories,
                  ),
                  NutritionalDataText(
                    title: "Şeker (g)",
                    value: widget.selectedProduct.productDetail.sugar,
                  ),
                  NutritionalDataText(
                    title: "Yağ (g)",
                    value: widget.selectedProduct.productDetail.fat,
                  ),
                  NutritionalDataText(
                    title: "Karbonhidrat (g)",
                    value: widget.selectedProduct.productDetail.carbohydrate,
                  ),
                  NutritionalDataText(
                    title: "Lif (g)",
                    value: widget.selectedProduct.productDetail.fiber,
                  ),
                  NutritionalDataText(
                    title: "Protein (g)",
                    value: widget.selectedProduct.productDetail.protein,
                  ),
                ],
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: _changeFavorite,
          backgroundColor: AppColors.kOrange,
          child: Icon(
            isFavorite
                ? Icons.favorite_outlined
                : Icons.favorite_border_outlined,
            color: AppColors.kYellow,
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }

  void _changeFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    Data.updateProduct(widget.selectedProduct);
    /* await Future.delayed(const Duration(milliseconds: 1000));
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String favoritesString =
        pref.getString(PreferencesKeys.favorites.toString()) ?? '';
    List favoritesList = favoritesString.split(',').toSet().toList();
    favoritesList.add(widget.selectedProduct.id);

    var savedFavorites = favoritesList.join(',');
    await pref.setString(PreferencesKeys.favorites.toString(), savedFavorites); */
  }
}

class DetailAppbar extends StatelessWidget {
  const DetailAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: AppColors.kOrange,
          height: DeviceSize().deviceHeight(context) * 0.11,
          width: double.infinity,
        ),
        Image.asset(
          "assets/logo_transparent.png",
          width: DeviceSize().deviceHeight(context) * 0.15,
        ),
        Positioned(
          left: DeviceSize().deviceWidth(context) * 0.03,
          top: DeviceSize().deviceHeight(context) * 0.055 - 12,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kYellow,
            ),
          ),
        ),
      ],
    );
  }
}
