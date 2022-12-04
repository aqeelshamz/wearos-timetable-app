import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Row subjectText(String text) {
    return Row(
      children: [
        const Icon(FeatherIcons.bookOpen, color: Colors.white, size: 18),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextButton button(String text) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text),
    );
  }

  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return formattedDate;
  }

  Map data = {
    "Monday": [
      {"time": "9am - 10am", "subject": "D&E"},
      {"time": "10am - 11am", "subject": "DMS"},
      {"time": "11am - 12pm", "subject": "LSD"},
      {"time": "1pm - 2pm", "subject": "DS"},
      {"time": "2pm - 3pm", "subject": "OOP"},
      {"time": "3pm - 4pm", "subject": "OOP"},
    ],
    "Tuesday": [
      {"time": "9am - 10am", "subject": "DMS"},
      {"time": "10am - 11am", "subject": "DS"},
      {"time": "11am - 12pm", "subject": "OOP"},
      {"time": "1pm - 2pm", "subject": "LAB"},
      {"time": "2pm - 3pm", "subject": "LAB"},
      {"time": "3pm - 4pm", "subject": "LAB"},
    ],
    "Wednesday": [
      {"time": "9am - 10am", "subject": "LSD"},
      {"time": "10am - 11am", "subject": "DS"},
      {"time": "11am - 12pm", "subject": "LSD"},
      {"time": "1pm - 2pm", "subject": "SuE"},
      {"time": "2pm - 3pm", "subject": "Minor"},
      {"time": "3pm - 4pm", "subject": "Minor"},
    ],
    "Thursday": [
      {"time": "9am - 10am", "subject": "OOP"},
      {"time": "10am - 11am", "subject": "DMS"},
      {"time": "11am - 12pm", "subject": "DS"},
      {"time": "1pm - 2pm", "subject": "LAB"},
      {"time": "2pm - 3pm", "subject": "LAB"},
      {"time": "3pm - 4pm", "subject": "LAB"},
    ],
    "Friday": [
      {"time": "9am - 10am", "subject": "D&E"},
      {"time": "10am - 11am", "subject": "LSD"},
      {"time": "11am - 12pm", "subject": "DMS"},
      {"time": "1pm - 2pm", "subject": "SuE"},
      {"time": "2pm - 3pm", "subject": "Minor"},
      {"time": "3pm - 4pm", "subject": "Minor"},
    ],
  };

  List<Widget> getSubjects(String day) {
    List<Widget> subjects = [];

    if (!data.keys.contains(day)) {
      return [
        SizedBox(
          height: Get.height * 0.5,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FeatherIcons.sun, color: Colors.yellow),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Holiday",
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        )
      ];
    }

    for (var subject in data[day]) {
      subjects.add(Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          border: Border.all(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(FeatherIcons.clock, color: Colors.white, size: 12),
                const SizedBox(width: 5),
                Text(
                  subject["time"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            subjectText(subject["subject"]),
          ],
        ),
      ));
    }

    return subjects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(Get.width * 0.1),
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children:
                    getSubjects(DateFormat('EEEE').format(DateTime.now())),
              ),
              const SizedBox(height: 10),
              const Text(
                "@aqeelshamz",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
