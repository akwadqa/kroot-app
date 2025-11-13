import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kroot_app/src/constants/dotenv_keys.dart';

abstract class EndPoints {
  static final String _baseUrl = dotenv.env['BASE_URL']??'';

  //? 🟦 Auth

  static String sendOtp = '$_baseUrl/kroot.api.auth.send_otp';
  static String verifyOtp = '$_baseUrl/kroot.api.auth.verify_otp';
  static String createAccount = '$_baseUrl/kroot.api.auth.register';

  //? Home : 
  static String getEvents = '$_baseUrl/kroot.api.api.get_user_events';
  static String createEvent = '$_baseUrl/kroot.api.api.create_event';
  static String getEventDetails = '$_baseUrl/kroot.api.api.get_event';
  static String deleteEvent = '$_baseUrl/kroot.api.api.delete_event';
  static String addGuest = '$_baseUrl/kroot.api.api.add_guest';
  static String updateEvent = '$_baseUrl/kroot.api.api.update_occasion';

  //? Scan : 
  static String scanQr = '$_baseUrl/frappe_whatsapp.api.check_in';
  static String getScaned = '$_baseUrl/kroot.api.api.get_scan_events';


  // 🟩 CHECK
  static const String getGuests = '.get_invitees';
  static const String getActiveGates = '.get_active_gates';
  static const String getGuestDetails = '.get_invitee_details';
  static const String qrCheck = '.check_in';
}
