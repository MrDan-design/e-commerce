import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/providers/add_to_cart_provider.dart';
import 'package:flutter_application_1/screen/cart/cart_checkout.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final cartItemsList = provider.cart;

    // Adjust cart quantity
    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(
            () {
              icon == Icons.add
                  ? provider.incrementQty(index)
                  : cartItemsList[index].quantity == 1
                      ? cartItemsList.removeAt(index)
                      : provider.decrementQty(index);
            },
          );
        },
        child: Icon(icon, size: 20),
      );
    }

    return Scaffold(
        appBar: CustomAppBar(),
        bottomSheet: CheckOutBox(),
        body: Column(
          children: [
            // custom appbar
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       IconButton(
            //         style: IconButton.styleFrom(
            //           backgroundColor: Colors.white,
            //           padding: const EdgeInsets.all(15),
            //         ),
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.arrow_back_ios,
            //         ),
            //       ),
            //       const Text(
            //         "My Cart",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 25,
            //         ),
            //       ),
            //       const SizedBox()
            //     ],
            //   ),
            // ),

            // body
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartItemsList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItemsList[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // product image
                                  Container(
                                    height: 100,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: kcontentColor,
                                    ),
                                    // padding: const EdgeInsets.all(20),
                                    child: Image.asset(cartItem.image),
                                  ),
                                  const SizedBox(width: 10),

                                  // product details
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        cartItem.category,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey.shade400),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "\$${cartItem.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Controll buttons
                              Column(
                                children: [
                                  // for remove items
                                  IconButton(
                                    onPressed: () {
                                      // for remove ites for cart
                                      cartItemsList.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                  // for items quantity
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: kcontentColor,
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        productQuantity(Icons.remove, index),
                                        const SizedBox(width: 10),
                                        Text(
                                          cartItem.quantity.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        productQuantity(Icons.add, index),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 280),
          ],
        ));
  }
}
