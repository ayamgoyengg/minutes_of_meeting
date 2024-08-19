part of '../pages.dart';

class AddDetailMomPage extends StatefulWidget {
  final StmeetingData item;
  final MeetingData meeting;
  const AddDetailMomPage(
      {super.key, required this.item, required this.meeting});

  @override
  State<AddDetailMomPage> createState() => _AddDetailMomPageState();
}

class _AddDetailMomPageState extends State<AddDetailMomPage> {
  late QuillEditorController controller;
  final _controllerPage = Get.put(AnualController());

  bool checkIfClientApproved(String? clientSign) {
    return clientSign == "Approve";
  }

  bool checkIfPmApproved(String? pmSign) {
    return pmSign == "Approve";
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

  String formatDate(String? date) {
    if (date == null) return 'Unknown Date';
    try {
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);
      return DateFormat('dd MMMM yyyy').format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  Widget itemMeeting(BuildContext context) {
    return GetBuilder<AnualController>(builder: (_) {
      if (_controllerPage.meetingData.isEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(child: Text('Belum ada catatan meeting')),
        );
      } else {
        // Only get the first element
        var firstMeeting = _controllerPage.meetingData.first;
        return itemMeetingName(firstMeeting, context);
      }
    });
  }

  Widget itemStatus(BuildContext context) {
    return GetBuilder<AnualController>(builder: (_) {
      if (_controllerPage.meetingData.isEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(child: Text('Belum ada catatan meeting')),
        );
      } else {
        // Only get the first element
        var firstMeeting = _controllerPage.meetingData.first;
        return itemMeetingStatus(firstMeeting, context);
      }
    });
  }

  Widget itemMeetingStatus(MeetingData meeting, BuildContext context) {
    bool isClientApproved = checkIfClientApproved(widget.meeting.clientSign);
    String clientStatus = isClientApproved ? "Approved" : "Pending";
    TextStyle clientStyle = TextStyle(
      fontFamily: "Poppins",
      color: blackColor,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    );
    bool isPmApproved = checkIfPmApproved(widget.meeting.pmSign);
    String pmStatus = isPmApproved ? "Approved" : "Pending";
    TextStyle pmStyle = TextStyle(
      fontFamily: "Poppins",
      color: blackColor,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
    );

    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "Client PIC",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: isClientApproved ? buttonColor : notApprovedButton,
                      border: null,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(child: Text(clientStatus, style: clientStyle)),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "Project Manager",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: isPmApproved ? buttonColor : notApprovedButton,
                      border: null,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(child: Text(pmStatus, style: pmStyle)),
                )
              ],
            ),
          ],
        ));
  }

  Widget itemMeetingName(MeetingData meeting, BuildContext context) {
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
      padding: EdgeInsets.symmetric(vertical: 40),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Meeting ${widget.item.name}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: mainColor,
                          ),
                        ),
                        SizedBox(width: 3),
                        Text('Meeting ke - ${widget.meeting.title},',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: mainColor,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            )),
                        SizedBox(width: 5),
                        Text(
                          formatDate(widget.meeting.date!),
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
              ),
            ),
            SizedBox(width: 20), // Adjust as needed
            Expanded(
              flex: 1, // Adjust flex values as needed
              child: Center(
                child: MyWidget(
                  ownerPhotoUrl: meeting.owner?.profilePhotoUrl,
                  forwardPhotoUrl: meeting.forward?.profilePhotoUrl,
                ), // Replace with your actual widget
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///[customToolBarList] pass the custom toolbarList to show only selected styles in the editor

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.background,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.clean,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
  ];

  final _toolbarColor = forthColor;
  final _toolbarIconColor = Colors.black87;
  final _editorTextStyle = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Roboto');
  final _hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);

  @override
  void initState() {
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });

    super.initState();
  }

  @override
  void dispose() {
    /// please do not forget to dispose the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Add Detail MoM Page",
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GetBuilder<AnualController>(
                        initState: (state) async {
                          await _controllerPage.initPage(context);
                        },
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: _controllerPage.meetingData.isEmpty
                                ? Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: const Center(
                                        child:
                                            Text('Belum ada catatan meeting')),
                                  )
                                : itemMeeting(context),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: forthColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Conclusion",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    ToolBar(
                                      toolBarColor: _toolbarColor,
                                      padding: const EdgeInsets.all(8),
                                      iconSize: 15,
                                      iconColor: _toolbarIconColor,
                                      activeIconColor:
                                          Colors.greenAccent.shade400,
                                      controller: controller,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: IgnorePointer(
                                          ignoring: true, // This makes the editor completely non-interactive
                                          child: QuillHtmlEditor(
                                            text: "${widget.meeting.notes}",
                                            controller: controller,
                                            minHeight: 300,
                                            textStyle: _editorTextStyle,
                                            hintTextStyle: _hintTextStyle,
                                            hintTextAlign: TextAlign.start,
                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                            hintTextPadding: const EdgeInsets.only(left: 20),
                                            backgroundColor: backgroundColor,
                                            onFocusChanged: (focus) {
                                              debugPrint('has focus $focus');
                                              setState(() {});
                                            },
                                            onTextChanged: (text) => debugPrint('widget text change $text'),
                                            onEditorCreated: () {
                                              debugPrint('Editor has been loaded');
                                              setHtmlText("${widget.meeting.notes}");
                                            },
                                            onEditorResized: (height) => debugPrint('Editor resized $height'),
                                            onSelectionChanged: (sel) => debugPrint('index ${sel.index}, range ${sel.length}'),
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          )),
                      GetBuilder<AnualController>(
                        initState: (state) async {
                          await _controllerPage.initPage(context);
                        },
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: _controllerPage.meetingData.isEmpty
                                ? Container(
                                    padding: EdgeInsets.symmetric(vertical: 0),
                                    child: const Center(
                                        child:
                                            Text('Belum ada catatan meeting')),
                                  )
                                : itemStatus(context),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///[getHtmlText] to get the html text from editor
  void getHtmlText() async {
    String? htmlText = await controller.getText();
    debugPrint(htmlText);
  }

  ///[setHtmlText] to set the html text to editor
  void setHtmlText(String text) async {
    await controller.setText(text);
  }

  ///[insertNetworkImage] to set the html text to editor
  void insertNetworkImage(String url) async {
    await controller.embedImage(url);
  }

  ///[insertVideoURL] to set the video url to editor
  ///this method recognises the inserted url and sanitize to make it embeddable url
  ///eg: converts youtube video to embed video, same for vimeo
  void insertVideoURL(String url) async {
    await controller.embedVideo(url);
  }

  /// to set the html text to editor
  /// if index is not set, it will be inserted at the cursor postion
  void insertHtmlText(String text, {int? index}) async {
    await controller.insertText(text, index: index);
  }

  /// to clear the editor
  void clearEditor() => controller.clear();

  /// to enable/disable the editor
  void enableEditor(bool enable) => controller.enableEditor(enable);

  /// method to un focus editor
  void unFocusEditor() => controller.unFocus();
}
