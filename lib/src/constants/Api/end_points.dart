import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wedding_app/src/constants/dotenv_keys.dart';

abstract class EndPoints {
  static final String _baseUrl = dotenv.env['BASE_URL']??'';

  //? 🟦 Auth

  static String sendOtp = '$_baseUrl/kroot.api.auth.send_otp';
  static String verifyOtp = '$_baseUrl/kroot.api.auth.verify_otp';
  static String createAccount = '$_baseUrl/kroot.api.auth.register';

  // 🟩 CHECK
  static const String getGuests = '.get_invitees';
  static const String getActiveGates = '.get_active_gates';
  static const String getGuestDetails = '.get_invitee_details';
  static const String qrCheck = '.check_in';
}
