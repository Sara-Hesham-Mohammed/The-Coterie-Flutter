import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme buildCustomTextTheme() {
  return TextTheme(
    // Display Styles (DM Serif)
    displayLarge: GoogleFonts.dmSerifDisplay(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF082563), // Dark blue
      height: 1.12,
    ),
    displayMedium: GoogleFonts.dmSerifDisplay(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF082563),
      height: 1.15,
    ),
    displaySmall: GoogleFonts.dmSerifDisplay(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF082563),
      height: 1.22,
    ),

    // Headline Styles (DM Serif)
    headlineLarge: GoogleFonts.dmSerifDisplay(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF082563),
      height: 1.25,
    ),
    headlineMedium: GoogleFonts.dmSerifDisplay(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF082563),
      height: 1.29,
    ),
    headlineSmall: GoogleFonts.dmSerifDisplay(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF082563),
      height: 1.33,
    ),

    // Title Styles (DM Sans)
    titleLarge: GoogleFonts.dmSans(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF082563),
      height: 1.27,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF082563),
      height: 1.25,
    ),
    titleSmall: GoogleFonts.dmSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF082563),
      height: 1.43,
    ),

    // Body Styles (DM Sans)
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF1A1A1A), // Dark text
      height: 1.5,
    ),
    bodyMedium: GoogleFonts.dmSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF1A1A1A),
      height: 1.43,
    ),
    bodySmall: GoogleFonts.dmSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6C757D), // Gray text
      height: 1.33,
    ),

    // Label Styles (DM Sans - for buttons)
    labelLarge: GoogleFonts.dmSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white, // For buttons on primary color
      height: 1.0,
      letterSpacing: 0.5,
    ),
    labelMedium: GoogleFonts.dmSans(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.0,
      letterSpacing: 0.25,
    ),
    labelSmall: GoogleFonts.dmSans(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6C757D),
      height: 1.0,
      letterSpacing: 0.4,
    ),
  );
}