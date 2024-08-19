import 'package:flutter_application_1/ButtonNavBar.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/add_to_cart_provider.dart';
import 'package:flutter_application_1/screen/cart/carts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final cartItemsList = provider.cart;

    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ButtonNavBar(title: '',),
            ),
          );
        },
        
        icon: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0,
              color: kprimaryColor,
            ),
            image: const DecorationImage(
              image: AssetImage(
                "images/applogo.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: kprimaryBackgroungColor,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kprimaryColor,
                ),
                child: Text(
                  cartItemsList.length.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        // Notification
        const SizedBox(width: 15),
        // IconButton(
        //   style: IconButton.styleFrom(
        //     backgroundColor: kprimaryBackgroungColor,
        //     padding: const EdgeInsets.all(10),
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => FavoritesScreen(),
        //       ),
        //     );
        //   },
        //   icon: const Icon(
        //     Icons.notifications_outlined,
        //     size: 30,
        //   ),
        // ),
        // const SizedBox(width: 15),
        // Popup menu
        PopupMenuButton(
          offset: const Offset(0, 60),
          color: Colors.grey[100],
          elevation: 10,
          child: Container(
            alignment: Alignment.center,
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 5),
            decoration: const BoxDecoration(
              color: kprimaryBackgroungColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black54,
                ),
              ],
            ),
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                height: 16,
                padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin, color: kprimaryColor, size: 18),
                    SizedBox(width: 5),
                    Text(
                      "Update Profile ",
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                height: 16,
                padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
                child: Row(
                  children: [
                    Icon(Icons.edit, color: kprimaryColor, size: 24),
                    SizedBox(width: 5),
                    Text(
                      "My Appointments",
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                height: 16,
                padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: kprimaryColor, size: 24),
                    SizedBox(width: 5),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 3,
                height: 16,
                padding: EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
                child: Row(
                  children: [
                    Icon(Icons.delete_outline_outlined, color: kprimaryColor, size: 24),
                    SizedBox(width: 5),
                    Text(
                      'Delete Account',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 0) {
              // update profile
              print('Update profile');
            } else if (value == 1) {
              // My Appointments
              print('Second item');
            } else if (value == 2) {
              // logout
              print('Logout');
            } else if (value == 3) {
              // Delete My Account
              print('Delte Account');
            }
          },
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}