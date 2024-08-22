part of '../pages.dart';

class CreateMomPage extends StatefulWidget {
  CreateMomPage({super.key});

  @override
  _CreateMomPageState createState() => _CreateMomPageState();
}

class _CreateMomPageState extends State<CreateMomPage> {
  final _controllerPage = Get.put(OptionCreateMeetingController());

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
    super.initState();
    _controllerPage.controllerNotes.onTextChanged((text) {
      debugPrint('listening to $text');
    });
  }

  @override
  void dispose() {
    _controllerPage.controllerNotes.dispose();
    super.dispose();
  }

  Widget modalSelectDate(BuildContext context) {
    return GetBuilder<OptionCreateMeetingController>(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 3, blurRadius: 15, color: Colors.black12)
                  ],
                ),
                child: SfDateRangePicker(
                  controller: _controllerPage.controllerDatePicker,
                  onSelectionChanged: _controllerPage.onSelectionChanged,
                  headerStyle: DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: Theme.of(context).textTheme.titleLarge),
                  headerHeight: 80,
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget formData(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            CustomTextField3(
              placeHolder: 'Masukkan id penerbit',
              labelFrom: '',
              controllerField: _controllerPage.controllerOwnerID,
              readOnly: true,
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 3,
                      color: Color.fromARGB(31, 180, 180, 180))
                ],
              ),
              child: DropdownButton<StmeetingData>(
                value: _controllerPage.selectedStmeeting,
                isExpanded: true,
                hint: Text('Pilih Meeting'),
                underline: const SizedBox(),
                items: _controllerPage.stmeetingsData.map((e) {
                  String displayText = e.name ?? '';
                  if (e.meetings != null && e.meetings!.isNotEmpty) {
                    String lastMeetingTitle = e.meetings!.last.title ?? '';
                    displayText = '$displayText - $lastMeetingTitle';
                  }
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      displayText,
                      style: blackFontStyle3,
                    ),
                  );
                }).toList(),
                onChanged: (item) {
                  _controllerPage.handleSelectedStmeeting(item!);
                },
              ),
            ),
            const SizedBox(height: 15),
            CustomTextField3(
              placeHolder: 'Meeting ke -',
              labelFrom: '',
              controllerField: _controllerPage.controllerTitle,
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 3,
                      color: Color.fromARGB(31, 180, 180, 180))
                ],
              ),
              child: DropdownButton<UserData>(
                value: _controllerPage.selectedForward,
                isExpanded: true,
                hint: Text('CC Meeting'),
                underline: const SizedBox(),
                items: _controllerPage.forwardsData
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name ?? '',
                          style: blackFontStyle3,
                        )))
                    .toList(),
                onChanged: (item) {
                  _controllerPage.handleSelectedForward(item!);
                },
              ),
            ),
            const SizedBox(height: 15),
            CustomDateField(
              placeHolder: 'DD/MM/YY',
              labelFrom: '',
              readOnly: true,
              customFunction2: _controllerPage.handleShowModal,
              controllerField: _controllerPage.controllerTanggal,
              suffixIcon: const Icon(Icons.calendar_month),
            ),
            const SizedBox(height: 15),
            CustomTextField3(
              placeHolder: 'Password',
              labelFrom: '',
              controllerField: _controllerPage.controllerPassword,
            ),
            const SizedBox(height: 15),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: forthColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          ToolBar(
                            toolBarColor: _toolbarColor,
                            padding: const EdgeInsets.all(8),
                            iconSize: 15,
                            iconColor: _toolbarIconColor,
                            activeIconColor: Colors.greenAccent.shade400,
                            controller: _controllerPage.controllerNotes,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                          ),
                          Expanded(
                            child: QuillHtmlEditor(
                              hintText: 'Masukan catatan',
                              controller: _controllerPage.controllerNotes,
                              isEnabled: true,
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
                              onTextChanged: (text) =>
                                  debugPrint('widget text change $text'),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Create MoM Page",
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
                      Navigator.of(context).pop();
                      Get.back();
                    },
                    child: Icon(MdiIcons.chevronLeft,
                        size: 28, color: Colors.black38),
                  ),
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
                      ),
                    ],
                  ),
                  const SizedBox(width: 28),
                ],
              ),
            ),
          ),
          body: GetBuilder<OptionCreateMeetingController>(
            initState: (state) async => await _controllerPage.initPage(context),
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      formData(context),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async =>
                                await _controllerPage.submit(context),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  const Size(100, 40)),
                              backgroundColor:
                                  MaterialStateProperty.all(mainColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                            ),
                            child: Text(
                                PRO(context).selectedCategory == "English"
                                    ? "Send"
                                    : (PRO(context).selectedCategory ==
                                            "Chinese"
                                        ? "发送"
                                        : "Kirim"),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900))),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  _controllerPage.showModal == true
                      ? modalSelectDate(context)
                      : Container(),
                  _controllerPage.loadingWidget == true
                      ? const LoadingWidget()
                      : Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void getHtmlText() async {
    String? htmlText = await _controllerPage.controllerNotes.getText();
    debugPrint(htmlText);
  }

  void setHtmlText(String text) async {
    await _controllerPage.controllerNotes.setText(text);
  }

  void insertNetworkImage(String url) async {
    await _controllerPage.controllerNotes.embedImage(url);
  }

  void insertVideoURL(String url) async {
    await _controllerPage.controllerNotes.embedVideo(url);
  }

  void insertHtmlText(String text, {int? index}) async {
    await _controllerPage.controllerNotes.insertText(text, index: index);
  }

  void clearEditor() => _controllerPage.controllerNotes.clear();

  void enableEditor(bool enable) =>
      _controllerPage.controllerNotes.enableEditor(enable);

  void unFocusEditor() => _controllerPage.controllerNotes.unFocus();
}
