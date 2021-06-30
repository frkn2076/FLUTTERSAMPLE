import 'package:flutter/material.dart';

import 'login.dart';

class Todo extends StatelessWidget {
  final bool isTurkish;
  Todo({this.isTurkish = true}) : super();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TodoPage(isTurkish: isTurkish,),
    );
  }
}

class TodoPage extends StatefulWidget {
  final bool isTurkish;
  TodoPage({this.isTurkish = true}) : super();
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _isCompletedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isTurkish ? "ToDo Sayfası" : "ToDo Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            emptyInterval(),
            Container(
              child: Row(
                children: [
                  emptyInterval(),
                  buildTextWidget(_nameController, 'Enter Name of Todo'),
                  emptyInterval(),
                  buildTextWidget(
                      _descriptionController, 'Enter Description of Todo'),
                  emptyInterval(),
                  buildTextWidget(
                      _deadlineController, 'Enter Deadline of Todo'),
                  emptyInterval(),
                  buildTextWidget(
                      _isCompletedController, 'Enter IsCompleted of Todo'),
                ],
              ),
            ),
            buildTextWidget(_nameController, 'Enter Name of Todo1'),
            buildTextWidget(_nameController, 'Enter Name of Todo2'),
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
