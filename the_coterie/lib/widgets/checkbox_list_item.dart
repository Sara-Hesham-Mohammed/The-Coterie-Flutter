import 'package:flutter/material.dart';

class CheckBoxListItem extends StatefulWidget {
  bool _isChecked = false;
  final String text;
  CheckBoxListItem({super.key, required this.text});

  bool get isChecked => _isChecked;

  @override
  State<CheckBoxListItem> createState() => _CheckBoxListItemState();
}

class _CheckBoxListItemState extends State<CheckBoxListItem> {

  @override
  Widget build(BuildContext context) {
    return  CheckboxListTile(
      value: widget._isChecked,
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          widget._isChecked = value;
        });
      },
      title: Text(widget.text),
      controlAffinity: ListTileControlAffinity.trailing,
      dense: true,
    );
  }
}
