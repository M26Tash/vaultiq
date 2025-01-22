import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authCubit = i.get<AuthCubit>();
    final session = Supabase.instance.client.auth.currentSession;

    authCubit.stream.listen(
      (event) {
        if (event.currentSession != null) {
          router.replace(
            const MainRoute(),
          );
        }
      },
    );

    if (session != null) {
      router.replace(
        const MainRoute(),
      );
    } else {
      resolver.next();
    }
  }
}
