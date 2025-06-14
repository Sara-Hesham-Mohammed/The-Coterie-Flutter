import 'dart:async';

import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final DateTime targetDate;
  late bool _hasEnded = false;
  final VoidCallback? onTimerEnd;
  CountdownWidget({super.key, required this.targetDate, this.onTimerEnd});

  bool get hasEnded => _hasEnded;

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;
  @override
  void initState() {
    super.initState();
    widget._hasEnded = false;
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _timeLeft = widget.targetDate.difference(DateTime.now());
      if (_timeLeft.isNegative&&!widget._hasEnded)
        _timeLeft = Duration.zero;
        widget._hasEnded = true;
        widget.onTimerEnd?.call();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _timeLeft.inDays;
    final hours = _timeLeft.inHours % 24;
    final minutes = _timeLeft.inMinutes % 60;
    final seconds = _timeLeft.inSeconds % 60;

    return Text(
      '${days}d ${hours}h ${minutes}m ${seconds}s',
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: Theme.of(context).colorScheme.onSecondary,),
    );
  }
}
