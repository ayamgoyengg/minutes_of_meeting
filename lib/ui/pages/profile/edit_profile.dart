part of '../pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with initial values
    nameController.text = "Jamie";
    emailController.text = "jamie@gmail.com";

    // Print initial values for verification
    print("Name Initial Value: ${nameController.text}");
    print("Email Initial Value: ${emailController.text}");
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://get.pxhere.com/photo/person-suit-profile-male-portrait-young-professional-profession-hairstyle-social-media-elegant-cv-businessperson-white-collar-worker-459413.jpg"),
                                                fit: BoxFit.cover))),
                                    //                 GestureDetector(
                                    //                 onTap: () async {
                                    //                   await _controllerPage.handleImagePickerUser();
                                    //                 },
                                    //                 child: Center(
                                    //                   child: (_controllerPage.imageUser != null)
                                    //                       ? Container(
                                    //                           width: 110,
                                    //                           height: 110,
                                    //                           margin: const EdgeInsets.only(top: 26),
                                    //                           padding: const EdgeInsets.all(5),
                                    //                           decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/photo_border.png'))),
                                    //                           child: Container(decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: FileImage(_controllerPage.imageUser!), fit: BoxFit.cover))),
                                    //                         )
                                    //                       : Container(
                                    //                           width: 110,
                                    //                           height: 110,
                                    //                           margin: const EdgeInsets.only(top: 26),
                                    //                           padding: const EdgeInsets.all(5),
                                    //                           decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/photo_border.png'))),
                                    //                           child: Container(decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/photo.png'), fit: BoxFit.cover))),
                                    //                         ),
                                    //                 ),
                                    //               ),
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
                                              controller: nameController,
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
                                              controller: emailController,
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
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF8F56)),
                          onPressed: () {
                            Get.to(ProfilePage());
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: blackColor),
                          )),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

