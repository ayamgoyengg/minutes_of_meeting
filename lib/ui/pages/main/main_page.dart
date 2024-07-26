part of '../pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  // Variable to hold search query
  String query = '';

  List<Map<String, dynamic>> category = [
    {
      'name': 'BPR Wilis',
      'image': 'assets/meeting.png',
      'count': 2,
    },
    {
      'name': 'Surya Zig Zag',
      'image': 'assets/workshop.png',
      'count': 1,
    },
    {
      'name': 'PLN Batam',
      'image': 'assets/brainstorming.png',
      'count': 4,
    },
    // Add more meetings as needed
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";

    // Mendapatkan jam saat ini
    int currentHour = now.hour;

    // Menentukan gambar latar belakang berdasarkan waktu
    String backgroundImage;
    if (currentHour >= 5 && currentHour <= 10) {
      backgroundImage = 'assets/pagi.jpg';
    } else if (currentHour > 10 && currentHour <= 14) {
      backgroundImage = 'assets/siang.jpg';
    } else if (currentHour > 14 && currentHour <= 17) {
      backgroundImage = 'assets/sore.jpg';
    } else {
      backgroundImage = 'assets/malam.jpg';
    }
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
        ),
        title: "Home Page",
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
                              Row(
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
                        Get.to(MainPage());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.home,
                            color: blackColor,
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
              backgroundColor: "#fff".toColor(), // Menjadikan AppBar transparan
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
              title: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://get.pxhere.com/photo/person-suit-profile-male-portrait-young-professional-profession-hairstyle-social-media-elegant-cv-businessperson-white-collar-worker-459413.jpg"),
                                    fit: BoxFit.cover))),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Selamat Datang',
                                    style: firstStyle.copyWith(
                                        fontSize: 12, color: blackColor)),
                                const SizedBox(width: 5),
                                Text('Jamie!',
                                    style: firstStyle.copyWith(
                                        fontSize: 12,
                                        color: mainColor,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text('Project Manager',
                                style: firstStyle.copyWith(
                                    fontSize: 16,
                                    color: "#000".toColor(),
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: whiteColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
                child: Column(children: [
                  Expanded(
                      child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      Column(children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            height: 161,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: greyColor,
                                image: DecorationImage(
                                    image: AssetImage(backgroundImage),
                                    fit: BoxFit.cover)),
                            child: Stack(children: [
                              Container(
                                  height: 161,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        "#BCBCBC".toColor().withOpacity(0.41),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const TimeDisplay(),
                                        Text(formattedDate,
                                            style: firstStyle.copyWith(
                                                fontSize: 15,
                                                color: Colors.black))
                                      ]))
                            ])),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: '#fefefe'.toColor(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 290,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.search, size: 20),
                              SizedBox(width: 5),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: TextField(
                                    controller: _searchController,
                                    onChanged: (value) {
                                      setState(() {
                                        _searchText = value.toLowerCase();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Search category meeting',
                                      hintStyle: TextStyle(
                                          fontSize: 12, fontFamily: 'Poppins'),
                                      isDense: true,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              SizedBox(width: 20, height: 20),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: double.infinity,
                          height: 220,
                          color: backgroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _buildFilteredCards(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin:
                                    const EdgeInsets.only(top: 1, bottom: 1),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Latest",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Meetings",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),
                              SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: widgetBackgroundColor2,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20))),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: 21,
                                                      height: 21,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                              MdiIcons
                                                                  .calendarOutline,
                                                              color:
                                                                  Colors.white,
                                                              size: 13))),
                                                  const SizedBox(width: 7),
                                                  Container(
                                                      height: 21,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      child: Text(
                                                          "07 July 2024",
                                                          style: TextStyle(
                                                              color: greyColor,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  "Poppins")))
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Text(
                                                      "Meeting 01 Surya Zig Zag",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13)),
                                                  const SizedBox(height: 7),
                                                  const MyWidget()
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: widgetBackgroundColor2,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20))),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: 21,
                                                      height: 21,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                              MdiIcons
                                                                  .calendarOutline,
                                                              color:
                                                                  Colors.white,
                                                              size: 13))),
                                                  const SizedBox(width: 7),
                                                  Container(
                                                      height: 21,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      child: Text(
                                                          "07 July 2024",
                                                          style: TextStyle(
                                                              color: greyColor,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  "Poppins")))
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Text("Meeting 01 PLN Batam",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13)),
                                                  const SizedBox(height: 7),
                                                  const MyWidget()
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                      ]),
                    ],
                  )),
                ]))));
  }

  List<Widget> _buildFilteredCards() {
    List<Widget> filteredCards = [];

    // Example data (replace with your actual data or fetch from API)
    List<Map<String, dynamic>> meetings = [
      {
        "name": "BPR Wilis",
        "meetingCount": 2,
        "imageAsset": "assets/meeting.png"
      },
      {
        "name": "Surya Zig Zag",
        "meetingCount": 1,
        "imageAsset": "assets/workshop.png"
      },
      {
        "name": "PLN Batam",
        "meetingCount": 4,
        "imageAsset": "assets/brainstorming.png"
      },
    ];

    // Filter meetings based on search text
    for (var meeting in meetings) {
      if (_searchText.isEmpty ||
          meeting['name'].toLowerCase().contains(_searchText)) {
        filteredCards.add(
          GestureDetector(
            onTap: () {
              // Handle tap on the card
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Change to your widgetColor
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(10),
              width: 120,
              height: 150,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey, // Change to your widgetBackgroundColor
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.all(2),
                            child: Image.asset(
                              meeting['imageAsset'],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meeting['name'],
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${meeting['meetingCount']} Meeting',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return filteredCards;
  }
}

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Stream<String> _timeStream;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timeStream = Stream.periodic(const Duration(seconds: 1), (_) {
      _currentTime = DateTime.now();
      return DateFormat('HH:mm:ss').format(_currentTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _timeStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: firstStyle.copyWith(
                color: Colors.black, fontSize: 50, height: 0.9),
          );
        } else {
          return Text(
            '--:--:--',
            style: firstStyle.copyWith(
                color: Colors.black, fontSize: 50, height: 0.9),
          );
        }
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://get.pxhere.com/photo/person-suit-profile-male-portrait-young-professional-profession-hairstyle-social-media-elegant-cv-businessperson-white-collar-worker-459413.jpg",
      "https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720569600&semt=ais_user",
      "https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg"
    ];
    return ImageStack(
      imageBorderColor: backgroundColor,
      imageList: images,
      imageRadius: 25, // Radius of each images
      imageCount: 3, // Maximum number of images to be shown
      imageBorderWidth: 2,
      totalCount: 3, // Border width around the images
    );
  }
}
