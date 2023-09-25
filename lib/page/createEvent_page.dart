import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';

Color pickerColor = Color(0xff443a49);
Color currentColor = Color(0xff443a49);

final listCategory = <String>['Brainstorm', 'Design', 'Workout'];
final listColor = <Color>[Colors.purple, Colors.green, Colors.blue];


class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({super.key});

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  bool light = false;
  TextEditingController myController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TimeOfDay? selectedTime;
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    _startTimeController.text = "";
    _endTimeController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 650,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Add New Event',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              hintText: 'Event name*',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              hintText: 'Type the note here...',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            readOnly: true,
            controller: _dateController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                hintText: 'Date',
                suffixIcon: Icon(Icons.calendar_today)),
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2025),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  _dateController.text =
                      DateFormat('dd/MM/yyyy').format(selectedDate);
                }
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter date.';
              }
              return null;
            },

          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    controller: _startTimeController,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Start time',
                        suffixIcon: const Icon(Icons.alarm)),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      setState(() {
                        _startTimeController.text = pickedTime!.format(context);
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: TextFormField(
                    controller: _endTimeController,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'End time',
                        suffixIcon: Icon(Icons.alarm)),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      setState(() {
                        _endTimeController.text = pickedTime!.format(context);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Remind me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Switch(
                  value: light,
                  activeColor: Colors.purple,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  })
            ],
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select Category',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 50,
                        width: 140,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: listColor[index],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    listCategory[index],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ])),
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              child: const Text(
                "+ Add new",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple),
              ),
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Text('Add New Category'),
                        actions: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: myController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: 'Category name',
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Pick a color!'),
                                            content: SingleChildScrollView(
                                              child: ColorPicker(
                                                pickerColor: currentColor,
                                                onColorChanged: (Color color) {
                                                  setState(() {
                                                    currentColor = color;
                                                  });
                                                },
                                              ),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: const Text('DONE'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Text("Pick a color"),
                                ),
                                ElevatedButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    if (myController.text != '') {
                                      listCategory.add(myController.text);
                                      listColor.add(currentColor);
                                    }
                                    myController.clear();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.purple),
              onPressed: () {
                Navigator.pop(context, 'ok');
              },
              child: const Text(
                'Create Event',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
