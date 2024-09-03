part of '../pages.dart';

class EditPasswordPage extends StatefulWidget {
  EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final _controllerPage = Get.put(AuthEditPasswordController());
  

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
                                  width: double
                                      .infinity, // This ensures the container takes full width
                                  decoration: BoxDecoration(
                                    color: widgetColor,
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Center(
                                    // This centers the TextField horizontally
                                    child: SizedBox(
                                      width: 290,
                                      child: TextField(
                                        textAlignVertical: TextAlignVertical
                                            .center, // This centers the hint text vertically
                                        obscureText:
                                            _controllerPage.obsecureText1,
                                        controller:
                                            _controllerPage.oldPasswordField,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                _controllerPage.obsecureText1
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                            onPressed: _controllerPage
                                                .toggleObsecureText1,
                                          ),
                                          hintText: 'Current Password',
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  10), // Adjusted padding
                                        ),
                                      ),
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
                                  width: double
                                      .infinity, // This ensures the container takes full width
                                  decoration: BoxDecoration(
                                    color: widgetColor,
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Center(
                                    // This centers the TextField horizontally
                                    child: SizedBox(
                                      width: 290,
                                      child: TextField(
                                        textAlignVertical: TextAlignVertical
                                            .center, // This centers the hint text vertically
                                        obscureText:
                                            _controllerPage.obsecureText2,
                                        controller:
                                            _controllerPage.passwordField,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                _controllerPage.obsecureText2
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                            onPressed: _controllerPage
                                                .toggleObsecureText2,
                                          ),
                                          hintText: 'New Password',
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  10), // Adjusted padding
                                        ),
                                      ),
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
                                  width: double
                                      .infinity, // This ensures the container takes full width
                                  decoration: BoxDecoration(
                                    color: widgetColor,
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                  ),
                                  child: Center(
                                    // This centers the TextField horizontally
                                    child: SizedBox(
                                      width: 290,
                                      child: TextField(
                                        textAlignVertical: TextAlignVertical
                                            .center, // This centers the hint text vertically
                                        obscureText:
                                            _controllerPage.obsecureText3,
                                        controller:
                                            _controllerPage.confirmPasswordField,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                _controllerPage.obsecureText3
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                            onPressed: _controllerPage
                                                .toggleObsecureText3,
                                          ),
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal:
                                                  10), // Adjusted padding
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "*Min 8 character",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          )
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
                          onPressed: () async {
                            await _controllerPage.submit(context);
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
