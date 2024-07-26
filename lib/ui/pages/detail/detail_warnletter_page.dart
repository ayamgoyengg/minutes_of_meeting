part of "../pages.dart";

class DetailWarnletterPage extends StatelessWidget {
  final WarnletterData itemWarnletterData;
  const DetailWarnletterPage({super.key, required this.itemWarnletterData});

  Widget listView1(BuildContext context) {
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 50,
                    child: Row(children: [
                      // Container(
                      //   width: 60,
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(50),
                      //     // color: bgGrey,
                      //     image: const DecorationImage(image: NetworkImage('https://ui-avatars.com/api/?name=D+E&color=7F9CF5&background=EBF4FF'), fit: BoxFit.cover),
                      //   ),
                      // ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: itemWarnletterData.penerbit?.profilePhotoUrl != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage('${itemWarnletterData.penerbit?.profilePhotoUrl}'),
                                backgroundColor: Colors.transparent,
                              )
                            : const CircleAvatar(
                                backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=D+E&color=7F9CF5&background=EBF4FF'),
                                backgroundColor: Colors.transparent,
                              ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(itemWarnletterData.penerbit?.name ?? '-', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600)),
                          Container(
                              width: MediaQuery.of(context).size.width - (defaultMargin * 2) - (8 * 2) - 50 - 80,
                              child: Text(
                                itemWarnletterData.penerbit?.personGroup ?? '-',
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
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Reprimands Category : "
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "? : "
                        : "Kategori Teguran : "),
                  style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: "#b1a7fc".toColor(),
                          ),
                          child: Text(itemWarnletterData.warncategory?.name ?? '-', style: blackFontStyle3.copyWith(color: mainColor, fontSize: 12, fontWeight: FontWeight.w700))),
                      Text(
                        ' / ${formatDateDDMMMMYY(DateTime.fromMillisecondsSinceEpoch(itemWarnletterData.updatedAt! * 1000).toString())}',
                        style: blackFontStyle3.copyWith(fontSize: 13, color: greyColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  PRO(context).selectedCategory == "English" 
                    ? "Attachment : " 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "附件 : "
                        : "Lampiran : "),
                  style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        String stringUrlLetter = '${itemWarnletterData.letter}';
                        Uri urlWa = Uri.parse(stringUrlLetter);
                        try {
                          await launchUrl(urlWa, mode: LaunchMode.externalApplication);
                        } catch (e) {
                          snackBarsError(message: 'Could not open file');
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(145, 45)),
                        backgroundColor: MaterialStateProperty.all('#221e45'.toColor()),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      ),
                      child: Text(
                        PRO(context).selectedCategory == "English" 
                        ? "View Attachment" 
                        : (PRO(context).selectedCategory == "Chinese"
                            ? "看附件"
                            : "Lihat Lampiran"),
                  )),
                )
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
                    ? "Description : " 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "信息 : "
                        : "Keterangan : "),
                style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                itemWarnletterData.keterangan ?? '-',
                style: blackFontStyle3.copyWith(fontSize: 13, color: greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: mainColor,
              title: Text(
                PRO(context).selectedCategory == "English" 
                    ? "Warning Letter Details"
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "警告信详细"
                        : "Detail Surat Peringatan"),
                 style: TextStyle(color: Colors.white)),
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
