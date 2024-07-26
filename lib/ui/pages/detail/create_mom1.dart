part of '../pages.dart';

class CreateMom1Page extends StatefulWidget {
  const CreateMom1Page({super.key});

  @override
  State<CreateMom1Page> createState() => _CreateMom1PageState();
}

class _CreateMom1PageState extends State<CreateMom1Page> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: forthColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Masukan nama meeting',
                                hintStyle: TextStyle(
                                    fontSize: 13, fontFamily: "Poppins"),
                                contentPadding:
                                    EdgeInsets.only(left: 25, right: 25)),
                          )),
                      Icon(MdiIcons.pencil, size: 20, color: blackColor),
                    ],
                  ),
                ),
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
                          Get.to(const CreateMomPage());
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: blackColor),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
