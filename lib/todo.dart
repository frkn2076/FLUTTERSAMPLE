import 'package:flutter/material.dart';
import 'package:fluttersample/util/caller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: TodoPage(
        isTurkish: isTurkish,
      ),
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
                context,
                MaterialPageRoute(
                    builder: (context) => Login(
                          isTurkish: widget.isTurkish,
                        )));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
              Color(0xFF90CAF9),
              Color(0xFF64B5F6),
              Color(0xFF42A5F5)
            ],
            stops: [0.1, 0.3, 0.5, 0.7, 0.9],
          ),
        ),
        child: Column(
          children: <Widget>[
            emptyInterval(),
            emptyInterval(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            buildButtonWidget(widget.isTurkish ? "Ekle" : "Add"),
            emptyInterval(),
            emptyInterval(),
            buildTodoList(context),
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

  Widget buildButtonWidget(String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 20,
      height: MediaQuery.of(context).size.width / 20,
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
        ),
      ),
    );
  }

  Widget buildTodoList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: MediaQuery.of(context).size.width / 10,
      child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
              ),
            ),
            DataColumn(
              label: Text(
                'Description',
              ),
            ),
            DataColumn(
              label: Text(
                'Deadline',
              ),
            ),
            DataColumn(
              label: Text(
                'IsCompleted',
              ),
            ),
          ],
          rows: API
                  .fetchTodos()
                  .todos
                  ?.map((todo) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(todo.name.toString())),
                          DataCell(Text(todo.description.toString())),
                          DataCell(Text(todo.deadline.toString())),
                          DataCell(Text(todo.isCompleted.toString())),
                        ],
                      ))
                  .toList() ??
              _popup(context)),
    );
  }

  _popup(BuildContext context) {
    Alert(
      context: context,
      title: widget.isTurkish
          ? "Beklenmedik bir hata oluştu!"
          : "Something went wrong!",
    ).show();
  }
}
