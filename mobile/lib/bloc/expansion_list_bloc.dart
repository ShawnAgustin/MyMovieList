import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ExpansionListBloc extends BlocBase {
  final BehaviorSubject<List<bool>> _expandedPanels =
      BehaviorSubject<List<bool>>();
  final List<bool> panels;

  ExpansionListBloc(this.panels) : super(null);

  BehaviorSubject<List<bool>> get expandedPanelsController =>
      _expandedPanels.stream;

  dispose() {
    _expandedPanels.close();
  }

  void updatePanel(int index, bool newValue) {
    this.panels[index] = !this.panels[index];
    _expandedPanels.add(this.panels);
  }
}
