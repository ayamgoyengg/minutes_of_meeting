part of '../pages.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _controllerPage = Get.put(CalendarPageController());

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  insetPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 24),
                  title: const Center(
                    child: Text(
                      'Hello',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                  ),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Keluar dari aplikasi?',
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: Text(
                              'Tidak',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Container(
                            height:
                                50, // Adjust height of the divider to match button height
                            width: 1, // Adjust width of the divider as needed
                            color: Colors.black12,
                          ),
                          TextButton(
                            child: Text(
                              'Iya',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ))) ??
        false;
  }

  Color _generateRandomColor(List<Color> colors, Random random) {
    return colors[random.nextInt(colors.length)];
  }

  final List<Color> randomColors = [
    "#8000FF".toColor(),
    "#9C9AFF".toColor(),
    "#FFA800".toColor(),
    "#913BFF".toColor(),
    "#37B5BD".toColor(),
    "#400092".toColor(),
    "#DB4BFF".toColor(),
    "#4B88FF".toColor(),
    "#0300A1".toColor(),
    "#FFC42D".toColor(),
  ];

  final Random random = Random();

  _DataSource _getCalendarDataSource() {
    // Fetch the meeting data from the controller
    final meetingData = _controllerPage.meetingData;

    // Ensure meetingData is not null and convert it to a list of Meeting objects
    final meetings = meetingData.map((meeting) {
      // Extract the date information
      String? dateString = meeting.date;

      // Konversi string tanggal menjadi objek DateTime
      DateTime date = DateTime.parse(dateString!);

      // Format tahun, bulan, dan hari sebagai integer
      int year = date.year;
      int month = date.month;
      int day = date.day;

      // Buat objek DateTime untuk startDate dan endDate
      final startDate = DateTime(year, month, day, 0, 0, 0);
      final endDate = DateTime(
          year, month, day, 23, 59, 59); // Menggunakan waktu akhir hari

      return Meeting(
        eventName: 'Meeting ke- ${meeting.title} (${meeting.stmeeting?.name})',
        from: startDate,
        to: endDate,
        background: _generateRandomColor(randomColors, random),
      );
    }).toList();

    return _DataSource(meetings);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
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
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 24),
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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
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
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        'Iya',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Get.to(CreateMom1Page());
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
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
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  MainPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ));
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.calendar,
                          color: blackColor,
                          size: 25,
                        ),
                      ],
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
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FolderPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ));
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
                        Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          ProfilePage(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ));
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
                    Icon(Icons.calendar_month, size: 25, color: blackColor),
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
            //   body: Column(
            //     children: [
            //       Expanded(
            //         child: ListView(
            //           padding: const EdgeInsets.all(0),
            //           children: [
            //             Container(
            //               padding: const EdgeInsets.symmetric(horizontal: 20),
            //               height: MediaQuery.of(context).size.height *
            //                   0.82, // Adjust as needed
            //               child: SfCalendar(
            //                 backgroundColor: backgroundColor,
            //                 view: CalendarView.month,
            //                 monthViewSettings: const MonthViewSettings(
            //                   monthCellStyle: MonthCellStyle(),
            //                   dayFormat: 'EEE',
            //                   appointmentDisplayCount: 2,
            //                   showAgenda: true,
            //                   agendaViewHeight: 250,
            //                 ),
            //                 dataSource: _getCalendarDataSource(),
            //                 headerStyle: const CalendarHeaderStyle(
            //                   backgroundColor: Color(0xFFEEEEEE),
            //                   textStyle: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //                 todayHighlightColor:
            //                     mainColor, // Highlight color for today's date
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            body: FutureBuilder(
              future: _controllerPage
                  .initPage(context), // Ensure the data is loaded
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child:
                          CircularProgressIndicator()); // Show a loading indicator while data is loading
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}')); // Handle errors
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: MediaQuery.of(context).size.height * 0.82,
                              child: SfCalendar(
                                backgroundColor: backgroundColor,
                                view: CalendarView.month,
                                monthViewSettings: const MonthViewSettings(
                                  monthCellStyle: MonthCellStyle(),
                                  dayFormat: 'EEE',
                                  appointmentDisplayCount: 3,
                                  showAgenda: true,
                                  agendaViewHeight: 250,
                                ),
                                dataSource: _getCalendarDataSource(),
                                headerStyle: CalendarHeaderStyle(
                                  backgroundColor: Color(0xFFEEEEEE),
                                  textStyle: firstStyle.copyWith(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                todayHighlightColor: mainColor,
                                appointmentBuilder: (context, details) {
                                  final appointment = details.appointments
                                      .first; // Get the first appointment
                                  return CustomAppointmentWidget(
                                      meeting: appointment as Meeting);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          )),
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

class CustomAppointmentWidget extends StatelessWidget {
  final Meeting meeting;

  CustomAppointmentWidget({required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: meeting.background,
        borderRadius: BorderRadius.circular(8.0), // Add rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Text(
        meeting.eventName,
        style: firstStyle.copyWith(color: Colors.white, fontSize: 12),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
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
