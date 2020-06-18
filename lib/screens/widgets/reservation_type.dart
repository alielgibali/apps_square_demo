import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovola_demo/models/reverse_details.dart';

class ReservationType extends StatelessWidget {
  final ReservTypes reverseType;
  ReservationType({
    this.reverseType,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'SAR ${reverseType.price}',
          style: GoogleFonts.lato(
            color: Colors.grey,
          ),
        ),
        Text(
          reverseType.name,
          style: GoogleFonts.lato(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
