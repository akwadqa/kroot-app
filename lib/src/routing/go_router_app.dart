// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'package:wedding_app/features/auth/presentation/pages/create_account_screen.dart';
import 'package:wedding_app/features/auth/presentation/pages/login_screen.dart';
import 'package:wedding_app/features/auth/presentation/pages/verification_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/add_contact_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/add_event_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/event_details_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/geust_list_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/home_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/invite_template_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/main_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/qr_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/send_invite_screen.dart';
import 'package:wedding_app/src/routing/routes.dart';

part 'go_router_app.g.dart';

@Riverpod(keepAlive: true)
GoRouterApp goRouter(Ref ref) {
  // final token = ref.watch(userDataProvider);
  return GoRouterApp();
}

class GoRouterApp {
  // final String? token;
  // GoRouterApp({
  //   required this.token,
  // });
  GoRouter get routes => GoRouter(
    routes: [
      //************ Auth *********** */
      //? Login :
      GoRoute(
        path: Routes.login,
        // builder: (context, state) => AddContactScreen(),
        // builder: (context, state) => Consumer(
        //   builder: (context, ref, _) {
        //     final token = ref.read(userDataProvider);
        //     if (token != null) return MainScreen();
        //     return LoginScreen();
        //   },
        // ),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: Consumer(
            builder: (context, ref, _) {
              final token = ref.read(userDataProvider);
              if (token != null) return MainScreen();
              return LoginScreen();
            },
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Verification :
      GoRoute(
        path: Routes.verification,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: VerificationScreen(state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Verification :
      GoRoute(
        path: Routes.creataAccount,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: CreateAccountScreen(number: state.extra as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
        // builder: (context, state) =>
        //     CreateAccountScreen(number: state.extra as String),
      ),

      //****************** Home  ***********/

      //? Home :
      GoRoute(
        path: Routes.main,

        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: MainScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? createEvent
      GoRoute(
        path: Routes.createEvent,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AddEventScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
        // builder: (context, state) => AddEventScreen(),
      ),

      //? Add contacts
      GoRoute(
        path: Routes.addContact,
        // builder: (context, state) => AddContactScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AddContactScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      //? Geust list :
      GoRoute(
        path: Routes.guestList,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: GeustListScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Invite template
      GoRoute(
        path: Routes.inviteTemplate,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: InviteTemplateScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Qr :
      GoRoute(
        path: Routes.qrScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: QrScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Send invite :
      GoRoute(
        path: Routes.sendInvite,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SendInviteScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Event details :
      GoRoute(
        path: Routes.eventDetails,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: EventDetailsScreen(id: state.extra as String,),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
}
