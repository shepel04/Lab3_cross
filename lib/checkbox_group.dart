import 'package:flutter/material.dart';

class CheckboxGroup extends StatefulWidget {
  const CheckboxGroup({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  State<CheckboxGroup> createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  late List<bool> _values;

  @override
  void initState() {
    super.initState();
    _values = List.filled(widget.items.length, false);
  }

  bool? get _groupValue {
    if (_values.every((v) => v)) return true;
    if (_values.every((v) => !v)) return false;
    return null;
  }

  void _toggleAll() {
    final value = _groupValue != true;
    setState(() {
      _values = List.filled(widget.items.length, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxListTile(
          title: Text(widget.title),
          tristate: true,
          value: _groupValue,
          onChanged: (_) => _toggleAll(),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        for (var i = 0; i < widget.items.length; i++)
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: CheckboxListTile(
              title: Text(widget.items[i]),
              value: _values[i],
              onChanged: (value) {
                setState(() {
                  _values[i] = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
      ],
    );
  }
}
