import 'package:flutter/material.dart';

class CheckBoxListItem extends StatefulWidget {
  bool _checked = false;
  final String text;
  CheckBoxListItem({super.key, required this.text});

  @override
  State<CheckBoxListItem> createState() => _CheckBoxListItemState();
}

class _CheckBoxListItemState extends State<CheckBoxListItem> {
  @override
  Widget build(BuildContext context) {
    return  CheckboxListTile(
      value: widget._checked,
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          widget._checked = value;
        });
      },
      title: Text(widget.text),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
    );
  }
}
