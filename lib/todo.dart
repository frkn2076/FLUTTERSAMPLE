import 'package:flutter/material.dart';

void main() => runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TodoPage(title: 'Flutter Sample'),
    );
  }
}

class TodoPage extends StatefulWidget {
  TodoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int _counter = 0;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final deadlineController = TextEditingController();
  final isCompletedController = TextEditingController();
  // MediaQuery.of(context).size.width
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            emptyInterval(),
            Container(
              child: Row(
                children: [
                  emptyInterval(),
                  buildTextWidget(nameController, 'Enter Name of Todo'),
                  emptyInterval(),
                  buildTextWidget(
                      descriptionController, 'Enter Description of Todo'),
                  emptyInterval(),
                  buildTextWidget(deadlineController, 'Enter Deadline of Todo'),
                  emptyInterval(),
                  buildTextWidget(
                      isCompletedController, 'Enter IsCompleted of Todo'),
                ],
              ),
            ),
            buildTextWidget(nameController, 'Enter Name of Todo1'),
            buildTextWidget(nameController, 'Enter Name of Todo2'),
          ],
        ),
      ),
    );
  }

  Widget emptyInterval() {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 40,
        height: MediaQuery.of(context).size.height / 40);
  }

  Widget buildTextWidget(TextEditingController controller, String hintText) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: MediaQuery.of(context).size.width / 10,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
