// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/common/navigation/route.dart';
import 'package:vaultiq/src/common/shared_cubits/shared_local_auth_cubit/shared_local_auth_cubit.dart';
import 'package:vaultiq/src/common/utils/enum/local_auth_status.dart';
import 'package:vaultiq/src/features/authentication_page/cubit/auth_cubit.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     final authCubit = i.get<AuthCubit>();
//     final session = Supabase.instance.client.auth.currentSession;
//     final isLocalAuthCubit = i.get<SharedLocalAuthCubit>();
//     authCubit.stream.listen(
//       (event) {
//         if (event.currentSession != null) {
//           router.replace(
//             const LocalAuthRoute(),
//           );
//         }

//         if (event.currentSession != null) {
//           router.replace(
//             const MainRoute(),
//           );
//         }
//       },
//     );

//     if (session != null ) {
//       router.replace(
//         const LocalAuthRoute(),
//       );
//     } else if (session != null ) {
//       router.replace(
//         const MainRoute(),
//       );
//     } else {
//       resolver.next();
//     }
//   }
// }


class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authCubit = i.get<AuthCubit>();
    final session = Supabase.instance.client.auth.currentSession;
    final isLocalAuthCubit = i.get<SharedLocalAuthCubit>();

    if (session != null) {
      // Check local auth status before redirecting
      final localAuthStatus = isLocalAuthCubit.state.localAuthStatus;
      if (localAuthStatus == LocalAuthStatus.enable) {
        router.replace(const LocalAuthRoute());
      } else {
        router.replace(const MainRoute());
      }
      return; // Prevent resolver from continuing
    }

    authCubit.stream.listen((event) {
      if (event.currentSession != null) {
        final localAuthStatus = isLocalAuthCubit.state.localAuthStatus;
        if (localAuthStatus == LocalAuthStatus.enable) {
          router.replace(const LocalAuthRoute());
        } else {
          router.replace(const MainRoute());
        }
      }
    });

    resolver.next(); // Allow navigation to continue if no session
  }
}
