part of '../pages.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calendar Page",
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: Scaffold(
        extendBody: true,
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mainColor, "#191919".toColor()],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        insetPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 24),
                        title: const Center(
                          child: Text(
                            'Hello',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                        ),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Apakah anda ingin membuat Minutes of Meeting untuk Klien ini untuk pertama kalinya?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                            Divider(
                              color: Colors.black12,
                              height: 1, // Adjust height of the divider
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text(
                                  'Iya',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                                onPressed: () {
                                  Get.to(const CreateMom1Page());
                                },
                              ),
                              Container(
                                height:
                                    50, // Adjust height of the divider to match button height
                                width:
                                    1, // Adjust width of the divider as needed
                                color: Colors.black12,
                              ),
                              TextButton(
                                child: Text('Tidak',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20)),
                                onPressed: () {
                                  Get.to(CreateMomPage());
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              },
              shape: const CircleBorder(),
              backgroundColor: mainColor,
              elevation: 0, // Remove the shadow
              child: Icon(MdiIcons.plus, size: 35, color: whiteColor),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 60,
          color: mainColor,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            StadiumBorder(),
          ),
          notchMargin: 5,
          child: Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.to(MainPage());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.home,
                        color: whiteColor,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CalendarPage());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        MdiIcons.calendar,
                        color:  blackColor,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(FolderPage());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(MdiIcons.folder, color: whiteColor, size: 25),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ProfilePage());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, color: whiteColor, size: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: backgroundColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, size: 25, color: blackColor),
                const SizedBox(width: 10),
                const Text(
                  "Calendar",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height *
                        0.82, // Adjust as needed
                    child: SfCalendar(
                      backgroundColor: backgroundColor,
                      view: CalendarView.month,
                      monthViewSettings: const MonthViewSettings(
                        monthCellStyle: MonthCellStyle(),
                        dayFormat: 'EEE',
                        appointmentDisplayCount: 2,
                        showAgenda: true,
                        agendaViewHeight: 250,
                      ),
                      dataSource: _getCalendarDataSource(),
                      headerStyle: const CalendarHeaderStyle(
                        backgroundColor: Color(0xFFEEEEEE),
                        textStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      todayHighlightColor:
                          mainColor, // Highlight color for today's date
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Meeting {
  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  Meeting({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    this.isAllDay = false,
  });
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments?[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments?[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments?[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments?[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments?[index].isAllDay;
  }
}

_DataSource _getCalendarDataSource() {
  List<Meeting> meetings = <Meeting>[
    Meeting(
      eventName: 'Event A',
      from: DateTime(2024, 7, 15, 9, 0, 0),
      to: DateTime(2024, 7, 15, 10, 0, 0),
      background: mainColor,
    ),
    Meeting(
      eventName: 'Event B',
      from: DateTime(2024, 7, 15, 15, 0, 0),
      to: DateTime(2024, 7, 15, 16, 30, 0),
      background: mainColor,
    ),
    Meeting(
      eventName: 'Event C',
      from: DateTime(2024, 7, 16, 11, 0, 0),
      to: DateTime(2024, 7, 16, 12, 0, 0),
      background: mainColor,
    ),
  ];

  return _DataSource(meetings);
}
