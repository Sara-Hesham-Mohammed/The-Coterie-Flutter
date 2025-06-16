import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final DateTime targetDate;
  final VoidCallback? onTimerEnd;

  const CountdownWidget({
    super.key,
    required this.targetDate,
    this.onTimerEnd
  });

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;
  bool _hasEnded = false;

  @override
  void initState() {
    super.initState();
    _hasEnded = false;
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _timeLeft = widget.targetDate.difference(DateTime.now());
      if (_timeLeft.isNegative && !_hasEnded) {
        _timeLeft = Duration.zero;
        _hasEnded = true;
        widget.onTimerEnd?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasEnded) {
      return Text(
        'Time\'s up!',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    final days = _timeLeft.inDays;
    final hours = _timeLeft.inHours % 24;
    final minutes = _timeLeft.inMinutes % 60;
    final seconds = _timeLeft.inSeconds % 60;

    return Text(
      '${days}d ${hours}h ${minutes}m ${seconds}s',
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}