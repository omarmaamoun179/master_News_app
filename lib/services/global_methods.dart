import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';

class GlobalMethods {
  static String formatDate(String publishedAt) {
    final parsedDate = DateTime.parse(publishedAt);
    String formatedDate = DateFormat("yyyy-MM-dd hh:mm:ss").format(parsedDate);
    DateTime publishedDate =
        DateFormat("yyyy-MM-dd hh:mm:ss").parse(formatedDate);
    return '${publishedDate.year}/ ${publishedDate.month}/ ${publishedDate.day} on ${publishedDate.hour} : ${publishedDate.minute}   ';
  }

  static Future<void> errorDialog(
      {required String errorMessage, required BuildContext context}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(errorMessage),
            title: Row(
              children: const [
                Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('An error occured'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
}
