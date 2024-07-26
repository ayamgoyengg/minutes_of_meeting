part of "../pages.dart";

class DetailReportPage extends StatelessWidget {
  final PermissionData item;
  DetailReportPage({super.key, required this.item});

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => MainPage()),
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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget listView1(BuildContext context) {
    DateTime itemTime = DateTime.fromMillisecondsSinceEpoch(item.updatedAt! * 1000);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2),
                    child: Row(children: [
                      Container(
                        width: 60,
                        height:60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // color: "#ccc".toColor(),
                          image: DecorationImage(
                            image: PRO(context).userData?.profilePhotoPath != null
                              ? NetworkImage('${PRO(context).userData?.profilePhotoUrl}')
                              : AssetImage(
                                  PRO(context).userData?.employee?.gender == "Male"
                                      ? 'assets/co.png'
                                      : 'assets/ce.png',
                                ) as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 50 -20,
                            child: Text('${PRO(context).userData?.name}', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600),maxLines:1,overflow: TextOverflow.ellipsis,)),
                          Container(
                              width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 50 - 80,
                              child: Text(
                                '${PRO(context).userData?.personGroup}',
                                style: blackFontStyle3.copyWith(color: greyColor, fontSize: 12),
                                overflow: TextOverflow.clip,
                              )),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        item.atc != null
            ? Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: bgGrey,
                  image: DecorationImage(image: NetworkImage(item.atc!), fit: BoxFit.cover),
                ),
              )
            : Container(),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Category : " 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "类型 : "
                        : "Kategori : "),
                  style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Text(
                  item.category ?? '',
                  style: blackFontStyle3.copyWith(),
                ),
                const SizedBox(height: 15),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Paid Leave Date : " 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "? : "
                        : "Tanggal Izin : "),
                  style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Text(
                  formatDateDDMMMMYY(item.date),
                  style: blackFontStyle3.copyWith(),
                ),
                const SizedBox(height: 15),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Total Days : " 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "总日数 : "
                        : "Total Hari : "),
                  style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? '${item.totDay} Day '
                    : (PRO(context).selectedCategory == "Chinese"
                        ? '${item.totDay} ? '
                        : '${item.totDay} Hari '),
                  style: blackFontStyle3.copyWith(),
                ),
              ],
            )),
        Container(
          width: double.infinity,
          height: 15,
          color: "#eee".toColor(),
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Report Details : " 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "? :"
                        : "Detail Laporan : "),
                  style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Report Number" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "报告号"
                        : "Nomor Laporan"),
                  style: blackFontStyle3.copyWith(fontSize: 13, color: greyColor),
                ),
                SizedBox(height: 10),
                Text(
                  'LP- ${item.createdAt ?? ''}${item.idPermission ?? ''}',
                  style: blackFontStyle3.copyWith(),
                ),
                SizedBox(height: 15),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Date Created" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "制作日期"
                        : "Tanggal Dibuat"),
                  style: blackFontStyle3.copyWith(fontSize: 13, color: greyColor),
                ),
                SizedBox(height: 10),
                Text(
                  // '02 Feb 2023, 15:09',
                  '${DateFormat('d').format(itemTime)} ${DateFormat('MMMM').format(itemTime)} ${DateFormat('y').format(itemTime)}, ${DateFormat('jm').format(itemTime)}',

                  style: blackFontStyle3.copyWith(),
                ),
                SizedBox(height: 15),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Status" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "现状"
                        : "Status"),
                  style: blackFontStyle3.copyWith(fontSize: 13, color: greyColor),
                ),
                SizedBox(height: 10),
                Text(
                  item.status ?? '-',
                  style: blackFontStyle3.copyWith(),
                ),
              ],
            )),
        Container(
          width: double.infinity,
          height: 15,
          color: "#eee".toColor(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              leading: IconButton(
                icon: Icon(MdiIcons.chevronLeft, color: Colors.black, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.white,
              title: Text(
                PRO(context).selectedCategory == "English" 
                    ? "Report Details" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "详细报告"
                        : "Detail Laporan"),
                style: TextStyle(color: Colors.black)),
            ),
            body: Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        listView1(context),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
