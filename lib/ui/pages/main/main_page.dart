part of '../pages.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controllerPage = Get.put(HomeController());
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> stMeetingPhoto = [
    'assets/meeting.png',
    'assets/meeting2.png',
    'assets/meeting3.png',
    'assets/meeting4.png',
    'assets/meeting5.png',
    'assets/workshop.png',
    'assets/brainstorming.png'
  ];

  Widget itemStmeeting(BuildContext context, StmeetingData item) {
    final randomImage = stMeetingPhoto[Random().nextInt(stMeetingPhoto.length)];

    return GestureDetector(
      onTap: () {
        Get.to(DetailMomPage(item: item, meeting: MeetingData()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Change to your widgetColor
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.all(10),
        width: 120,
        height: 150,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color:
                              mainColor, // Change to your widgetBackgroundColor
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 65,
                        height: 65,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          randomImage,
                        ),
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
                        item.name!,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${item.meetings?.length ?? 0} Meeting${item.meetings?.length == 1 ? '' : 's'}',
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
    );
  }

  Widget listMeeting(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            // ignore: unnecessary_null_comparison
            children: _controllerPage.meetingData == null
                ? []
                : _controllerPage.meetingData.isEmpty
                    ? []
                    : _controllerPage.meetingData.map((element1) {
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

  Widget itemMeeting(MeetingData meeting, BuildContext context) {
    StmeetingData item = StmeetingData(name: meeting.stmeeting?.name);
    return GestureDetector(
      onTap: () {
        Get.to(AddDetailMomPage(
          meeting: meeting,
          item: item,
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: widgetBackgroundColor2,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 21,
                    height: 21,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                        child: Icon(MdiIcons.calendarOutline,
                            color: Colors.white, size: 13))),
                const SizedBox(width: 7),
                Container(
                    height: 21,
                    padding: const EdgeInsets.all(3),
                    child: Text(formatDate(meeting.date!),
                        style: TextStyle(
                            color: greyColor,
                            fontSize: 10,
                            fontFamily: "Poppins")))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                    'Meeting ke- ${meeting.title} (${meeting.stmeeting?.name})',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13)),
                const SizedBox(height: 7),
                MyWidget(
                  ownerPhotoUrl: meeting.owner?.profilePhotoUrl,
                  forwardPhotoUrl: meeting.forward?.profilePhotoUrl,
                )
              ],
            )
          ],
        ),
      ),
    );
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
          scaffoldBackgroundColor: "#eee".toColor(),
        ),
        title: "Home Page",
        home: RefreshIndicator(
            onRefresh: () async {
              await _controllerPage.initPage(context);
            },
            child: Scaffold(
                backgroundColor: "#eee".toColor(),
                body: GetBuilder<HomeController>(initState: (state) async {
                  await _controllerPage.initPage(context);
                }, builder: (_) {
                  return Scaffold(
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
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25),
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
                                            height:
                                                1, // Adjust height of the divider
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                child: Text(
                                                  'Iya',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20),
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
                                                        color: Colors.red,
                                                        fontSize: 20)),
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
                            child: Icon(MdiIcons.plus,
                                size: 35, color: whiteColor),
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
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(24)),
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
                                onTap: () {},
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
                                    Icon(MdiIcons.folder,
                                        color: whiteColor, size: 25),
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
                                    Icon(Icons.settings,
                                        color: whiteColor, size: 25),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      appBar: AppBar(
                        toolbarHeight: 80,
                        backgroundColor:
                            "#fff".toColor(), // Menjadikan AppBar transparan
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
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(EditProfilePage());
                                    },
                                    child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${PRO(context).userData?.profilePhotoUrl}"),
                                                fit: BoxFit.cover))),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Selamat Datang,',
                                              style: firstStyle.copyWith(
                                                  fontSize: 12,
                                                  color: blackColor)),
                                          const SizedBox(width: 5),
                                          Text(
                                              '${PRO(context).userData?.name}!',
                                              style: firstStyle.copyWith(
                                                  fontSize: 12,
                                                  color: mainColor,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Text('${PRO(context).userData?.roles}',
                                          style: firstStyle.copyWith(
                                              fontSize: 17,
                                              color: "#000".toColor(),
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w700))
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: greyColor,
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(backgroundImage),
                                              fit: BoxFit.cover)),
                                      child: Stack(children: [
                                        Container(
                                            height: 161,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: "#BCBCBC"
                                                  .toColor()
                                                  .withOpacity(0.41),
                                            ),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const TimeDisplay(),
                                                  Text(formattedDate,
                                                      style:
                                                          firstStyle.copyWith(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black))
                                                ]))
                                      ])),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: '#fefefe'.toColor(),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: 290,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.search, size: 20),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: TextField(
                                              controller: _searchController,
                                              onChanged: (value) {
                                                setState(() {
                                                  _searchText =
                                                      value.toLowerCase();
                                                });
                                              },
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Search category meeting',
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins'),
                                                isDense: true,
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
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
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    width: double.infinity,
                                    height: 230,
                                    color: backgroundColor,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: const Text(
                                            "Categories",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        GetBuilder<HomeController>(
                                          builder: (_) {
                                            List<StmeetingData> filteredList =
                                                _controllerPage.stmeetingData
                                                    .where((item) => item.name!
                                                        .toLowerCase()
                                                        .contains(_searchText))
                                                    .toList();
                                            return _controllerPage
                                                    .stmeetingData.isEmpty
                                                ? Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 40),
                                                    child: Center(
                                                      child: Text(
                                                          'Anda tidak memiliki kategori meeting'),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 160,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ListView.builder(
                                                      itemCount:
                                                          filteredList.length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        final item =
                                                            filteredList[index];
                                                        final leftPadding =
                                                            index == 0
                                                                ? 16.0
                                                                : 0.0; // defaultMargin value set to 16.0
                                                        return Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  leftPadding),
                                                          child: itemStmeeting(
                                                              context, item),
                                                        );
                                                      },
                                                    ),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          margin: const EdgeInsets.only(
                                              top: 1, bottom: 1),
                                          child: const Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Latest",
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "Meetings",
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        GetBuilder<HomeController>(
                                          initState: (state) async {
                                            await _controllerPage
                                                .initPage(context);
                                          },
                                          builder: (_) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: _controllerPage
                                                      .meetingData.isEmpty
                                                  ? Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 40),
                                                      child: Text(
                                                          'Anda tidak memiliki catatan meeting'),
                                                    )
                                                  : listMeeting(context),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 70),
                                ]),
                              ],
                            )),
                          ])));
                }))));
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
  final String? ownerPhotoUrl;
  final String? forwardPhotoUrl;

  const MyWidget({
    Key? key,
    this.ownerPhotoUrl,
    this.forwardPhotoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      ownerPhotoUrl ?? "default_image_url",  // Provide a default image URL
      forwardPhotoUrl ?? "default_image_url" // Provide a default image URL
    ];
    return ImageStack(
      imageBorderColor: backgroundColor,
      imageList: images,
      imageRadius: 25, // Radius of each image
      imageCount: 2, // Maximum number of images to be shown
      imageBorderWidth: 2,
      totalCount: 2, // Border width around the images
    );
  }
}

