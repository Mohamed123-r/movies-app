import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.d('${bloc.runtimeType} created');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('${bloc.runtimeType} $change');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.d('${bloc.runtimeType} closed');
  }
}
