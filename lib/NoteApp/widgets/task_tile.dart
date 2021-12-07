import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('This is a task'),
      trailing: TaskCheckbox(),
    );
  }
}

class TaskCheckbox extends StatefulWidget {
  const TaskCheckbox({Key? key}) : super(key: key);

  @override
  State<TaskCheckbox> createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) {
          setState(() {
            isChecked = newValue;
          });
        });
  }
}
