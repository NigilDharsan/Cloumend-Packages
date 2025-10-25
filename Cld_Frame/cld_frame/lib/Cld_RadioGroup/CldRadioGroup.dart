import 'package:flutter/material.dart';

class CldRadioGroup extends StatefulWidget {
  final List<String> options;
  final String? selected;
  final Function(String) onChanged;
  final TextStyle? textStyle;
  final Color selectedColor;
  final Color unselectedColor;

  const CldRadioGroup({
    super.key,
    required this.options,
    this.selected,
    required this.onChanged,
    this.textStyle,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
  }) : assert(options.length >= 2 && options.length <= 3,);

  @override
  State<CldRadioGroup> createState() => _CldRadioGroupState();
}

class _CldRadioGroupState extends State<CldRadioGroup> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selected ?? widget.options.first;
  }

  void _onTap(String value) {
    setState(() => selectedValue = value);
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.options.map((option) {
        final isSelected = selectedValue == option;
        return GestureDetector(
          onTap: () => _onTap(option),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? widget.selectedColor : widget.unselectedColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? widget.selectedColor : widget.unselectedColor,
                width: 2,
              ),
            ),
            child: Text(
              option,
              style: widget.textStyle ??
                  TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
