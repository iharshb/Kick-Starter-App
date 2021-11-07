import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstarter/providers/provider_login.dart';

class BaseViewModel extends ChangeNotifier {
  final BuildContext context;

  // TODO: Set all providers here
  LoginProvider? loginProvider;

  BaseViewModel({required this.context}) {
    // TODO: Retrieve all providers here
    loginProvider = Provider.of<LoginProvider>(context);
  }
}
