import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  String date = "Date";
  String month = "Month";
  String year = "Year";
  bool showDate = false;
  bool showMonth = false;
  bool showYear = false;

  List dateList = [];
  List yearList = [];
  List monthList = [
    "Jan",
    'Feb',
    'Mar',
    'Apr',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
  @override
  void initState() {
    dateGenerate();
    yearGenerate();
    super.initState();
  }

  dateGenerate() {
    for (var i = 1; i <= 31; i++) {
      dateList.add(i);
    }
  }

  yearGenerate() {
    for (var i = 1990; i < 2022; i++) {
      yearList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calender"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalenderData(
                  text: date,
                  onTap: () {
                    setState(() {
                      if (showDate) {
                        showDate = false;
                        showMonth = false;
                        showYear = false;
                      } else {
                        showDate = true;
                        showMonth = false;
                        showYear = false;
                      }
                    });
                  },
                ),
                
                CalenderData(
                  text: month,
                  onTap: () {
                    setState(() {
                      if (showMonth) {
                        showDate = false;
                        showMonth = false;
                        showYear = false;
                      } else {
                        showDate = false;
                        showMonth = true;
                        showYear = false;
                      }
                    });
                  },
                ),
                CalenderData(
                  text: year,
                  onTap: () {
                    setState(() {
                      if (showYear) {
                        showDate = false;
                        showMonth = false;
                        showYear = false;
                      } else {
                        showDate = false;
                        showMonth = false;
                        showYear = true;
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showDate
                    ? Column(
                        children: List.generate(
                          dateList.length,
                          (index) => CalDropDown(
                            text: dateList[index].toString(),
                            onTap: () {
                              setState(() {
                                date = dateList.elementAt(index).toString();
                                showDate = false;
                              });
                            },
                          ),
                        ),
                      )
                    : Container(),
                showMonth
                    ? Column(
                        children: List.generate(
                            monthList.length,
                            (index) => CalDropDown(
                                text: monthList[index], onTap: () {
                                  setState(() {
                                    month = monthList.elementAt(index);
                                    showMonth = false;
                                  });



                                })),
                      )
                    : Container(),
                showYear
                    ? Column(
                        children: List.generate(
                            monthList.length,
                            (index) => CalDropDown(
                                text: yearList[index].toString(), onTap: () {
                                  setState(() {
                                    year = yearList.elementAt(index).toString();
                                    showYear = false;
                                  });

                                  
                                })),
                      )
                    : Container(),
              ],
            )

            // List.generate(dateList.length, (index) => return Text(index.toString()))
          ],
        ),
      ),
    );
  }
}

class CalDropDown extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CalDropDown({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Text(text));
  }
}

class CalenderData extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CalenderData({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Text(text));
  }
}
