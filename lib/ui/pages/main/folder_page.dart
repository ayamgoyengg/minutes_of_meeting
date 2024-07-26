part of '../pages.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Folder Page",
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
                      Icon(MdiIcons.folder, color: blackColor, size: 25),
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
          child: ListView(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(DetailMomPage());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Meeting 1",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: thirdColor,
                                        border: null,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Upcoming,",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: thirdColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Juli 1, 2024",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Center(child: MyWidget())),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Get.to(EditMomPage());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.pencil,
                                color: blackColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    insetPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 44),
                                    content: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Undangan telah tersalin',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            child: Text(
                                              'Tutup',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.share,
                                color: blackColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 2",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 3",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 4",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 5",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 6",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 7",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 8",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 9",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 10",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 11",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 12",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 12",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 12",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting 12",
                              style: TextStyle(
                                  fontSize: 13,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Completed,",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: mainColor,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Juli 1, 2024",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Center(child: MyWidget())),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.pencil,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.share,
                              color: blackColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ]),
        ),
      ),
    );
  }
}
