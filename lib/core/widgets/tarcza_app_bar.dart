import "package:flutter/material.dart";
import "package:flutter/services.dart";

/// Logo aplikacji (`assets/images/logo-przezroczyste-x512.png`).
class TarczaLogo extends StatelessWidget {
  const TarczaLogo({super.key, this.size = 34});

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

/// Pasek aplikacji: na ekranach głównych logo przed tytułem, na ekranach z powrotem
/// tytuł blisko strzałki (domyślny `titleSpacing` 16 daje za dużą przerwę).
class TarczaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TarczaAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.showLogo,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.systemOverlayStyle,
    this.bottom,
  });

  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;

  /// Domyślnie: logo tylko, gdy nie ma przycisku powrotu.
  final bool? showLogo;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.impliesAppBarDismissal ?? false;
    final hasLeading = leading != null || (automaticallyImplyLeading && canPop);
    final logo = showLogo ?? !hasLeading;
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: hasLeading ? 0 : 16,
      backgroundColor: backgroundColor,
      systemOverlayStyle: systemOverlayStyle,
      bottom: bottom,
      actions: actions,
      title: logo
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TarczaLogo(),
                const SizedBox(width: 10),
                Flexible(child: title),
              ],
            )
          : title,
    );
  }
}
