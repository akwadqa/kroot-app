// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/profile/presentation/pages/payment_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/features/auth/presentation/pages/create_account_screen.dart';
import 'package:kroot_app/features/auth/presentation/pages/login_screen.dart';
import 'package:kroot_app/features/auth/presentation/pages/verification_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/add_contact_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/add_event_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/event_details_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/geust_list_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/invite_template_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/main_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/qr_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/send_invite_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/update_contact_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/update_event_screen.dart';
import 'package:kroot_app/features/guests/presentation/screens/guests_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/select_location_screen.dart';
import 'package:kroot_app/features/profile/presentation/pages/pricing_screen.dart';
import 'package:kroot_app/features/scan/presentation/pages/scan_qr_event_page.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/screens/scan_qr_code_screen.dart';
import 'package:kroot_app/src/routing/routes.dart';

part 'go_router_app.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  // final token = ref.watch(userDataProvider);
  return GoRouterApp().routes;
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
        path: Routes.start,
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
              // return AddOperatorsScreen();
            },
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      //? Login :
      GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: LoginScreen(),
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

      //? Create account :
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

      //? Select Location :
      GoRoute(
        path: Routes.selectLocation,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SelectLocationPage(id: state.extra as String?,),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
        // builder: (context, state) => AddEventScreen(),
      ),

      //? Update event :
      GoRoute(
        path: Routes.updateEvent,
        pageBuilder: (context, state) {
          final params = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            child: UpdateEventScreen(
              eventModel: params['model'],
              id: params['id'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
        // builder: (context, state) => AddEventScreen(),
      ),

      //? Add contacts
      GoRoute(
        path: Routes.addContact,
        // builder: (context, state) => AddContactScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AddContactScreen(id: state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Update contacts
      GoRoute(
        path: Routes.updateContact,
        // builder: (context, state) => AddContactScreen(),
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: UpdateContactScreen(id: state.extra as String?),
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
          child: GeustListScreen(id: state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      //? Event Geust list :
      GoRoute(
        path: Routes.eventGuestList,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: GuestsScreen(id: state.extra as String),
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
          child: InviteTemplateScreen(id: state.extra as String?),
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
          child: QrScreen(id: state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Scan Qr :
      GoRoute(
        path: Routes.scanCameraQR,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          // child: ScanQrCodeScreen(inviteeId: state.extra as String,),
          child: ScanQrCodeScreen(),
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
          child: SendInviteScreen(eventModel: state.extra as EventModel),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Event details :
      GoRoute(
        path: Routes.eventDetails,
        pageBuilder: (context, state) {
          final params = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,
            // child: EventDetailsScreen(id: state.extra as String),
            child: EventDetailsScreen(
              eventModel: params['model'],
              id: params['id'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      //? Scan QR  :
      GoRoute(
        path: Routes.scanQr,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ScanQrEventPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Pricing :
      GoRoute(
        path: Routes.pricing,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: PricingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      //? Payment :
      GoRoute(
        path: Routes.payment,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: PaymentScreen(paymentUrl: state.extra as String,),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
}
