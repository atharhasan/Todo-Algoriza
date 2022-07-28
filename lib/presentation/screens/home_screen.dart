import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/business_logic/cubit/cubit/tasks_cubit.dart';
import 'package:todo_app/business_logic/cubit/notes_cubit.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/models/notes.dart';
import 'package:todo_app/presentation/widgets/custom_button.dart';
import 'package:todo_app/presentation/widgets/custom_text.dart';
import 'package:todo_app/presentation/widgets/home_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Notes> notes = [];
  TabController? _tabController;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TasksCubit>(context).getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          title: CustomText(
            txt: 'Board',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontColor: Colors.black,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_month_rounded),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200, width: 1)),
              child: TabBar(
                tabs: [
                  Tab(
                      child: CustomText(
                    txt: 'All',
                    fontSize: 13,
                    fontColor: Colors.black,
                  )),
                  Tab(
                      child: CustomText(
                    txt: 'Completed',
                    fontSize: 12,
                    fontColor: Colors.black,
                  )),
                  Tab(
                      child: CustomText(
                    txt: 'Uncompleted',
                    fontSize: 10,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
                  Tab(
                      child: CustomText(
                    txt: 'Favorite',
                    fontSize: 13,
                    fontColor: Colors.black,
                  )),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            if (state is GetAllNotes) {
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return HomeItem(
                      isChecked: isChecked,
                      onChanged: (value) {},
                      txt: notes[index].title,
                      fontSize: 15);
                },
                shrinkWrap: true,
              );
            } else {
              return Container(
                child: CustomText(
                  txt: 'No Notes Found',
                  fontSize: 30,
                  fontColor: Colors.grey,
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
        bottomSheet: CustomButton(
            txt: 'Add a task',
            onPress: () {
              Navigator.of(context).pushNamed(addTaskScreen);
            }),
      ),
    );
  }
}
