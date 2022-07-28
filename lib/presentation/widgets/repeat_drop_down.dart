import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';

class RepeatDropDown extends StatefulWidget {
  const RepeatDropDown({Key? key}) : super(key: key);

  @override
  State<RepeatDropDown> createState() => _RepeatDropDownState();
}

class _RepeatDropDownState extends State<RepeatDropDown> {
  List<String> repeatItem = [
    'None',
    'Daily',
    'Weekly',
    'Monthly',
  ];
  String currentSelectedItem = 'None';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            txt: 'Remind',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 70,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: DropdownButton(
                items: repeatItem.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                isExpanded: true,
                iconSize: 20,
                underline: Container(
                  height: 0,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                ),
                hint: CustomText(
                  txt: 'Select Remind',
                  fontSize: 15,
                  fontColor: Colors.grey,
                ),
                value: currentSelectedItem,
                onChanged: (String? newvalue) {
                  setState(() {
                    currentSelectedItem = newvalue!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
