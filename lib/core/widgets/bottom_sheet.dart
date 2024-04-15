import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/providers/myProvider.dart';
import 'package:provider/provider.dart';


class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   AppLocalizations.of(context)!.choose,
            //   style: GoogleFonts.aBeeZee(
            //       fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                provider.language('ar') ;
              },
              child: Text(
                'Arabic',
                style: provider.lang == 'ar' ?GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff39A552)):
                    GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold)
                    
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                provider.language('en') ;
              },
              child: Text(
                'English',
                style: provider.lang == 'en' ?GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff39A552)):
                    GoogleFonts.aBeeZee(
                    fontSize: 25, fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );
  }
}