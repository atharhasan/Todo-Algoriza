import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {Key? key,
      required this.txt,
      required this.hint,
      this.errorMsg,
      this.suffixIcon,
      this.onTap,
      this.textController})
      : super(key: key);

  final String txt;
  final String hint;
  final String? errorMsg;
  final Widget? suffixIcon;
  final Function()? onTap;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            txt: txt,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hint,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
            controller: textController,
            validator: (value) {
              if (value!.isEmpty) {
                return errorMsg;
              }
            },
            onSaved: (value) {},
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
