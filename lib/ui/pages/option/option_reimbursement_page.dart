part of '../pages.dart';

class OptionReimbursement extends StatelessWidget {
  final _controllerPage = Get.put(OptionReimbursementController());

  OptionReimbursement({super.key});

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

  Widget listView1(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
        child: ListView(children: [
          const SizedBox(height: 15),
          Text('ID - User :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
          CustomTextField3(placeHolder: '3 -> id (readonly)', labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerUserID),
          const SizedBox(height: 15),
          Text('ID - Employee :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
          CustomTextField3(placeHolder: 'WS00017 -> employee_id (readonly)', labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerEmpoyeeID),
          const SizedBox(height: 15),
          Text('Nama :', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
          CustomTextField3(placeHolder: '3 -> id (readonly)', labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerName),
          const SizedBox(height: 15),
          Text('Keperluan:', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
          CustomTextField3(placeHolder: 'Masukkan Keperluan', labelFrom: '',  controllerField: _controllerPage.controllerTitle),
          const SizedBox(height: 15),
          Text('Nominal:', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
          CustomTextField3(placeHolder: 'Masukkan Nominal', labelFrom: '', keyboardType: TextInputType.number, controllerField: _controllerPage.controllerNominal),
          const SizedBox(height: 15),
          Text('Lampiran:', style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
          GestureDetector(
            onTap: () async => await _controllerPage.handlePickImageUser(context),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.symmetric(vertical: defaultMargin),
              child: (_controllerPage.pickImageUser != null)
                  ? Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: FileImage(_controllerPage.pickImageUser!), fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bgGrey,
                      ),
                      child: Icon(MdiIcons.camera, size: 55, color: Color.fromARGB(255, 156, 156, 156)),
                    ),
            ),
          ),
          SizedBox(height:15),
          Container(
            child: Text("Reimbursement Anda", style:blackFontStyle2.copyWith(color: mainColor, fontWeight: FontWeight.w700))),
          Container(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: _controllerPage.reimbursementData == null
                    ? []
                    : _controllerPage.reimbursementData!.isEmpty
                        ? []
                        : _controllerPage.reimbursementData!.map((element1) {
                            return itemReimbursement(element1, context);
                          }).toList(),
              ),
              // child: ListView.builder(
              //     itemCount: listItemOptionOpenTrip.length,
              //     itemBuilder: (BuildContext context, index) {
              //       return itemReimbursement(listItemOptionOpenTrip[index]);
              //     }),
            ),
          ),
        ]),
      ),
    );
  }

  Widget itemReimbursement(ReimbursementData item, BuildContext context) {
    final number = double.parse(item.nominal.toString());
    final formatter = NumberFormat('#,##0', 'id_ID');
    final formattedNumber = formatter.format(number);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:60,
            height:60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 196, 59),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(MdiIcons.wallet, color: Colors.white),
            ),
          ),
          SizedBox(width:10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:5),
              Container(
                width:  (MediaQuery.of(context).size.width - 40 -60 - 10 - 20 -19),
                child: Text(
                  '${item.title}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: blackFontStyle1.copyWith(fontWeight: FontWeight.w700, fontSize: 15, ),
                ),
              ),
              SizedBox(height:3),
              Row(
                children: [
                  Text(
                    'Rp. ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackFontStyle3.copyWith(color: Colors.black ),
                  ),
                  SizedBox(width:2),
                  Text(
                    formattedNumber,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackFontStyle3.copyWith(color: Colors.black ),
                  ),
                  SizedBox(width:10),
                  Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: item.status == "Pending"
                        ? Color.fromARGB(255, 214, 214, 214)
                        : item.status == "Confirm"
                            ? Color.fromARGB(255, 91, 255, 97)
                            : Colors.red,
                  ),
                  child: Text(item.status ?? '-', style: blackFontStyle3.copyWith(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reimbursement',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: const Text('Reimbursement'),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<OptionReimbursementController>(
            initState: (state) => _controllerPage.initPage(context),
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      listView1(context),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async => await _controllerPage.submitAttendance(context),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                              backgroundColor: MaterialStateProperty.all(mainColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                            ),
                            child: Text("Kirim", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
