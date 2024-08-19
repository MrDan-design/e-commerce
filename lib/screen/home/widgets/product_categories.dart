import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/category_models.dart';
import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatefulWidget {
  const ProductCategoryWidget({super.key});

  @override
  State<ProductCategoryWidget> createState() => _ProductCategoryWidgetState();
}

class _ProductCategoryWidgetState extends State<ProductCategoryWidget> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          CategoryModel category = categoriesList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedCategory == index
                    ? kprimaryColor
                    : category.backgroundColor,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(category.image), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selectedCategory == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
