part of '../pages.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  final _controllerPage = Get.put(AnualController());

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: ui.Color.fromARGB(220, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                        8.0), // Set the desired border radius
                  ),
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.only(bottom: 15),
                  titlePadding: EdgeInsets.only(top: 25),
                  title: const Center(
                    child: Text(
                      'Hello',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Keluar dari aplikasi?',
                        style: firstStyle.copyWith(
                            fontSize: 13, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 1),
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Colors.black12),
                                    right: BorderSide(color: Colors.black12))),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 1),
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(color: Colors.black12),
                            )),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  SystemNavigator.pop();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))) ??
        false;
  }

  Widget listMeeting(BuildContext context) {
    return GetBuilder<AnualController>(builder: (_) {
      return Container(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            // ignore: unnecessary_null_comparison
            children: _controllerPage.stmeetingData == null
                ? []
                : _controllerPage.stmeetingData.isEmpty
                    ? []
                    : _controllerPage.stmeetingData.map((element1) {
                        return itemMeeting(element1, context);
                      }).toList(),
          ),
        ),
      );
    });
  }

  String formatDate(String? date) {
    if (date == null) return 'Unknown Date';
    try {
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);
      return DateFormat('dd MMMM yyyy').format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  Widget itemMeeting(StmeetingData item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailMomPage(item: item, meeting: MeetingData()),
          transition: Transition.fadeIn, // Atur tipe transisi jika diperlukan
          duration: Duration(milliseconds: 450), // Durasi transisi
        );
        ;
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Meeting ${item.name}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: mainColor,
                            border: null,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Completed',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: mainColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(width: 3),
                    ],
                  )
                ],
              ),
            ),
            Text(
              '${item.meetings?.length ?? 0} Meeting',
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        title: "Folder Page",
        theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
        home: RefreshIndicator(
          onRefresh: () async {
            await _controllerPage.initPage(context);
          },
          child: Scaffold(
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
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: AlertDialog(
                              backgroundColor:
                                  ui.Color.fromARGB(220, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set the desired border radius
                              ),
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.only(bottom: 15),
                              titlePadding: EdgeInsets.only(top: 25),
                              title: const Center(
                                child: Text(
                                  'Confirm Dialog',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      'Apakah anda ingin membuat Minutes of Meeting untuk pertama-kalinya?',
                                      style: firstStyle.copyWith(
                                          fontSize: 13, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                2,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 1),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.black12),
                                                right: BorderSide(
                                                    color: Colors.black12))),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(CreateMomPage());
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                2,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                          top:
                                              BorderSide(color: Colors.black12),
                                        )),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(CreateMom1Page());
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CalendarPage(),
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
                            MdiIcons.calendar,
                            color: whiteColor,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.folder, color: blackColor, size: 25),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProfilePage(),
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
                    Icon(Icons.folder, size: 25, color: blackColor),
                    const SizedBox(width: 10),
                    const Text(
                      "Folder Meeting",
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
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder<AnualController>(
                initState: (state) async {
                  await _controllerPage.initPage(context);
                },
                builder: (_) {
                  return Container(
                    child: _controllerPage.meetingData.isEmpty
                        ? Center(
                            child: Container(
                                margin: EdgeInsets.only(bottom: 80),
                                child: const Text(
                                    'Anda tidak memiliki catatan meeting')),
                          )
                        : listMeeting(context),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
