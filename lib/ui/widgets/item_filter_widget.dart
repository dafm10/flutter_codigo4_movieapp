
import 'package:flutter/material.dart';

class ItemFilterWidget extends StatelessWidget {

  String nameFilter;
  bool selected;
  Function onPressed;

  ItemFilterWidget({required this.nameFilter, required this.selected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15.0),
      child: FilterChip(
        backgroundColor: Color(0xff2E2E2E),
        //backgroundColor: Color(0xff2E2E2E),
        selectedColor: Colors.white,
        //selectedShadowColor: Color(0xff2E2E2E),
        selected: selected,

        showCheckmark: false,
        label: Text(
          nameFilter,
          style: TextStyle(
            color: selected ? Colors.black87 : Colors.white54,
          ),
        ),
        onSelected: (bool value) {
          onPressed();
        },
      ),
    );
  }
}
