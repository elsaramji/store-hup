import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_hup/service/paymet/api_keys.dart';

abstract class StripePayment {
  static Future<void> makePayment(int amount) async {
    try {
      // initialize stripe payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: await createPaymentIntent(amount, "EGP"),
          merchantDisplayName: 'Flutter Stripe Store Demo',
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      log(e.toString());
      Exception(e);
    }
  }

  static Future<String> createPaymentIntent(
      int amount, String currency) async {
    Dio dio = Dio();

    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${ApiPaymentKey.secretkey}', // تأكد إن المفتاح سليم ويبدأ بـ "sk_"
            'Content-Type':
                'application/x-www-form-urlencoded', // ضروري لـ Stripe
          },
        ),
        data: {
          'amount': amount.toString(), // تأكد إن `amount` رقم صحيح بالسنتات
          'currency': currency.toLowerCase(), // تأكد إن `currency` بحروف صغيرة
        },
      );
      return response.data["client_secret"];
    } on DioException catch (e) {
      log('Error: ${e.response?.data}'); // طباعة الخطأ من السيرفر لمعرفة التفاصيل
      throw Exception('Failed to create payment intent');
    }
  }
}
