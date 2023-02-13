import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/base/custom_button.dart';
import 'package:my_portfolio/widgets/base/custom_textfield.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  final contactFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Contact",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Feel free to Contact me by submitting the form below and I will get back to you as soon as possible",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: size.width * 0.7,
          color: Colors.white,
          child: Form(
              key: contactFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    label: 'Name',
                    hintText: 'Enter your name',
                  ),
                  CustomTextField(
                    controller: emailController,
                    label: 'Email',
                    hintText: 'Enter your email',
                  ),
                  CustomTextField(
                    controller: messageController,
                    label: 'Message',
                    hintText: 'Enter your message',
                    maxLines: 6,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      buttonText: "SUMBIT",
                      onTap: () {},
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
