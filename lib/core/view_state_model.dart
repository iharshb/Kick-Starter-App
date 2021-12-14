import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'view_state.dart';
export 'view_state.dart';

class ViewStateModel with ChangeNotifier {
  /// Prevent the asynchronous task from completing after the page is destroyed, resulting in an error
  bool _disposed = false;

  /// The current page status, the default is busy, which can be specified in the construction method of viewModel;
  ViewState _viewState;

  ViewStateModel(ViewState? viewState) : _viewState = viewState ?? ViewState.idle {
    debugPrint('ViewStateModel------>$runtimeType');
  }

  /// ViewState
  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewStateError = null;
    _viewState = viewState;
    notifyListeners();
  }

  /// ViewStateError
  ViewStateError? _viewStateError;

  ViewStateError? get viewStateError => _viewStateError;

  bool get isBusy => viewState == ViewState.busy;

  bool get isIdle => viewState == ViewState.idle;

  bool get isEmpty => viewState == ViewState.empty;

  bool get isError => viewState == ViewState.error;

  /// set
  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  /// Classification Error and Exception
  void setError(e, stackTrace, {String? message}) {
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;

    if (e is dio.DioError) {
      if (e.type == dio.DioErrorType.connectTimeout ||
          e.type == dio.DioErrorType.sendTimeout ||
          e.type == dio.DioErrorType.receiveTimeout) {
        // timeout
        errorType = ViewStateErrorType.networkTimeOutError;
        message = e.error;
      } else if (e.type == dio.DioErrorType.response) {
        // incorrect status, such as 404, 503...
        message = e.error;
      } else if (e.type == dio.DioErrorType.cancel) {
        // to be continue...
        message = e.error;
      } else {
        // dio reset the original error to a layer
        e = e.error;
        if (e is dio.DioError) {
          stackTrace = null;
          errorType = ViewStateErrorType.unauthorizedError;
        } else if (e is SocketException) {
          errorType = ViewStateErrorType.networkTimeOutError;
          message = e.message;
        } else {
          message = e.message;
        }
      }
    }
    viewState = ViewState.error;
    _viewStateError = ViewStateError(
      errorType,
      message: message,
      errorMessage: e.toString(),
    );
    onError(viewStateError);
  }

  void onError(ViewStateError? viewStateError) {}

  /// Show error message
  showErrorMessage(context, {String? message}) {
    if (message != null) {
      if (viewStateError!.isNetworkTimeOut) {
        message = "Load Failed,Check network ";
      } else {
        message = viewStateError!.message!;
      }
      Fluttertoast.showToast(
          msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1);
    }
  }

  @override
  String toString() {
    return 'BaseModel{_viewState: $viewState, _viewStateError: $_viewStateError}';
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }
}
