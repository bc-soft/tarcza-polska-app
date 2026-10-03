import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";

/// Jeden `ThemeData` (Material 3) w stylu „urzędowej” aplikacji. Tylko tryb jasny (MVP).
abstract final class AppTheme {
  static const radius = 14.0;

  static ThemeData light() {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: TarczaPalette.primary,
        ).copyWith(
          primary: TarczaPalette.primary,
          onPrimary: Colors.white,
          secondary: TarczaPalette.primaryDark,
          error: TarczaPalette.accentRed,
          surface: TarczaPalette.surface,
          onSurface: TarczaPalette.textPrimary,
          onSurfaceVariant: TarczaPalette.textSecondary,
          outline: TarczaPalette.outline,
          outlineVariant: TarczaPalette.outline,
          surfaceContainerLowest: Colors.white,
          surfaceContainerLow: TarczaPalette.background,
        );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: TarczaPalette.background,
      extensions: const [StatusColors.light],
    );

    final text = base.textTheme.apply(
      bodyColor: TarczaPalette.textPrimary,
      displayColor: TarczaPalette.heading,
    );

    final buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
    const buttonSize = Size.fromHeight(54);
    const buttonText = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    return base.copyWith(
      textTheme: text.copyWith(
        headlineSmall: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        titleLarge: text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        titleMedium: text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        bodyLarge: text.bodyLarge?.copyWith(height: 1.4),
        bodyMedium: text.bodyMedium?.copyWith(height: 1.4),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: TarczaPalette.background,
        foregroundColor: TarczaPalette.heading,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: TarczaPalette.heading,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(color: TarczaPalette.outline),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonText,
          backgroundColor: TarczaPalette.primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonText,
          foregroundColor: TarczaPalette.primary,
          side: const BorderSide(color: TarczaPalette.primary, width: 1.5),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: TarczaPalette.primary,
          textStyle: buttonText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: TarczaPalette.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: TarczaPalette.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: TarczaPalette.primary, width: 2),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: TarczaPalette.primary.withValues(alpha: 0.12),
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            fontSize: 12,
            fontWeight: states.contains(WidgetState.selected) ? FontWeight.w700 : FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? TarczaPalette.primary
                : TarczaPalette.textSecondary,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? TarczaPalette.primary
                : TarczaPalette.textSecondary,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      dividerTheme: const DividerThemeData(color: TarczaPalette.outline, space: 1),
      // M3 domyślnie rysuje wyłączony thumb kolorem `outline` — przy naszym jasnym
      // `outline` był niewidoczny na jasnym torze.
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? Colors.white : TarczaPalette.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? TarczaPalette.primary
              : TarczaPalette.background,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? TarczaPalette.primary
              : TarczaPalette.textSecondary,
        ),
      ),
    );
  }
}
