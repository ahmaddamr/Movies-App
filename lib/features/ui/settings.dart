
import 'package:flutter/material.dart';
import 'package:movies_app/core/constans.dart';
import 'package:movies_app/core/widgets/bottom_sheet.dart';



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Settings:',
            style: Apptheme.appBarTextLarge,
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              bottomSheet(context);
            },
            child: Container(
              width: 250,
              height: 30,
              decoration: BoxDecoration(
                // color: Colors.grey,
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Choose A language',
                textAlign: TextAlign.center,
                style: Apptheme.appBarTextSmall,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SettingsBottomSheet();
      },
    );
  }
}
