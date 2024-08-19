part of '../pages.dart';

class EditMomPage extends StatefulWidget {
  const EditMomPage({super.key});

  @override
  State<EditMomPage> createState() => _EditMomPageState();
}

class _EditMomPageState extends State<EditMomPage> {
  final _controllerPage = Get.put(OptionEditMomController());
  List<DropdownMenuItem<String>> dropdownItems = [];

  @override
  void initState() {
    super.initState();
    _populateDropdownItems();
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });
  }

  void _populateDropdownItems() {
    // ignore: unnecessary_null_comparison
    dropdownItems = _controllerPage.meetingData == null
        ? []
        : _controllerPage.meetingData.map((item) {
            return DropdownMenuItem<String>(
              value: item.title,
              child: Text("Meeting ke-${item.title!} ${item.stmeeting?.name}"),
            );
          }).toList();
  }

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
  void dispose() {
    /// please do not forget to dispose the controller
    controller.dispose();
    super.dispose();
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Pilih Meeting',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                  ),
                                  items: dropdownItems,
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric( vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 20, right: 20),
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
                      if (_showDatePicker)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color:
                                forthColor, // Replace with your desired color
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                      onEditorResized: (height) =>
                                          debugPrint('Editor resized $height'),
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
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          child: SizedBox(
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFF8F56)),
                                onPressed: () {
                                  Get.to(MainPage());
                                },
                                child: Text(
                                  "Save",
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
