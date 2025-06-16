import 'package:flutter/material.dart';

import '../../utils/msg_snackbar.dart';

class ConnectBtn extends StatefulWidget {

  const ConnectBtn({super.key});

  @override
  State<ConnectBtn> createState() => _ConnectBtnState();
}

class _ConnectBtnState extends State<ConnectBtn> {
  bool requestSent = false;
  @override
  Widget build(BuildContext context) {


    return ElevatedButton(
      onPressed: () {
        setState(() {
          requestSent = !requestSent;
        });

        final message = requestSent
            ? "Connection Request Sent!"
            : "Connection Request Cancelled!";
        SnackBarUtils.showSnackBar(context, message);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
        backgroundColor: requestSent
            ? Theme.of(context).colorScheme.surfaceVariant
            : Theme.of(context).colorScheme.primary,
        foregroundColor: requestSent
            ? Theme.of(context).colorScheme.onSurfaceVariant
            : Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 4,
      ),
      child: Text(requestSent ? 'Cancel Request' : 'Connect'),
    );
  }
}
