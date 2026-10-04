import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/mock/mock_seed.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/onboarding/bloc/address_picker_cubit.dart";

/// Wpisanie adresu → geokodowanie → potwierdzenie pinezką na mapie.
class AddressPickerView extends StatefulWidget {
  const AddressPickerView({super.key, required this.onConfirm, this.confirmLabel});

  final ValueChanged<HomeAddress> onConfirm;
  final String? confirmLabel;

  @override
  State<AddressPickerView> createState() => _AddressPickerViewState();
}

class _AddressPickerViewState extends State<AddressPickerView> {
  late final _controller = TextEditingController(
    text: context.read<AddressPickerCubit>().state.query,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    FocusScope.of(context).unfocus();
    context.read<AddressPickerCubit>().search();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<AddressPickerCubit>();
    return BlocConsumer<AddressPickerCubit, AddressPickerState>(
      listenWhen: (a, b) => a.query != b.query && b.query != _controller.text,
      listener: (_, state) => _controller.text = state.query,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            onChanged: cubit.setQuery,
            onSubmitted: (_) => _search(),
            textInputAction: TextInputAction.search,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: l10n.onbHomeHint,
              prefixIcon: const Icon(Icons.home_outlined),
              suffixIcon: state.search == AddressSearch.searching
                  ? const Padding(
                      padding: EdgeInsets.all(14),
                      child: SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (state.query.isNotEmpty)
                          IconButton(
                            tooltip: l10n.commonClear,
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _controller.clear();
                              cubit.setQuery("");
                            },
                          ),
                        IconButton(
                          tooltip: l10n.onbHomeSearch,
                          icon: const Icon(Icons.search),
                          onPressed: _search,
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 8),
          if (state.search == AddressSearch.notFound)
            Text(l10n.onbHomeNotFound, style: const TextStyle(color: TarczaPalette.accentRed))
          else
            Text(
              state.position == null ? l10n.onbHomeEnterHint : l10n.onbHomeAdjust,
              style: const TextStyle(color: TarczaPalette.textSecondary),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: LocationPickerMap(
              position: state.position,
              onChanged: cubit.movePin,
              zoom: state.position == null ? 12 : 16,
            ),
          ),
          if (state.label != null && state.position != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.place, color: TarczaPalette.accentRed, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    state.label!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          if (AppConfig.useMocks && state.position == null) ...[
            SecondaryButton(
              icon: Icons.science_outlined,
              label: l10n.onbHomeUseDemo,
              onPressed: () => cubit.useAddress(MockSeed.demoHome),
            ),
            const SizedBox(height: 12),
          ],
          PrimaryButton(
            label: widget.confirmLabel ?? l10n.onbHomeConfirm,
            onPressed: state.address == null ? null : () => widget.onConfirm(state.address!),
          ),
        ],
      ),
    );
  }
}
