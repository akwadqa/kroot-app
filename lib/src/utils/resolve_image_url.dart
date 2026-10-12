import 'package:flutter_dotenv/flutter_dotenv.dart';

String? resolveImageUrl(String? imagePath) {
  final baseUrl = dotenv.env['API_PRODUCTION_BASE_IMAGE'] ?? '';
  if (imagePath == null || imagePath.isEmpty) return null;
  if (imagePath.startsWith('http')) return imagePath;
  final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
  final path = imagePath.startsWith('/') ? imagePath.substring(1) : imagePath;
  return '$base$path';
}
