import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  DateTime deadline;

  Task({required this.title, required this.description, required this.deadline});
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void addTask(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void openTaskDetails(Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              ListTile(
                title: Text('Title: ${task.title}'),
              ),
              ListTile(
                title: Text('Description: ${task.description}'),
              ),
              ListTile(
                title: Text('Deadline: ${task.deadline.toString()}'),
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete Task'),
                onTap: () {
                  deleteTask(task);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            onTap: () => openTaskDetails(task),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String title = '';
              String description = '';
              DateTime? deadline;

              return AlertDialog(
                title: Text('Add Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        title = value;
                      },
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      onChanged: (value) {
                        description = value;
                      },
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                    TextField(
                      onChanged: (value) {
                        // You can use a date picker here to select the deadline
                        // For simplicity, we'll use a text field for input
                        deadline = DateTime.tryParse(value);
                      },
                      decoration: InputDecoration(labelText: 'Deadline'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {
                      Task newTask = Task(
                        title: title,
                        description: description,
                        deadline: deadline ?? DateTime.now(),
                      );
                      addTask(newTask);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
