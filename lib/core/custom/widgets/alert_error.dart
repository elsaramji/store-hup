// core/custom/widgets/alert_error.dart
import 'package:flutter/material.dart';

class AlertError extends StatelessWidget {
  const AlertError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AlertDialog(
        title: const Icon(
          Icons.warning_outlined,
          color: Colors.red,
        ),
        content: const Text('خطأ في الاتصال بقاعدة البيانات'),
        actions: <Widget>[
          TextButton(
            child: const Text('اغلاق'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}