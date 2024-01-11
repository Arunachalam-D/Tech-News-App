import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsText extends StatelessWidget {
  final Color color;
  final String text;
  const NewsText( {super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color:color),
    );
  }
}
