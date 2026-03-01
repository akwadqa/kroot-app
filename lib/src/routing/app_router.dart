
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:wedding_app/features/auth/application/auth_service.dart';
// import 'package:wedding_app/src/routing/app_router.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends RootStackRouter {
//   final Ref ref;

//   AppRouter(this.ref);

//   @override
//   List<AutoRoute> get routes {
//     final isAuthenticated = ref.read(isAuthinticatedProvider);

//     return [

 
//   //? ////*** Auth ROUTES ***////
    
//       AutoRoute(
//         page: LoginRoute.page,
//         initial: _isInitialLogin(isAuthenticated),
//       ),

//       AutoRoute(
//         page: VerificationRoute.page,
//       ),


//   //? ////*** Main/Home  ROUTES ***////
  
//      AutoRoute(
//         page: MainRoute.page,
//         // initial: true,
//         initial:isAuthenticated,
//         children: [],
//       ),  
//         AutoRoute(page: HomeRoute.page),
//         AutoRoute(page: ScanQrCodeRoute.page),
//         AutoRoute(page: GatesRoute.page),
//         AutoRoute(page: GuestsRoute.page),
//         AutoRoute(page: GuestDetailsRoute.page),
   
//     ];
//   }

//   bool _isInitialLogin(bool isAuthenticated) => !isAuthenticated;


// }
