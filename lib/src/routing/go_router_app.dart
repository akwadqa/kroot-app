import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/screens/custumize_card_screen.dart';
import 'package:kroot_app/features/cards/presentation/screens/final_preview_screen.dart';
import 'package:kroot_app/features/cards/presentation/screens/occasion_cards_screen.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/screens/manage_access_page.dart';
import 'package:kroot_app/features/profile/presentation/pages/bundles_screen.dart';
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
  return GoRouterApp().routes;
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class GoRouterApp {
  GoRouter get routes => GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.start,

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

      GoRoute(
        path: Routes.creataAccount,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: CreateAccountScreen(number: state.extra as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

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

      GoRoute(
        path: Routes.createEvent,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AddEventScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      GoRoute(
        path: Routes.manageAccess,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ManageAccessPage(state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      GoRoute(
        path: Routes.selectLocation,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SelectLocationPage(id: state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

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
      ),

      GoRoute(
        path: Routes.addContact,

        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AddContactScreen(id: state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      GoRoute(
        path: Routes.updateContact,

        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: UpdateContactScreen(id: state.extra as String?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

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

      GoRoute(
        path: Routes.qrScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: QrScreen(id: state.extra as String?),
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      GoRoute(
        path: Routes.scanCameraQR,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,

          child: ScanQrCodeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

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

      GoRoute(
        path: Routes.eventDetails,
        pageBuilder: (context, state) {
          final params = state.extra as Map;
          return CustomTransitionPage(
            key: state.pageKey,

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

      GoRoute(
        path: Routes.scanQr,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ScanQrEventPage(state.extra as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

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

      GoRoute(
        path: Routes.bundle,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BundlesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      GoRoute(
        path: Routes.payment,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: PaymentScreen(paymentUrl: state.extra as String),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: Routes.occasionCards,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: OccasionCardsScreen(category: state.extra as TemplateCategoriesModel),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: Routes.customizeCard,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: CustumizeCardScreen(template: state.extra as InvitationTemplateModel),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: Routes.finalPreview,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: FinalPreviewScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
}
