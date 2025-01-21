// lib/qr_code_handler.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void handleQrCodeData(String qrCodeData) async {
  // Regular expressions for URL and phone number
  final RegExp urlRegex = RegExp(
    r'((https?:\/\/)?([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})([\/\w.-]*)*\/?)',
    caseSensitive: false,
  );
  final RegExp phoneRegex = RegExp(
    r'(\+?\d{1,3}[-.\s]?)?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9}',
  );

  // Check for URL in the data
  final urlMatch = urlRegex.firstMatch(qrCodeData);
  if (urlMatch != null) {
    final String url = urlMatch.group(0)!;
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
    return; // Exit after handling URL
  }

  // Check for phone number in the data
  final phoneMatch = phoneRegex.firstMatch(qrCodeData);
  if (phoneMatch != null) {
    final String phoneNumber = phoneMatch.group(0)!;
    try {
      final Uri phoneUri = Uri.parse('tel:$phoneNumber');
      await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Error launching phone number: $e');
    }
    return; // Exit after handling phone number
  }

  // If no URL or phone number, display the text
  debugPrint('QR Code Data: $qrCodeData');
  // You can show the text in a dialog or save it as needed
}
