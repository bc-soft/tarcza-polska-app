import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/data/mock/demo_scenario.dart";

class DemoState extends Equatable {
  const DemoState({required this.step, required this.autoplay});

  final DemoStep step;
  final bool autoplay;

  @override
  List<Object?> get props => [step, autoplay];
}

/// Sterowanie scenariuszem demo z ustawień dev (tylko tryb mock).
class DemoCubit extends Cubit<DemoState> {
  DemoCubit(this._scenario) : super(DemoState(step: _scenario.step, autoplay: _scenario.autoplay)) {
    _subscription = _scenario.steps.listen(
      (step) => emit(DemoState(step: step, autoplay: _scenario.autoplay)),
    );
  }

  final DemoScenario _scenario;
  late final StreamSubscription<DemoStep> _subscription;

  void next() => _scenario.next();

  void reset() => _scenario.reset();

  void goTo(DemoStep step) => _scenario.goTo(step);

  void setAutoplay({required bool enabled}) {
    _scenario.setAutoplay(enabled: enabled);
    emit(DemoState(step: _scenario.step, autoplay: _scenario.autoplay));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }
}
