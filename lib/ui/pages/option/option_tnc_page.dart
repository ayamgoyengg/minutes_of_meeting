part of "../pages.dart";

class ProfileSyaratKetentuan extends StatelessWidget {
  ProfileSyaratKetentuan({super.key});
  final _controllerPage = Get.put(OptionTncController());

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 80,
      child: Row(
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
          const SizedBox(width: 20),
          Text(
            titlePage,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget listItem1(BuildContext context) {
    return GetBuilder<OptionTncController>(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: _controllerPage.tncData == null
                    ? []
                    : _controllerPage.tncData!.isEmpty
                        ? []
                        : _controllerPage.tncData!.map((element1) {
                            return HTML_VIEW('${element1.narasi}');
                          }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Terms and Conditions",
      home: Scaffold(
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
                    Icon(MdiIcons.fileDocumentPlus,
                        size: 25, color: blackColor),
                    const SizedBox(width: 10),
                    const Text(
                      "Terms & Conditions",
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
        body: GetBuilder<OptionTncController>(
          initState: (state) async {
            await _controllerPage.initPage(context);
          },
          builder: (_) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    listItem1(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
