part of '../pages.dart';

class EditMomPage extends StatefulWidget {
  final MeetingData item;

  const EditMomPage({super.key, required this.item});

  @override
  State<EditMomPage> createState() => _EditMomPageState();
}

class _EditMomPageState extends State<EditMomPage> {
  final _controllerPage = Get.put(OptionEditMomController());
  List<DropdownMenuItem<String>> dropdownItems = [];
  String? _selectedDropdownValue;
  bool _showDatePicker = false;
  DateTime? _selectedDate;
  late QuillEditorController controller;

  @override
  void initState() {
    super.initState();
    _controllerPage.controllerNotes.onTextChanged((text) {
      debugPrint('listening to $text');
    });
    _controllerPage.initPage(context).then((_) {
      _initializeEditor();
      _initializeSelectedDate();
      _populateDropdownItems();
      _selectedDropdownValue = widget.item.idMt;
      setState(() {});
    });

    // Initialize QuillEditorController
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setHtmlText(widget.item.notes.toString());
    });
  }

  void _initializeSelectedDate() {
    try {
      _selectedDate = DateTime.parse(widget.item.date.toString());
    } catch (e) {
      debugPrint('Error parsing date: $e');
      _selectedDate = null;
    }
  }

  void _initializeEditor() {
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('Text changed: $text');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setHtmlText(widget.item.notes.toString());
    });
  }

  void _populateDropdownItems() {
    dropdownItems = _controllerPage.meetingData.isEmpty
        ? []
        : _controllerPage.meetingData.map((item) {
            return DropdownMenuItem<String>(
              value: item.idMt,
              child: Text("Meeting ke-${item.title} ${item.stmeeting?.name}"),
            );
          }).toList();
  }

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
  void dispose() {
    controller.dispose();
    _controllerPage.controllerNotes.dispose();
    super.dispose();
  }

  Widget editData(BuildContext context) {
    return Expanded(
        child: SizedBox(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: forthColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GetBuilder<
                                        OptionEditMomController>(
                                      builder: (controller) {
                                        return DropdownButtonFormField<String>(
                                          value: _selectedDropdownValue,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Pilih Meeting',
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "Poppins",
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                left: 20, right: 20),
                                          ),
                                          items: dropdownItems,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _selectedDropdownValue = value;
                                            });
                                            print(value);
                                          },
                                          icon: Icon(MdiIcons.chevronDown,
                                              size: 20, color: blackColor),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: forthColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.only(left: 20, right: 20),
                                        ),
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showDatePicker = !_showDatePicker;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _selectedDate != null
                                                  ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                                  : 'Pilih tanggal meeting',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontFamily: "Poppins",
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (_showDatePicker)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: forthColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                color: mainColor,
                                child: SfDateRangePicker(
                                  initialSelectedDate: _selectedDate,
                                  onSelectionChanged:
                                      (DateRangePickerSelectionChangedArgs args) {
                                    setState(() {
                                      _selectedDate = args.value;
                                      _showDatePicker = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
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
                                      Text("Notes",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height / 1.5,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
                                      ToolBar(
                                        toolBarColor: _toolbarColor,
                                        padding: const EdgeInsets.all(8),
                                        iconSize: 15,
                                        iconColor: _toolbarIconColor,
                                        activeIconColor:
                                            Colors.greenAccent.shade400,
                                        controller: _controllerPage.controllerNotes,
                                        crossAxisAlignment: WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: QuillHtmlEditor(
                                            text: "${widget.item.notes}",
                                            controller: _controllerPage.controllerNotes,
                                            isEnabled: true,
                                            minHeight: 300,
                                            textStyle: _editorTextStyle,
                                            hintTextStyle: _hintTextStyle,
                                            hintTextAlign: TextAlign.start,
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            hintTextPadding:
                                                const EdgeInsets.only(left: 20),
                                            backgroundColor: backgroundColor,
                                            onFocusChanged: (focus) {
                                              debugPrint('has focus $focus');
                                              setState(() {});
                                            },
                                            onTextChanged: (text) =>
                                                debugPrint('widget text change $text'),
                                            onEditorCreated: () {
                                              debugPrint('Editor has been loaded');
                                              setHtmlText("${widget.item.notes}");
                                            },
                                            onEditorResized: (height) =>
                                                debugPrint('Editor resized $height'),
                                            onSelectionChanged: (sel) =>
                                                debugPrint('index ${sel.index}, range ${sel.length}'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Container(
                            child: SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFF8F56)),
                                onPressed: () async {
                                  await _controllerPage.edit(context, widget.item);
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Edit MoM Page",
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
                      "Edit Meeting",
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
        body: GetBuilder<OptionEditMomController>(
          initState: (state) async => await _controllerPage.initPage(context),
          builder:(_){
            return Stack(
              children:[
                Column(
                  children: <Widget>[
                    const SizedBox(height:10),
                    editData(context)
                  ]
                )
              ]
            );
          }
        )
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

editData() {
}
