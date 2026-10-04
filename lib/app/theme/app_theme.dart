import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";

/// Jeden `ThemeData` (Material 3) w stylistyce panelu operatora: jasne tło z siatką,
/// karty z cienkim obrysem zamiast cienia, czerwień tylko jako sygnał i akcja główna.
abstract final class AppTheme {
  /// Karty i pola.
  static const radius = 12.0;

  /// Pigułki, odznaki, małe kafelki.
  static const radiusSm = 8.0;

  static ThemeData light() {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: TarczaPalette.primary,
        ).copyWith(
          primary: TarczaPalette.primary,
          onPrimary: Colors.white,
          primaryContainer: TarczaPalette.primaryLight,
          secondary: TarczaPalette.primaryDark,
          error: TarczaPalette.confirmed,
          onError: Colors.white,
          surface: TarczaPalette.surface,
          onSurface: TarczaPalette.textPrimary,
          surfaceContainerLowest: TarczaPalette.surface,
          surfaceContainerLow: TarczaPalette.background,
          surfaceContainer: TarczaPalette.surfaceHigh,
          surfaceContainerHigh: TarczaPalette.surfaceAlt,
          surfaceContainerHighest: TarczaPalette.surfaceAlt,
          onSurfaceVariant: TarczaPalette.textSecondary,
          outline: TarczaPalette.outline,
          outlineVariant: TarczaPalette.outline,
          inverseSurface: TarczaPalette.heading,
          onInverseSurface: TarczaPalette.surface,
        );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: TarczaFonts.body,
      // Tło rysuje `GridBackground` w `builder` aplikacji — `Scaffold` je przepuszcza.
      scaffoldBackgroundColor: Colors.transparent,
      canvasColor: TarczaPalette.background,
      splashFactory: InkSparkle.splashFactory,
      extensions: const [StatusColors.light],
    );

    final buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm));
    const buttonSize = Size.fromHeight(52);
    final buttonText = TarczaFonts.text(size: 14, weight: 700, letterSpacing: 0.4);

    return base.copyWith(
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: TarczaPalette.background,
        surfaceTintColor: Colors.transparent,
        foregroundColor: TarczaPalette.heading,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: TarczaPalette.textSecondary),
        actionsIconTheme: const IconThemeData(color: TarczaPalette.textSecondary),
        titleTextStyle: TarczaFonts.heading(size: 25, letterSpacing: 0.5),
      ),
      cardTheme: CardThemeData(
        color: TarczaPalette.surface,
        surfaceTintColor: Colors.transparent,
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
          foregroundColor: Colors.white,
          disabledBackgroundColor: TarczaPalette.surfaceAlt,
          disabledForegroundColor: TarczaPalette.textMuted,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonText,
          foregroundColor: TarczaPalette.textPrimary,
          backgroundColor: TarczaPalette.surfaceAlt,
          side: const BorderSide(color: TarczaPalette.outlineStrong),
          disabledForegroundColor: TarczaPalette.textMuted,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: TarczaPalette.primaryLight,
          textStyle: buttonText,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: TarczaPalette.textSecondary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: TarczaPalette.surfaceAlt,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        hintStyle: TarczaFonts.text(size: 15, color: TarczaPalette.textMuted),
        labelStyle: TarczaFonts.label(),
        floatingLabelStyle: TarczaFonts.label(color: TarczaPalette.primaryLight),
        border: _inputBorder(TarczaPalette.outline),
        enabledBorder: _inputBorder(TarczaPalette.outline),
        focusedBorder: _inputBorder(TarczaPalette.primary, 1.5),
        errorBorder: _inputBorder(TarczaPalette.confirmed),
        focusedErrorBorder: _inputBorder(TarczaPalette.confirmed, 1.5),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: TarczaPalette.surfaceHigh,
        indicatorColor: TarczaPalette.primary.withValues(alpha: 0.12),
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 66,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => TarczaFonts.label(
            size: 10,
            weight: states.contains(WidgetState.selected) ? 700 : 600,
            color: states.contains(WidgetState.selected)
                ? TarczaPalette.primaryLight
                : TarczaPalette.textMuted,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: 22,
            color: states.contains(WidgetState.selected)
                ? TarczaPalette.primaryLight
                : TarczaPalette.textMuted,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: TarczaPalette.surfaceHigh,
        surfaceTintColor: Colors.transparent,
        dragHandleColor: TarczaPalette.outlineStrong,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          side: BorderSide(color: TarczaPalette.outline),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: TarczaPalette.surfaceHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(color: TarczaPalette.outline),
        ),
        titleTextStyle: TarczaFonts.heading(size: 21),
      ),
      // Pasek komunikatu jest kontrastowy — ma się wybijać ponad jasny interfejs.
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: TarczaPalette.heading,
        contentTextStyle: TarczaFonts.text(size: 14, color: Colors.white),
        actionTextColor: TarczaPalette.primaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: TarczaPalette.textSecondary,
        textColor: TarczaPalette.textPrimary,
      ),
      dividerTheme: const DividerThemeData(color: TarczaPalette.outline, space: 1, thickness: 1),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: TarczaPalette.primary,
        linearTrackColor: TarczaPalette.surfaceAlt,
        circularTrackColor: Colors.transparent,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: TarczaPalette.surfaceAlt,
        side: const BorderSide(color: TarczaPalette.outline),
        labelStyle: TarczaFonts.text(size: 13, weight: 600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusSm)),
      ),
      // M3 rysuje wyłączony thumb kolorem `outline` — przy naszym jasnym obrysie
      // byłby niewidoczny na jasnym torze.
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? Colors.white
              : TarczaPalette.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? TarczaPalette.primary
              : TarczaPalette.surfaceAlt,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? TarczaPalette.primary
              : TarczaPalette.outlineStrong,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: TarczaPalette.surfaceAlt,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: TarczaPalette.outlineStrong),
        ),
        textStyle: TarczaFonts.text(size: 12, color: TarczaPalette.textPrimary),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, [double width = 1]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radiusSm),
    borderSide: BorderSide(color: color, width: width),
  );

  static final _textTheme = TextTheme(
    displayLarge: TarczaFonts.heading(size: 46),
    displayMedium: TarczaFonts.heading(size: 39),
    displaySmall: TarczaFonts.heading(size: 32),
    headlineLarge: TarczaFonts.heading(size: 32),
    headlineMedium: TarczaFonts.heading(size: 28),
    headlineSmall: TarczaFonts.heading(size: 24, letterSpacing: 0.3),
    titleLarge: TarczaFonts.heading(size: 21, weight: 700, letterSpacing: 0.3),
    titleMedium: TarczaFonts.text(size: 15, weight: 600, color: TarczaPalette.textPrimary),
    titleSmall: TarczaFonts.text(size: 13.5, weight: 600, color: TarczaPalette.textPrimary),
    bodyLarge: TarczaFonts.text(size: 15, color: TarczaPalette.textPrimary),
    bodyMedium: TarczaFonts.text(size: 14, color: TarczaPalette.textPrimary),
    bodySmall: TarczaFonts.text(size: 12.5, color: TarczaPalette.textSecondary),
    labelLarge: TarczaFonts.text(size: 14, weight: 700),
    labelMedium: TarczaFonts.label(),
    labelSmall: TarczaFonts.label(size: 10),
  );
}
