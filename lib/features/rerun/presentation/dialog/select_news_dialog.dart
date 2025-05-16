import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showNewsTypePickerDialog({
  required BuildContext context,
  required List<String> newsTypes,
  required String currentType,
  required Function(String) onSelected,
}) {
  int selectedIndex = newsTypes.indexOf(currentType);

  showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.deepOrange,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close",
                      style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    onSelected(newsTypes[selectedIndex]);
                    Navigator.pop(context);
                  },
                  child:
                      const Text("Done", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200.0,
            child: CupertinoPicker(
              scrollController:
                  FixedExtentScrollController(initialItem: selectedIndex),
              backgroundColor: Colors.white,
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                selectedIndex = index;
              },
              children: newsTypes.map((type) => Text(type)).toList(),
            ),
          ),
        ],
      );
    },
  );
}
