part of '../pages.dart';

class EditPhotoPage extends StatefulWidget {
  final UserData user;
  const EditPhotoPage({super.key, required this.user});

  @override
  State<EditPhotoPage> createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
  final _controllerPage = Get.put(AuthEditPhotoController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Setting Page",
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: mainColor,
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
                    Icon(Icons.people, size: 25, color: blackColor),
                    const SizedBox(width: 10),
                    const Text(
                      "Profile Setting",
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
        body: GetBuilder<AuthEditPhotoController>(
          initState:(state)async{
            await _controllerPage.initPage(context);
          },
          builder: (_){
            return SingleChildScrollView(
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 450,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              color: widgetColor,
                              border: null,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await _controllerPage.handlePickImageUser(context);
                                        },
                                        child: Center(
                                          child: (_controllerPage.pickImageUser != null)
                                              ? Container(
                                                  width: 200,
                                                  height: 200,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/photo_border.png'))),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: FileImage(
                                                                  _controllerPage
                                                                      .pickImageUser!),
                                                              fit: BoxFit.cover))),
                                                )
                                              : Container(
                                                  width: 200,
                                                  height: 200,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/photo_border.png'))),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  "${PRO(context).userData?.profilePhotoUrl}"),
                                                              fit: BoxFit.cover))),
                                                ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Container(
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF8F56)),
                            onPressed: () async => await _controllerPage.submitPhoto(context),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: blackColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            );
          }
        )
      ),
    );
  }
}
