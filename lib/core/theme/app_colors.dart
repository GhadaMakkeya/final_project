import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color backgroundColor = Color(0xffF2EDE8);
  static const Color primaryColor = Color(0xFF1B2A4A);
  static const Color secondaryColor = Color(0xffD9B36E);
  static const Color productCardBackground = Color(0xffF2EDE8);
  static const Color authCardColor = Color.fromARGB(255, 253, 250, 250);
  static const Color transparent = Colors.transparent;

  // ── Core ─────────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1A1A1A);

  // ── Brand ────────────────────────────────────────────
  static const Color brown = Color(0xFF4E4639);
  static const Color brownLight = Color.fromARGB(255, 121, 95, 68);

  // ── Text ─────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF9E8E7E);
  static const Color textMuted = Color(0xFFAAAAAA);
  static const Color textPurple = Color(0xFF7B6FA0); // SEE ALL button

  // ── Product Card ─────────────────────────────────────
  static const Color productCardBorder = Color(0xFFE0D9D0);
  static const Color priceDiscounted = Color(0xFF1A1A1A);
  static const Color priceOriginal = Color(0xFFAAAAAA);
  static const Color limitedStock = Color(0xFFB94040);

  // ── Badges ───────────────────────────────────────────
  static const Color saleBadge = Color(0xFF1A1A1A);
  static const Color newBadge = Color(0xFFB94040);
  static const Color soldOutBadge = Color(0xFF6B6B6B);

  // ── Banner ───────────────────────────────────────────
  static const Color offerBannerBackground = Color(0xFF1B2A4A);

  // ── Category Chip ────────────────────────────────────
  static const Color chipSelected = Color(0xFF1A1A1A);
  static const Color chipUnselected = Color(0xFFFFFFFF);
  static const Color chipBorder = Color(0xFFD6CFC6);

  // ── Bottom Nav ───────────────────────────────────────
  static const Color bottomNavActive = Color(0xFF1B2A4A);
  static const Color bottomNavInactive = Color(0xFF9E8E7E);
  static const Color bottomNavBackground = Color(0xFFEFEBE6);

  // ── Divider ──────────────────────────────────────────
  static const Color divider = Color(0xFFD6CFC6);

  //------------------------------------

  // ── Profile Screen ───────────────────────────────────
  static const Color profileSectionLabel = Color.fromARGB(255, 78, 65, 52);
  static const Color profileUserName = Color(0xFF1A1A1A);
  static const Color profileUserEmail = Color(0xFF9E8E7E);

  // ── Settings Tile ────────────────────────────────────
  static const Color settingsTileBackground = Color.fromARGB(
    255,
    253,
    250,
    250,
  );
  static const Color settingsTileText = Color.fromARGB(255, 82, 68, 55);
  static const Color settingsTileArrow = Color.fromARGB(255, 82, 68, 55);

  // ── Theme Toggle ────────────────────────────────────
  static const Color themeToggleBackground = Color(0xFFE8E2DB);
  static const Color themeToggleActiveBackground = Color(0xFF1B2A4A);
  static const Color themeToggleActiveText = Color(0xFFFFFFFF);
  static const Color themeToggleInactiveText = Color(0xFF9E8E7E);
  static const Color grey200 = Color(0xFFE8E2DB);

  // -- add product field colors --

  static const Color formFieldFill = Color(0xFFFBF8F5);
}
