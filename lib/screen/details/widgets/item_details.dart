import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: widget.product.title,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: '\$${widget.product.price}',
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                      // Rating
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kprimaryColor,
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                TextWidget(
                                  text: widget.product.rate.toString(),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextWidget(
                            text: widget.product.review,
                            fontSize: 15,
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                          text: 'Seller: ', style: TextStyle(fontSize: 16)),
                      TextSpan(
                        text: widget.product.seller,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // product avaliable colors
          const TextWidget(
            text: 'Colors',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 5),
          Row(
            children: List.generate(
              widget.product.colors.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentColor == index
                          ? Colors.white
                          : widget.product.colors[index],
                      border: currentColor == index
                          ? Border.all(
                              color: widget.product.colors[index], width: 2.0)
                          : null,
                    ),
                    padding:
                        currentColor == index ? const EdgeInsets.all(4) : null,
                    margin: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.product.colors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Description part
          DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  dividerColor: Colors.transparent,
                  labelPadding: const EdgeInsets.only(right: 7),
                  indicator: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: kprimaryColor),
                        ),
                        child: const Center(
                          child: TextWidget(
                            text: 'Description',
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: kprimaryColor)),
                        child: const Center(
                          child: TextWidget(text: 'Specifications'),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: kprimaryColor)),
                        child: const Center(
                          child: TextWidget(text: 'Reviews'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      TextWidget(
                        text: widget.product.description,
                      ),
                      const TextWidget(
                        text: 'Specification details',
                      ),
                      const TextWidget(
                        text: 'All Reviews',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
