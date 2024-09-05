part of '../pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controllerPage = Get.put(GlobalController());
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        title: "Setting Page",
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
                                    fontWeight: FontWeight.w700, fontSize: 20),
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
                                            padding: const EdgeInsets.symmetric(
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
                                        top: BorderSide(color: Colors.black12),
                                      )),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(CreateMom1Page());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
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
                        pageBuilder: (context, animation, secondaryAnimation) =>
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
                        pageBuilder: (context, animation, secondaryAnimation) =>
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, color: blackColor, size: 25),
                    ],
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: mainColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, size: 25, color: blackColor),
                  const SizedBox(width: 10),
                  const Text(
                    "Setting",
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
          body: SingleChildScrollView(
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 450,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: widgetColor,
                            border: null,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _showEnlargedProfilePhoto(context);
                                      //  Get.to(EditPhotoPage(user: UserData()));
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${PRO(context).userData?.profilePhotoUrl}"),
                                                    fit: BoxFit.cover))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${PRO(context).userData?.name}',
                                                style: firstStyle.copyWith(
                                                    fontSize: 13,
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Text('${PRO(context).userData?.roles}',
                                            style: firstStyle.copyWith(
                                                fontSize: 16,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black12,
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text("Account Settings",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontFamily: "Poppins",
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  EditProfilePage(),
                                  transition: Transition
                                      .fadeIn, // Atur tipe transisi jika diperlukan
                                  duration: Duration(
                                      milliseconds: 200), // Durasi transisi
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Edit Profile",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontFamily: "Poppins",
                                              fontSize: 14)),
                                    ),
                                    Icon(MdiIcons.chevronRight,
                                        size: 28, color: Colors.black38)
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  EditPasswordPage(),
                                  transition: Transition
                                      .fadeIn, // Atur tipe transisi jika diperlukan
                                  duration: Duration(
                                      milliseconds: 200), // Durasi transisi
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Change Password",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontFamily: "Poppins",
                                              fontSize: 14)),
                                    ),
                                    Icon(MdiIcons.chevronRight,
                                        size: 28, color: Colors.black38)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 35),
                            const Divider(
                              color: Colors.black12,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Stack(
                                          children: [
                                            AlertDialog(
                                              backgroundColor:
                                                  ui.Color.fromARGB(
                                                      220, 255, 255, 255),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.circular(
                                                    8.0), // Set the desired border radius
                                              ),
                                              insetPadding: EdgeInsets.zero,
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 15),
                                              titlePadding:
                                                  EdgeInsets.only(top: 25),
                                              title: const Center(
                                                child: Text(
                                                  'Confirm Dialog',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Apakah anda ingin Log-out?',
                                                      style:
                                                          firstStyle.copyWith(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                40) /
                                                            2,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2,
                                                                horizontal: 1),
                                                        decoration: const BoxDecoration(
                                                            border: Border(
                                                                top: BorderSide(
                                                                    color: Colors
                                                                        .black12),
                                                                right: BorderSide(
                                                                    color: Colors
                                                                        .black12))),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: Text(
                                                                'No',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                40) /
                                                            2,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2,
                                                                horizontal: 1),
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border(
                                                          top: BorderSide(
                                                              color: Colors
                                                                  .black12),
                                                        )),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () async =>
                                                                await PRO(
                                                                        context)
                                                                    .clearAllData(
                                                                        context,
                                                                        true),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                        16),
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
                                            _controllerPage.loadingWidget ==
                                                    true
                                                ? const LoadingWidget()
                                                : Container(),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Log Out",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontFamily: "Poppins",
                                              fontSize: 14)),
                                    ),
                                    Icon(MdiIcons.logout,
                                        size: 25, color: Colors.red)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  // Function to show the enlarged profile photo with a blurred background
  void _showEnlargedProfilePhoto(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          true, // Allows dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Stack(
            children: [
              // Blurred background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black
                      .withOpacity(0.2), // Semi-transparent black background
                ),
              ),
              // Centered enlarged profile photo
              Center(
                child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${PRO(context).userData?.profilePhotoUrl}"),
                            fit: BoxFit.cover))),
              ),
            ],
          ),
        );
      },
    );
  }
}
