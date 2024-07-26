part of '../pages.dart';

class CreateMomPage extends StatefulWidget {
  const CreateMomPage({super.key});

  @override
  State<CreateMomPage> createState() => _CreateMomPageState();
}

class _CreateMomPageState extends State<CreateMomPage> {
  bool _showDatePicker = false;
  DateTime? _selectedDate;
  late QuillEditorController controller;

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
      title: "Create MoM Page",
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
                      Navigator.of(context).pop();
                    },
                    child: Icon(MdiIcons.chevronLeft,
                        size: 28, color: Colors.black38)),
                Row(
                  children: [
                    Icon(MdiIcons.fileDocumentPlus,
                        size: 25, color: blackColor),
                    const SizedBox(width: 10),
                    const Text(
                      "Create Meeting",
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Pilih Meeting',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(left: 25, right: 25),
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'meeting1',
                                      child: Text('Meeting 1'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'meeting2',
                                      child: Text('Meeting 2'),
                                    ),
                                    // Add more DropdownMenuItem as needed
                                  ],
                                  onChanged: (String? value) {
                                    // Handle dropdown value change here
                                    print('Selected value: $value');
                                  },
                                  icon: Icon(MdiIcons.chevronDown,
                                      size: 20,
                                      color: blackColor), // Dropdown icon
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: forthColor, // Replace with your desired color
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 25, right: 25),
                                    ),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showDatePicker =
                                          !_showDatePicker; // Toggle date picker visibility
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _selectedDate != null
                                              ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                              : 'Select meeting date',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "Poppins",
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Icon(
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
                      if (_showDatePicker)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color:
                                forthColor, // Replace with your desired color
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              color: mainColor,
                              child: SfDateRangePicker(
                                onSelectionChanged:
                                    (DateRangePickerSelectionChangedArgs args) {
                                  setState(() {
                                    _selectedDate = args.value;
                                    _showDatePicker =
                                        false; // Hide date picker after selection
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                                child: Row(
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
                                      child: QuillHtmlEditor(
                                        hintText: 'Masukan catatan',
                                        controller: controller,
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
                                        onTextChanged: (text) => debugPrint(
                                            'widget text change $text'),
                                        onEditorCreated: () {
                                          debugPrint('Editor has been loaded');
                                          setHtmlText('');
                                        },
                                        onEditorResized: (height) => debugPrint(
                                            'Editor resized $height'),
                                        onSelectionChanged: (sel) => debugPrint(
                                            'index ${sel.index}, range ${sel.length}'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Container(
                        child: Container(
                          margin: EdgeInsets.only(top: 60),
                          child: SizedBox(
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFF8F56)),
                                onPressed: () {
                                  Get.to(MainPage());
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor),
                                )),
                          ),
                        ),
                      )
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
