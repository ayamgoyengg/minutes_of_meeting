part of '../pages.dart';

class DetailMomPage extends StatefulWidget {
  final StmeetingData item;
  final MeetingData meeting;

  const DetailMomPage({super.key, required this.item, required this.meeting});

  @override
  State<DetailMomPage> createState() => _DetailMomPageState();
}

class _DetailMomPageState extends State<DetailMomPage> {
  final _controllerPage = Get.put(AnualController());

  void shareToWhatsApp(String message) async {
    final String url = 'https://wa.me/?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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

  Widget listStMeeting(BuildContext context) {
    return GetBuilder<AnualController>(builder: (_) {
      if (_controllerPage.stmeetingData.isEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(child: Text('Belum ada kategori meeting')),
        );
      } else {
        // Only get the first element
        var firstMeeting = _controllerPage.stmeetingData.first;
        return itemStMeetingName(firstMeeting, context);
      }
    });
  }

  Widget listMeetings(BuildContext context) {
    if (widget.item.meetings == null || widget.item.meetings!.isEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(left: 35),
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Anda tidak memiliki data meeting',
          ),
        ),
      );
    } else {
      return Column(
        children: widget.item.meetings!.map((meeting) {
          return itemMeetingName(meeting, context);
        }).toList(),
      );
    }
  }

  Widget itemStMeetingName(StmeetingData item, BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 30),
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
                      "${widget.item.name}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  bool checkIfCompleted(String? date) {
    if (date == null) return false;
    try {
      DateTime meetingDate = DateFormat('yyyy-MM-dd').parse(date);
      DateTime currentDate = DateTime.now();
      return meetingDate.isBefore(currentDate);
    } catch (e) {
      return false;
    }
  }

  bool checkIfClientApproved(String? clientSign) {
    return clientSign == "Approve";
  }

  bool checkIfPmApproved(String? pmSign) {
    return pmSign == "Approve";
  }

  Widget itemMeetingName(MeetingData meeting, BuildContext context) {
    bool isCompleted =
        checkIfCompleted(meeting.date); // Use checkIfCompleted method
    String statusDate = isCompleted ? "Completed" : "Upcoming";
    TextStyle statusDateStyle = TextStyle(
      fontFamily: "Poppins",
      color: isCompleted ? mainColor : thirdColor,
      fontSize: 8,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    );
    bool isApproved = checkIfClientApproved(meeting.clientSign) &&
        checkIfPmApproved(meeting.pmSign);
    String status = isApproved ? "(Approved)" : "(Not Approved)";
    TextStyle statusStyle = TextStyle(
      fontFamily: "Poppins",
      color: isApproved ? mainColor : thirdColor,
      fontSize: 8,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: GestureDetector(
        onTap: () {
          Get.to(AddDetailMomPage(
            item: widget.item,
            meeting: meeting,
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '0${meeting.title} Meeting',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text("$statusDate", style: statusDateStyle),
                        SizedBox(width: 3),
                        Text("$status,", style: statusStyle),
                      ],
                    ),
                    SizedBox(width: 5),
                    Text(
                      formatDate(meeting.date!),
                      style: const TextStyle(
                        fontSize: 9,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: forthColor,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(MdiIcons.pencil, color: mainColor, size: 13),
                      onPressed: () {
                        Get.to(EditMomPage());
                      },
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: forthColor,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(MdiIcons.share, color: mainColor, size: 13),
                      onPressed: () {
                        shareToWhatsApp(meeting.narasi!);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Detail MoM Page",
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<AnualController>(
                    initState: (state) async {
                      await _controllerPage.initPage(context);
                    },
                    builder: (_) {
                      return Container(
                        child: _controllerPage.meetingData.isEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: const Center(
                                    child: Text('Belum ada kategori meeting')),
                              )
                            : listStMeeting(context),
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: GetBuilder<AnualController>(
                      initState: (state) async {
                        await _controllerPage.initPage(context);
                      },
                      builder: (_) {
                        return _controllerPage.meetingData.isEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: const Center(
                                    child: Text(
                                        'Anda tidak memiliki data meeting')),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      widget.item.meetings == null ||
                                              widget.item.meetings!.isEmpty
                                          ? Container()
                                          : Container(
                                              padding: const EdgeInsets.all(10),
                                              width: 40,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ...List.generate(
                                                      widget.item.meetings!
                                                          .length, (index) {
                                                    return Column(
                                                      children: [
                                                        Container(
                                                          width: 15,
                                                          height: 15,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: index ==
                                                                    widget
                                                                            .item
                                                                            .meetings!
                                                                            .length -
                                                                        1
                                                                ? Colors
                                                                    .transparent
                                                                : mainColor,
                                                            border: Border.all(
                                                              color: index ==
                                                                      widget.item.meetings!
                                                                              .length -
                                                                          1
                                                                  ? mainColor
                                                                  : mainColor,
                                                              width:
                                                                  1, // Adjust width as needed
                                                            ),
                                                          ),
                                                        ),
                                                        if (index !=
                                                            widget
                                                                    .item
                                                                    .meetings!
                                                                    .length -
                                                                1) // Add separators except after the last item
                                                          ...List.generate(5,
                                                              (_) {
                                                            return Text(
                                                              '|',
                                                              style: firstStyle
                                                                  .copyWith(
                                                                      height:
                                                                          .9,
                                                                      color: Colors
                                                                          .black),
                                                            );
                                                          }),
                                                      ],
                                                    );
                                                  }),
                                                ],
                                              ),
                                            ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40 -
                                                40,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: listMeetings(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                      },
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
