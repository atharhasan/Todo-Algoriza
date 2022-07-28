import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';

class SchedulItem extends StatelessWidget {
  const SchedulItem(
      {Key? key, required this.startTimeTxt, required this.titleTxt})
      : super(key: key);
  final String startTimeTxt;
  final String titleTxt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            CustomText(txt: startTimeTxt, fontSize: 20),
            const SizedBox(
              height: 5,
            ),
            CustomText(txt: titleTxt, fontSize: 20)
          ],
        ),
      ),
    );
  }
}
