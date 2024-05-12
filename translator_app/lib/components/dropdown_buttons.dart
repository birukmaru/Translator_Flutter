import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String hint;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const CustomDropdownButton({
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      focusColor: Colors.white,
      iconDisabledColor: Colors.white,
      iconEnabledColor: Colors.white,
      hint: Text(
        widget.hint,
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
      dropdownColor: Colors.white,
      onChanged: widget.onChanged,
      items: widget.items.map((String dropDownStringItem) {
        return DropdownMenuItem(
          child: Text(dropDownStringItem),
          value: dropDownStringItem,
        );
      }).toList(),
    );
  }
}
