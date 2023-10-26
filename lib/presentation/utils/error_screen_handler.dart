import 'package:Inova/presentation/utils/app_error_helper.dart';
import 'package:flutter/material.dart';

import '../core/error_dialog.dart';

extension ErrorRetryHandler on AppErrorHelper {
  static Function() retry(BuildContext context, Screens screen, {arguments}) {
    switch (screen) {
      case Screens.home:
      default:
        return () {};
    }
  }
}
