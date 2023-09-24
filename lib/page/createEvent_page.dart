import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({super.key});

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

final listCategory = <String>['Brainstorm', 'Design', 'Workout'];
final listColor = <Color>[Colors.purple, Colors.green, Colors.blue];

class _CreateEventWidgetState extends State<CreateEventWidget> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 650,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
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
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                hintText: 'Date',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset('assets/icons/ic_calendar.svg')),
                suffixIconConstraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Start time',
                        suffixIcon: Padding(padding: EdgeInsets.only(right: 10),
                        child: SvgPicture.asset('assets/icons/ic_clock.svg')),
                        suffixIconConstraints: BoxConstraints(maxHeight: 30, maxWidth: 30),),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'End time',
                        suffixIcon: Padding(padding: EdgeInsets.only(right: 10),
                        child: SvgPicture.asset('assets/icons/ic_clock.svg')),
                        suffixIconConstraints: BoxConstraints(maxHeight: 30, maxWidth: 30),),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Remind me'),
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
          Align(
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
                                    Icons.circle_outlined,
                                    size: 10,
                                    color: listColor[index],
                                  ),
                                  SizedBox(
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
              child: Text(
                "+ Add new",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple),
              ),
              onTap: () {},
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
