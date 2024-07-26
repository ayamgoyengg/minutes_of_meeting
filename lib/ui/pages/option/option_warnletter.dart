part of '../pages.dart';

class OptionWarnletter extends StatelessWidget {
  OptionWarnletter({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionWarnletterController());

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

  Widget itemWarnletter(BuildContext context, WarnletterData item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => DetailWarnletterPage(itemWarnletterData: item)),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: "#e6e6e6".toColor(),
              ),
              child: Row(
                children: [
                  Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: "#ccc".toColor(),
                      ),
                      child: Center(child: Icon(MdiIcons.emailAlert, color: mainColor, size: 30))),
                  const SizedBox(width: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: "#b1a7fc".toColor(),
                        ),
                        child: Text(formatDateDDMMMMYY(DateTime.fromMillisecondsSinceEpoch(item.updatedAt! * 1000).toString()),
                            style: blackFontStyle3.copyWith(color: mainColor, fontSize: 12, fontWeight: FontWeight.w700))),
                    Container(
                        width: MediaQuery.of(context).size.width - (2 * defaultMargin) - 56 - 24 - 10,
                        child: Text(
                          PRO(context).selectedCategory == "English" 
                          ? "Publisher : ${item.penerbit?.name ?? '-'}"
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "出版者 : ${item.penerbit?.name ?? '-'}"
                              : "Penerbit : ${item.penerbit?.name ?? '-'}"),
                         style: blackFontStyle2.copyWith(fontSize: 13), overflow: TextOverflow.ellipsis))
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Warning Letter" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "警告信"
          : "Surat Peringatan"),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
            ? "Warning Letter" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "警告信"
                : "Surat Peringatan"),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<OptionWarnletterController>(
          initState: (state) async => await _controllerPage.initPage(context),
          builder: (_) {
            return Stack(
              children: [
                _controllerPage.warnletterData.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            width: 200,
                            child: const Image(
                              image: AssetImage('assets/nf.gif'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              children: [
                                Text(
                                  PRO(context).selectedCategory == "English" 
                                  ? "Oops!\nData not found" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "哦！\n未找到数据"
                                      : "Oops!\nData tidak ditemukan"),
                                  style: blackFontStyle1.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  PRO(context).selectedCategory == "English" 
                                  ? "You don't have warning letter"
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "您没有收到任何警告信"
                                      : "Anda tidak memiliki surat peringatan"),
                                  style: blackFontStyle1.copyWith(color: greyColor, fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                        controller: _controllerPage.controllerWarnletterData,
                        itemCount: _controllerPage.warnletterData.length,
                        itemBuilder: (context, index) {
                          // log(_controllerPage.warnletterData[index].toJson().toString());
                          return itemWarnletter(context, _controllerPage.warnletterData[index]);
                        },
                      ),
                _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
