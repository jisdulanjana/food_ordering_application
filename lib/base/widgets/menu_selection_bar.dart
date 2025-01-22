import 'package:flutter/material.dart';
import 'package:food_ordering_application/base/res/styles/app_styles.dart';

// Menu options as a constant list
const List<String> menuOptions = ['LUNCH MENU', 'DINNER MENU', 'BREAKFAST MENU'];

class MenuSelectionBar extends StatefulWidget {
  const MenuSelectionBar({super.key});

  @override
  State<MenuSelectionBar> createState() => _MenuSelectionBarState();
}

class _MenuSelectionBarState extends State<MenuSelectionBar> {
  String selectedOption = menuOptions.first; 

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Select an Option",
                style: AppStyles.bodyLarge,
              ),
            ),
            const Divider(),
            ...menuOptions.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                child: RadioListTile<String>(
                  activeColor: Colors.green, 
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8.0), 
                    child: Text(option), 
                  ),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedOption = value; 
                      });
                      Navigator.pop(context); 
                    }
                  },
                ),
              );
            }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width; 
    final buttonWidth = size *0.5; // Button width set to 1/2 of screen width

    return Container(
      width: buttonWidth,
      decoration: BoxDecoration(
        color: AppStyles.fillColor, 
        borderRadius: BorderRadius.circular(8), 
      ),
      child: TextButton(
        onPressed: () => _showBottomSheet(context), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedOption, 
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down, 
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
