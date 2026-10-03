import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/map/view/incident_card.dart";

/// Wszystkie problemy z obszaru widocznego na mapie (ten sam stan co mapa — `MapBloc`).
///
/// Kolejność ustalamy raz, przy otwarciu (od najbardziej wiarygodnych): odświeżenia i wybór
/// incydentu nie przestawiają wierszy pod palcem. Nowe problemy dochodzą na koniec listy.
class IncidentsPage extends StatefulWidget {
  const IncidentsPage({super.key});

  @override
  State<IncidentsPage> createState() => _IncidentsPageState();
}

class _IncidentsPageState extends State<IncidentsPage> {
  final _order = <String>[];

  List<Incident> _stable(List<Incident> incidents) {
    if (_order.isEmpty) {
      final sorted = [...incidents]..sort((a, b) => b.confidenceScore.compareTo(a.confidenceScore));
      _order.addAll(sorted.map((i) => i.id));
    } else {
      _order.addAll(incidents.map((i) => i.id).where((id) => !_order.contains(id)));
    }
    final byId = {for (final i in incidents) i.id: i};
    return [for (final id in _order) ?byId[id]];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.incidentsTitle)),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final incidents = _stable(state.incidents);
          return RefreshIndicator(
            onRefresh: () async => context.read<MapBloc>().add(const MapRefreshRequested()),
            child: incidents.isEmpty
                ? ListView(
                    children: [
                      const SizedBox(height: 80),
                      const Icon(
                        Icons.check_circle_outline,
                        size: 56,
                        color: TarczaPalette.textSecondary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(l10n.incidentsEmpty, textAlign: TextAlign.center),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    itemCount: incidents.length + 1,
                    separatorBuilder: (_, index) => SizedBox(height: index == 0 ? 4 : 10),
                    itemBuilder: (context, index) => index == 0
                        ? Text(
                            l10n.incidentsHint,
                            style: const TextStyle(color: TarczaPalette.textSecondary),
                          )
                        : IncidentOpenContainer(
                            key: ValueKey(incidents[index - 1].id),
                            incident: incidents[index - 1],
                            onOpen: () => context.read<MapBloc>().add(
                              MapIncidentSelected(incidents[index - 1].id),
                            ),
                          ),
                  ),
          );
        },
      ),
    );
  }
}
