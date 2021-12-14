import 'view_state_model.dart';

/// 基于
abstract class ViewStateListModel<T> extends ViewStateModel {
  /// Page data
  List<T> list = [];

  ViewStateListModel(ViewState? viewState) : super(viewState);

  /// Entering the page loading skeleton for the first time
  initData() async {
    setBusy();
    await refresh(init: true);
  }

  /// Pull down to refresh
  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }

  /// Load Data
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}
