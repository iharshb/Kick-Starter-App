import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kickstarter/core/z_core.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> {
  static const int pageNumFirst = 1;
  static const int pageSize = 10;

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  ViewStateRefreshListModel(ViewState? viewState) : super(viewState);

  RefreshController get refreshController => _refreshController;

  int _currentPageNum = pageNumFirst;

  @override
  Future<List<T>?> refresh({bool init = false}) async {
    try {
      _currentPageNum = pageNumFirst;
      var data = await loadData(pageNum: pageNumFirst);
      if (data!.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        refreshController.refreshCompleted();
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        setIdle();
      }
      return data;
    } catch (e, s) {
      if (init) list.clear();
      refreshController.refreshFailed();
      setError(e, s);
      return null;
    }
  }

  Future<List<T>?> loadMore() async {
    try {
      var data = await loadData(pageNum: ++_currentPageNum);
      if (data!.isEmpty) {
        _currentPageNum--;
        refreshController.loadNoData();
      } else {
        onCompleted(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      _currentPageNum--;
      refreshController.loadFailed();
      debugPrint('error--->\n' + e.toString());
      debugPrint('statck--->\n' + s.toString());
      return null;
    }
  }

  @override
  Future<List<T>?> loadData({int pageNum});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
