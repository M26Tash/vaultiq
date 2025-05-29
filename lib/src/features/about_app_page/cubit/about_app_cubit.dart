import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vaultiq/src/common/navigation/entities/customized_route.dart';

part 'about_app_state.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit()
      : super(
          const AboutAppState(
            route: CustomizedRoute(null, null),
          ),
        );

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
