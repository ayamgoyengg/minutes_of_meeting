part of '../pages.dart';

class EditProfilePage extends StatefulWidget {
  final UserData user;
  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _controllerPage = Get.put(AuthEPController());

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with initial values
    _controllerPage.controllerName.text = "${PRO(context).userData?.name}";
    _controllerPage.controllerEmail.text = "${PRO(context).userData?.email}";

    // Print initial values for verification
    print("Name Initial Value: ${_controllerPage.controllerName.text}");
    print("Email Initial Value: ${_controllerPage.controllerEmail.text}");
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
        body: SingleChildScrollView(
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
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${PRO(context).userData?.profilePhotoUrl}"),
                                                fit: BoxFit.cover))),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: widgetColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(
                                          MdiIcons.plus,
                                          size: 20,
                                          color: Colors.black38,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: widgetColor,
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 230,
                                            child: TextField(
                                              controller: _controllerPage
                                                  .controllerName,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10, right: 10)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: widgetColor,
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 230,
                                            child: TextField(
                                              controller: _controllerPage
                                                  .controllerEmail,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 10, right: 10)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                        onPressed: () async {
                          await _controllerPage.edit(context, widget.user);
                        },
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
        ),
      ),
    );
  }
}
