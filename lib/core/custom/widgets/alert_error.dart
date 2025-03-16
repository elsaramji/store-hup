// core/custom/widgets/alert_error.dart
import 'package:flutter/material.dart';

class AlertError extends StatelessWidget {
  final String? title;
  final Icon? icon;
  const AlertError({
    this.title,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AlertDialog(
        title: icon ??
            const Icon(
              Icons.warning_outlined,
              color: Colors.red,
            ),
        content: Text(title ?? 'خطأ في الاتصال بقاعدة البيانات'),
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
