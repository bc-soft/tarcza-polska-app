import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/features/onboarding/bloc/address_picker_cubit.dart";
import "package:tarcza_polska/features/onboarding/view/address_picker_view.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

/// Zmiana adresu domowego z ustawień.
class HomeAddressPage extends StatelessWidget {
  const HomeAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => AddressPickerCubit(
        locationService: getIt(),
        initial: context.read<LocationCubit>().state.homeAddress,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.settingsAddressTitle)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: AddressPickerView(
              confirmLabel: l10n.commonSave,
              onConfirm: (address) async {
                await context.read<LocationCubit>().setHomeAddress(address);
                if (context.mounted) context.pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
