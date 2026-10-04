import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
import "package:tarcza_polska/core/widgets/panel_widgets.dart";

/// Logo aplikacji (`assets/images/logo-przezroczyste-x512.png`).
class TarczaLogo extends StatelessWidget {
  const TarczaLogo({super.key, this.size = 32});

  static const asset = "assets/images/logo-przezroczyste-x512.png";

  final double size;

  @override
  Widget build(BuildContext context) => Image.asset(
    asset,
    width: size,
    height: size,
    semanticLabel: "Tarcza",
  );
}

/// Pasek aplikacji w stylistyce panelu: nadtytuł wersalikami nad ciężkim tytułem,
/// cienka linia oddzielająca treść. Na ekranach głównych logo przed tytułem.
class TarczaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TarczaAppBar({
    super.key,
    required this.title,
    this.eyebrow,
    this.eyebrowColor = TarczaPalette.primary,
    this.eyebrowTrailing,
    this.leading,
    this.actions,
    this.showLogo,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.systemOverlayStyle,
    this.bottom,
    this.divider = true,
  });

  final Widget title;

  /// Nadtytuł „• MAPA SYTUACYJNA” — kontekst ekranu nad nazwą.
  final String? eyebrow;
  final Color eyebrowColor;
  final String? eyebrowTrailing;
  final Widget? leading;
  final List<Widget>? actions;

  /// Domyślnie: logo tylko, gdy nie ma przycisku powrotu.
  final bool? showLogo;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? bottom;

  /// Linia pod paskiem (jak krawędź modułu w panelu).
  final bool divider;

  static const _barHeight = 62.0;

  @override
  Size get preferredSize =>
      Size.fromHeight(_barHeight + (eyebrow != null ? 14 : 0) + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.impliesAppBarDismissal ?? false;
    final hasLeading = leading != null || (automaticallyImplyLeading && canPop);
    final logo = showLogo ?? !hasLeading;
    final heading = DefaultTextStyle.merge(
      style: TarczaFonts.heading(size: 24, letterSpacing: 0.6),
      child: _Uppercase(child: title),
    );
    return AppBar(
      toolbarHeight: _barHeight + (eyebrow != null ? 14 : 0),
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: hasLeading ? 2 : 16,
      backgroundColor: backgroundColor,
      systemOverlayStyle: systemOverlayStyle,
      actions: actions,
      bottom:
          bottom ??
          (divider
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(1),
                  child: Divider(height: 1, color: TarczaPalette.outline),
                )
              : null),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (logo) ...[const TarczaLogo(), const SizedBox(width: 10)],
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (eyebrow != null) ...[
                  Eyebrow(eyebrow!, color: eyebrowColor, trailing: eyebrowTrailing),
                  const SizedBox(height: 4),
                ],
                heading,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tytuły paska są wersalikami; opakowanie zamienia tekst bez zmiany wywołań.
class _Uppercase extends StatelessWidget {
  const _Uppercase({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => switch (child) {
    final Text t when t.data != null => Text(
      upper(t.data!),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: t.style,
    ),
    _ => child,
  };
}
