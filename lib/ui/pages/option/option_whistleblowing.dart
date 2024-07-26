part of '../pages.dart';

class OptionWhistleblowing extends StatelessWidget {
  OptionWhistleblowing({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionWhistleblowingController());

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              // onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => const AuthOption()),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 14,
                ),
              )),
          const SizedBox(width: 10),
          Text(
            titlePage,
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createUpdateAgendaWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              PRO(context).selectedCategory == "English" 
                ? "User ID" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "用户ID"
                    : "ID User"),
               style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(placeHolder: 
            PRO(context).selectedCategory == "English" 
                ? "Your User ID" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "您的用户ID"
                    : "ID User Anda"),
             labelFrom: '', readOnly: _controllerPage.conditionGetAPI == true ? true : false, controllerField: _controllerPage.controllerUserID),
            const SizedBox(height: 5),
            Text(
              PRO(context).selectedCategory == "English" 
                ? "Name" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "姓名"
                    : "Nama"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(placeHolder:
            PRO(context).selectedCategory == "English" 
                ? "Your Name" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "您的姓名"
                    : "Nama Anda"),
            labelFrom: '', readOnly: _controllerPage.conditionGetAPI == true ? true : false, controllerField: _controllerPage.controllerName),
            const SizedBox(height: 5),
            Text(
              PRO(context).selectedCategory == "English" 
                ? "Complaint" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "您的姓名"
                    : "Pengaduan"),
               style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 10),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
              ),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                maxLines: null, // Allows for an unlimited number of lines
                keyboardType: TextInputType.multiline,
                controller: _controllerPage.controllerComment,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 
                  PRO(context).selectedCategory == "English" 
                ? 'Enter your complaint'
                : (PRO(context).selectedCategory == "Chinese"
                    ? "添加您的投诉"
                    : 'Masukkan pengaduan anda'),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.transparent, width: 0),
                  ),
                ),
              ),
            ),
            // CustomTextField3(placeHolder: 'Masukkan pengaduan anda', labelFrom: '', controllerField: _controllerPage.controllerComment),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async => await _controllerPage.submitWhistleblowing(context),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                  ),
                  child: Text(
                    PRO(context).selectedCategory == "English" 
                    ? "Send" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "发送"
                        : "Kirim"),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
            ),
          ],
        ),
      ),
    );
  }

  Widget yourAgendaWidget(BuildContext context) {
    return Expanded(
      child: GetBuilder<OptionWhistleblowingController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    PRO(context).selectedCategory == "English" 
                                  ? "Your complaint" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "您的举报"
                                      : "Pengaduan anda"),
                     style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const Divider(),
                  Expanded(
                    child: ScrollbarTheme(
                      data: ScrollbarThemeData(
                        thumbColor: MaterialStateProperty.all<Color>(mainColor),
                        trackColor: MaterialStateProperty.all<Color>(Colors.white),
                        trackBorderColor: MaterialStateProperty.all<Color>(mainColor),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        showTrackOnHover: true,
                        thickness: 8,
                        radius: Radius.circular(10),
                        child: ListView.builder(
                          controller: _controllerPage.controllerDataWhistleblowing,
                          itemCount: _controllerPage.dataWhistleblowing.length,
                          itemBuilder: (context, index) {
                            return itemNote(context, _controllerPage.dataWhistleblowing[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemNote(BuildContext context, WhistleblowingData data) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: "#f0f0f0".toColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('W-${data.createdAt}', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
                            const Divider(),
                            Text(data.comment ?? '-', style: Theme.of(context).textTheme.bodySmall),
                            const Divider(),
                            Row(children: [
                              Icon(MdiIcons.accountCircle, color: mainColor),
                              SizedBox(width: 2),
                              Text("Admin", style: blackFontStyle3.copyWith(fontWeight: FontWeight.w700, fontSize: 12)),
                            ]),
                            const SizedBox(height: 5),                           
                            Text(
                              data.answer ??
                              (PRO(context).selectedCategory == "English"
                                  ? "Sorry admin hasn't responded yet"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "对不起，还没有反馈"
                                      : 'Maaf admin belum merespons')),
                              style: TextStyle(
                                color: data.answer != null ? Colors.black : Colors.red,
                                fontStyle: data.answer != null ? FontStyle.normal : FontStyle.italic,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Whistleblowing" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "举报"
          : "Whistleblowing"),
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: mainColor,
            title: Text(
              PRO(context).selectedCategory == "English" 
              ? "Whistleblowing" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "举报"
                  : "Whistleblowing"),
                ),
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          ),
          body: GetBuilder<OptionWhistleblowingController>(
            initState: (state) async => await _controllerPage.initPage(context),
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      createUpdateAgendaWidget(context),
                      const SizedBox(height: 10),
                      yourAgendaWidget(context),
                      const SizedBox(height: 10),
                    ],
                  ),
                   _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
