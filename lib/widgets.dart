import 'package:flutter/material.dart';

Widget logo() {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: Colors.white, width: 5)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bar(),
        const SizedBox(height: 5),
        bar(),
        const SizedBox(height: 5),
        bar(),
      ],
    ),
  );
}

Widget bar() {
  return Container(
    height: 10,
    width: 60,
    transform: Matrix4.rotationZ(-.35),
    transformAlignment: Alignment.center,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
  );
}

Padding textField(
    TextEditingController controller, String hintText, Icon icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                color: Colors.grey.shade300,
                offset: const Offset(0, 3),
                spreadRadius: 3)
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 15, left: 25),
                hintText: hintText,
                border: InputBorder.none,
                prefixIcon: icon)),
      ),
    ),
  );
}
