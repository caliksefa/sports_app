import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color krem = Color(0xFFFFFDE7); // Zemin
  static const Color acikKahve = Color(0xFFD7CCC8); // Kart arka planı
  static const Color cikolata = Color(0xFF5D4037); // AppBar, başlıklar
  static const Color bej = Color(0xFFEFEBE9); // Detay alanlar
  static const Color altinSari = Color(0xFFFFD54F); // Vurgu rengi
}

class AppTextStyles {
  static final baslik = GoogleFonts.raleway(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.cikolata,
  );

  static final not = GoogleFonts.raleway(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static final tamamlandi = GoogleFonts.raleway(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );
}
