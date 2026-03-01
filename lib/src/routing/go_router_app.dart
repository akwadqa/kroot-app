import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/pages/create_account_screen.dart';
import 'package:wedding_app/features/auth/presentation/pages/login_screen.dart';
import 'package:wedding_app/features/auth/presentation/pages/verification_screen.dart';
import 'package:wedding_app/features/home/presentation/screens/home_screen.dart';
import 'package:wedding_app/src/routing/routes.dart';

class GoRouterApp {
  final routes = GoRouter(
    routes: [
      //************ Auth *********** */
      //? Login :
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(),
        // builder: (context, state) => HomeScreen(),
      ),

      //? Verification :
      GoRoute(
        path: Routes.verification,
        builder: (context, state) => VerificationScreen(state.extra as String?),
      ),

      //? Verification :
      GoRoute(
        path: Routes.creataAccount,
        builder: (context, state) =>
            CreateAccountScreen(number: state.extra as String),
      ),

      //****************** Home  ***********/

      //? Home :
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    ],
  );
}
