part of '../pages.dart';

class CreateMom1Page extends StatelessWidget {
  CreateMom1Page({super.key});

  final _controllerPage = Get.put(OptionStmeetingController());

  Widget formData(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [
              const SizedBox(height: 20),
              CustomTextField3(
                  placeHolder: 'Masukkan nama perusahaan',
                  labelFrom: '',
                  controllerField: _controllerPage.controllerName)
            ])));
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
                        Navigator.of(context).pop();
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
          body: GetBuilder<OptionStmeetingController>(
              initState: (state) async =>
                  await _controllerPage.initPage(context),
              builder: (_) {
                return Stack(children: [
                  Column(
                    children: <Widget>[
                      formData(context),
                      Container(
                        margin: EdgeInsets.only(top: 60, bottom: 5),
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFF8F56)),
                              onPressed: () async =>
                                  await _controllerPage.submit(context),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor),
                              )),
                        ),
                      )
                    ],
                  ),
                  _controllerPage.loadingWidget == true
                      ? const LoadingWidget()
                      : Container(),
                ]);
              })),
    );
  }
}
