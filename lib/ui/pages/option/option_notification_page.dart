part of "../pages.dart";

class OptionNotification extends StatelessWidget {
  OptionNotification({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionNotificationController());

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

  Widget listNotifikasi(BuildContext context) {
    return GetBuilder<OptionNotificationController>(builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: _controllerPage.notificationData == null
                ? []
                : _controllerPage.notificationData!.isEmpty
                    ? []
                    : _controllerPage.notificationData!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final element1 = entry.value;
                        return itemNotification(element1, index, context);
                      }).toList(),
          ),
        ),
      );
    });
  }

  String formatDateFromEpoch(int epoch) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  Widget itemNotification(NotificationData item, int index, BuildContext context) {
    final random = Random();
    final colorOptions = [
      "#037ffc".toColor(),
      "#4fb3ff".toColor(),
      "#4702b0".toColor()
    ];
    final iconOptions = [MdiIcons.bell, MdiIcons.alertCircle, MdiIcons.bellAlert];

    final randomIndex = random.nextInt(min(colorOptions.length, iconOptions.length));
    final randomColor = colorOptions[randomIndex];
    final iconData = iconOptions[randomIndex];

    int? epochTimestamp = item.createdAt; // Example epoch timestamp
    String formattedDate = formatDateFromEpoch(epochTimestamp!);

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            height: Get.height / 1.2,
            width: Get.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: defaultMargin * 5,
                    right: defaultMargin * 5,
                    top: 15,
                  ),
                  child: Container(
                    width: 100,
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: mainColor,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Image(image: NetworkImage('${item.thumbnail}')),
                          const SizedBox(height: 10),
                          Text(
                            '${item.title}',
                            style: blackFontStyle1.copyWith(
                              color: mainColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${item.description}',
                            style: blackFontStyle3.copyWith(),
                          ),
                          const SizedBox(height:15),
                          Row(
                            children: [
                              Icon(MdiIcons.account, size:15, color: greyColor),
                              const SizedBox(width:2),
                              Text(
                                PRO(context).selectedCategory == "English" 
                                  ? "Publisher : " 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "出版者 : "
                                      : "Penerbit : "),
                                style: TextStyle(color: greyColor)),
                              const SizedBox(width:2),
                              Container(
                                width:  (MediaQuery.of(context).size.width - 200),
                                child: Text(
                                  '${item.penerbit != null ? item.penerbit : "-"}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: blackFontStyle3.copyWith(color: greyColor ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height:15),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        decoration: index == _controllerPage.notificationData!.length - 1
            ? null
            : const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 183, 183, 183)),
                ),
              ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center, // Align children vertically in the center
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: randomColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 40 - 60 - 10 - 20),
                    child: Text(
                      '${item.title}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 40 - 60 - 10 - 20) / 1.5,
                        child: Text(
                          '${item.description}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: blackFontStyle3.copyWith(color: greyColor, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Notification" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "消息"
          : "Notifikasi"),
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
              ? "Notification" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "消息"
                  : "Notifikasi"),),
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          ),
          body: GetBuilder<OptionNotificationController>(
            initState: (state) async {
              await _controllerPage.initPage(context);
            },
            builder: (_) {
            return Stack(
              children: [
                _controllerPage.notificationData.isEmpty
                    ? Center(
                        child: Text(
                          PRO(context).selectedCategory == "English" 
                          ? "Empty notification data" 
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "无消息数据"
                              : "Data notifikasi kosong"),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                        ),
                      )
                    : ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              listNotifikasi(context),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
              ],
            );
          },
            // builder: (_) {
            //   return ListView(
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           const SizedBox(height: 10),
            //           listNotifikasi(context),
            //           const SizedBox(height: 30),
            //         ],
            //       ),
            //     ],
            //   );
            // },
          ),
        ),
      ),
    );
  }
}