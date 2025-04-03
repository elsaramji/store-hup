import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  static const String publishableKey = 'YOUR_PUBLISHABLE_KEY'; // Replace with your Stripe publishable key
  
  static Future<void> initialize() async {
    Stripe.publishableKey = publishableKey;
    await Stripe.instance.applySettings();
  }

  static Future<void> makePayment({
    required String amount,
    required String currency,
  }) async {
    try {
      // Create payment intent on your backend
      // final paymentIntent = await _createPaymentIntent(amount, currency);
      
      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: const SetupPaymentSheetParameters(
          paymentIntentClientSecret: 'CLIENT_SECRET', // Get this from your backend
          merchantDisplayName: 'Store Hup',
          
        ),
      );

      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
