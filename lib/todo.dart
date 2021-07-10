import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttersample/models/todosresponse.dart';
import 'package:fluttersample/util/caller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login.dart';

class Todo extends StatelessWidget {
  final bool isTurkish;
  Todo({Key? key, this.isTurkish = true}) : super(key: key);
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
  TodoPage({Key? key, this.isTurkish = true}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  Future<TodosResponse> _futureTodos = getTodos();

  @override
  void initState() {
    _futureTodos = getTodos();
    super.initState();
  }

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _deadline = DateTime.now();
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isTurkish ? 'ToDo Sayfası' : 'ToDo Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(isTurkish: widget.isTurkish),
              ),
            );
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
        child: Column(children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[
                emptyInterval(context),
                emptyInterval(context),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      emptyInterval(context),
                      buildTextWidget(context, _nameController,
                          widget.isTurkish ? 'İsim giriniz' : 'Enter name'),
                      emptyInterval(context),
                      buildTextWidget(
                          context,
                          _descriptionController,
                          widget.isTurkish
                              ? 'Tanım giriniz'
                              : 'Enter description'),
                      emptyInterval(context),
                      buildDateTimePicker(context),
                      emptyInterval(context),
                      buildCheckboxWidget(context,
                          widget.isTurkish ? 'Tamamlandı mı' : 'Is Completed')
                    ],
                  ),
                ),
                buildButtonWidget(context, widget.isTurkish ? 'Ekle' : 'Add'),
              ],
            ),
          ),
          emptyInterval(context),
          Expanded(
            flex: 4,
            child: buildTodoList(context),
          ),
        ]),
      ),
    );
  }

  Widget emptyInterval(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 40,
        height: MediaQuery.of(context).size.height / 40);
  }

  Widget buildTextWidget(
      BuildContext context, TextEditingController controller, String hintText) {
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

  Widget buildCheckboxWidget(BuildContext context, String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: MediaQuery.of(context).size.width / 10,
      child: CheckboxListTile(
        checkColor: Colors.black,
        activeColor: Colors.blue,
        title: Text(text),
        value: _isComplete,
        onChanged: (newValue) {
          setState(() {
            _isComplete = newValue == true;
          });
        },
      ),
    );
  }

  Widget buildDateTimePicker(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 13),
      child: OutlinedButton(
        onPressed: () {
          var now = DateTime.now();
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: now,
              maxTime: DateTime(now.year + 10, now.month, now.day),
              onChanged: (date) {}, onConfirm: (date) {
            setState(() {
              _deadline = date;
            });
          },
              currentTime: DateTime.now(),
              locale: widget.isTurkish ? LocaleType.tr : LocaleType.en);
        },
        child: Text(
          _deadline.toString(),
          style: TextStyle(color: Colors.blue),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonWidget(BuildContext context, String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 20,
      height: MediaQuery.of(context).size.width / 20,
      child: TextButton(
        onPressed: () {
          var formattedDate = dateFormatter(_deadline);
          addTodo(widget.isTurkish ? "TR" : "EN", _nameController.text,
                  _descriptionController.text, formattedDate, _isComplete)
              .then((value) => setState(() {
                    _futureTodos = getTodos();
                  }));
        },
        child: Text(
          text,
        ),
      ),
    );
  }

  Widget buildTodoList(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        child: FutureBuilder<TodosResponse>(
          future: _futureTodos,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data?.isSuccess == true) {
              return DataTable(
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
                  rows: snapshot.data!.todos!
                      .map((todo) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(todo.name!.toString())),
                              DataCell(Text(todo.description!.toString())),
                              DataCell(Text(todo.deadline!.toString())),
                              DataCell(Text(todo.isCompleted!.toString())),
                            ],
                          ))
                      .toList());
            } else if (snapshot.hasData && snapshot.data?.isSuccess != true) {
              _popup(context, message: snapshot.data?.errorMessage);
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  _popup(BuildContext context, {String? message}) {
    Alert(
        context: context,
        title: message ??
            (widget.isTurkish
                ? 'Geçici süre hizmet veremiyoruz'
                : 'We are temporarily unavailable'),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Text(
              widget.isTurkish ? 'Tamam' : 'Okay',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  String dateFormatter(DateTime date) {
    var tire = "-";
    return date.year.toString().padLeft(2, '0') +
        tire +
        date.month.toString().padLeft(2, '0') +
        tire +
        date.day.toString().padLeft(2, '0') +
        "T00:00:00+03:00";
  }
}
