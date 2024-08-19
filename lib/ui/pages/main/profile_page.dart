part of '../pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Icon(Icons.settings, color: blackColor, size: 25),
                    ],
                  ),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                const SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('${PRO(context).userData?.name}',
                                              style: firstStyle.copyWith(
                                                  fontSize: 13,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.bold)),
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                              Get.to(EditProfilePage());
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
                              Get.to(EditPasswordPage());
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
                            onTap: () async =>
                                await PRO(context).clearAllData(context, true),
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
    );
  }
}
