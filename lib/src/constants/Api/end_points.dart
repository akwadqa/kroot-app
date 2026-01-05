import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EndPoints {
  // static final String _baseUrl = dotenv.env['BASE_URL'] ?? '';

  //? 🟦 Auth

  static String sendOtp = 'kroot.api.auth.send_otp';
  static String verifyOtp = 'kroot.api.auth.verify_otp';
  static String createAccount = 'kroot.api.auth.register';

  //? Home :
  static String getUtils = 'kroot.api.api.get_utility_data';
  static String getEvents = 'kroot.api.api.get_user_events';
  static String createEvent = 'kroot.api.api.create_event';
  static String getEventDetails = 'kroot.api.api.get_event';
  static String deleteEvent = 'kroot.api.api.delete_event';
  static String addGuestToEvent = 'kroot.api.api.add_guest';
  static String updateEvent = 'kroot.api.api.update_occasion';
  static String confirmEvent = 'kroot.api.api.confirm_event';
  // static String updateHandlers = 'kroot.api.api.add_handlers';
  static String updateHandlers = 'kroot.api.api.update_handler_list';
  static String deleteHandlers = 'kroot.api.api.remove_handlers';

  //? Scan :
  // static String scanQr = 'frappe_whatsapp.api.check_in';
  static String scanQr = 'kroot.api.api.check_in';
  static String getScaned = 'kroot.api.api.get_scan_events';

  //? Geusts :
  static String updateGuest = 'kroot.api.api.update_invitee';
  static String deleteGuest = 'kroot.api.api.delete_guest';
  static String updateGustsList = 'kroot.api.api.update_guest_list';

  //? Profile : 
  static String getPaymentLink = 'sadad.api.api.get_payment_url';


  // 🟩 CHECK
  static const String getGuests = '.get_invitees';
  static const String getActiveGates = '.get_active_gates';
  static const String getGuestDetails = '.get_invitee_details';
  static const String qrCheck = '.check_in';
    // ! FCM TOKEN
  static const String sendFcmToken = 'fcm_frappe.api.device_token';
  // static const String appNotifications = 'app_messages.app_messages';
  static const String appNotifications = 'fcm_frappe.notifications.app_messages';
}
