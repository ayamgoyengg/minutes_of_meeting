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
      // Set the initial value for the dropdown
      _selectedDropdownValue = widget.item.idMt;
      setState(() {}); // Update the UI to reflect the selected value
    });


    // Initialize QuillEditorController
    controller = QuillEditorController();
    controller.onTextChanged((text) {
      debugPrint('listening to $text');
    });

    // Set the initial notes value
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setHtmlText(widget.item.notes.toString());
    });

    // Initialize the selected date
  }

  void _initializeSelectedDate() {
    try {
      // Parse the date string using DateTime.parse
      _selectedDate = DateTime.parse(widget.item.date.toString());
    } catch (e) {
      debugPrint('Error parsing date: $e');
      // Handle the error or set _selectedDate to null
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
     _controllerPage.controllerNotes.dispose();
    super.dispose();
  }

  Widget editData(BuildContext context){
    
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
            )
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
