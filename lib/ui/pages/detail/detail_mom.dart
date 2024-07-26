part of '../pages.dart';

class DetailMomPage extends StatefulWidget {
  const DetailMomPage({super.key});

  @override
  State<DetailMomPage> createState() => _DetailMomPageState();
}

class _DetailMomPageState extends State<DetailMomPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Detail MoM Page",
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: backgroundColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(MdiIcons.chevronLeft,
                        size: 28, color: Colors.black38)),
                Row(
                  children: [
                    Icon(MdiIcons.fileDocumentPlus,
                        size: 25, color: blackColor),
                    const SizedBox(width: 10),
                    const Text(
                      "Detail Meeting",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 28)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: forthColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2, // Adjust flex values as needed
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Meeting 1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "Juli 1, 2024",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20), // Adjust as needed
                        Expanded(
                          flex: 1, // Adjust flex values as needed
                          child: Center(
                            child:
                                MyWidget(), // Replace with your actual widget
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: 40,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: mainColor)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: mainColor)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Text('|',
                                    style: firstStyle.copyWith(
                                        height: .9, color: Colors.black)),
                                Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: mainColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: forthColor)),
                              ])),
                      Container(
                          width: MediaQuery.of(context).size.width - 40 - 40,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(AddDetailMomPage());
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "#01 Meeting",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins"),
                                        ),
                                        Row(
                                          children: [
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
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "#02 Meeting",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins"),
                                      ),
                                      Row(
                                        children: [
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
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10, top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "#03 Meeting",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Poppins"),
                                      ),
                                      Row(
                                        children: [
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
                              ])),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
