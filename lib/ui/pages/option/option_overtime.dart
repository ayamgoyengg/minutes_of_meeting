part of '../pages.dart';

class OptionOvertime extends StatelessWidget {
  OptionOvertime({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionOvertimeController());

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

  Widget modalSelectDate(BuildContext context) {
    return GetBuilder<OptionOvertimeController>(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
                ),
                child: SfDateRangePicker(
                  controller: _controllerPage.controllerDatePicker,
                  onSelectionChanged: _controllerPage.onSelectionChanged,
                  headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center, textStyle: Theme.of(context).textTheme.titleLarge),
                  headerHeight: 80,
                  selectionMode: DateRangePickerSelectionMode.single,
                ),
              ),
            ],
          ),
        );
      },
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
                        child: Text("Penerbit : ${item.penerbit?.name ?? '-'}", style: blackFontStyle2.copyWith(fontSize: 15), overflow: TextOverflow.ellipsis))
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget formDataOvertime(BuildContext context) {
    return GetBuilder<OptionOvertimeController>(builder: (_) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
          child: ListView(children: [
            const SizedBox(height: 15),
            Text(
              PRO(context).selectedCategory == "English" 
              ? "User ID" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "用户ID"
                  : "ID User"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(placeHolder: 
            PRO(context).selectedCategory == "English" 
              ? "Your User ID" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "您的用户ID"
                  : "ID User Anda"),
             labelFrom: '', readOnly: _controllerPage.conditionGetAPI == true ? true : false, controllerField: _controllerPage.controllerUserID),
            const SizedBox(height: 15),
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Employee ID" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "工号"
                  : "ID Employee"),
               style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(
                placeHolder: 
                PRO(context).selectedCategory == "English" 
              ? "Your Employee ID" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "您的工号"
                  : "ID Employee Anda"),
                labelFrom: '',
                readOnly: _controllerPage.conditionGetAPI == true ? true : false,
                controllerField: _controllerPage.controllerEmpoyeeID),
            const SizedBox(height: 15),
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Division" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "部门"
                  : "Divisi"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(
                placeHolder: 
                PRO(context).selectedCategory == "English" 
              ? "Your Division" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "您的部门"
                  : "Division Anda"),
                labelFrom: '',
                readOnly: _controllerPage.conditionGetAPI == true ? true : false,
                controllerField: _controllerPage.controllerDivisi),
            const SizedBox(height: 15),
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Basic Salary" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "底薪"
                  : "Gaji Pokok"),
               style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(
                placeHolder: 
                PRO(context).selectedCategory == "English" 
                ? "Your Basic Salary" 
                : (PRO(context).selectedCategory == "Chinese"
                    ? "您的底薪"
                    : "Gaji Pokok Anda"),
                labelFrom: '',
                readOnly: _controllerPage.conditionGetAPI == true ? true : false,
                controllerField: _controllerPage.controllerGaji),
            const SizedBox(height: 15),
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Overtime day class" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "加班组"
                  : "Golongan hari lembur"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
              ),
              child: DropdownButton(
                value: _controllerPage.selectedCategory,
                isExpanded: true,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(20),
                items: _controllerPage.category.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value) {
                  _controllerPage.handleSelectedCategory(value);
                },
              ),
            ),
            const SizedBox(height: 15),
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Date" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "日期"
                  : "Tanggal"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomDateField(
              placeHolder: 'DD/MM/YY',
              labelFrom: '',
              readOnly: true,
              customFunction2: _controllerPage.handleShowModal,
              controllerField: _controllerPage.controllerTanggal,
              suffixIcon: Icon(Icons.calendar_month),
            ),
            const SizedBox(height: 15),
            Row(children: [
              Container(
                  width: (MediaQuery.of(context).size.width - (2 * defaultMargin) - 20) / 2,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      PRO(context).selectedCategory == "English" 
                      ? "Clock In" 
                      : (PRO(context).selectedCategory == "Chinese"
                          ? "上班时间"
                          : "Jam Masuk"),
                      style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
                          ),
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                            keyboardType: TextInputType.numberWithOptions(decimal: false),
                            inputFormatters: <TextInputFormatter>[TimeTextInputFormatter(exp: RegExp(r'^[0-9:]+$'))], // This input formatter will do the job
                            controller: _controllerPage.controllerJamMasuk,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              hintText: '00:00:00',
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.transparent, width: 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])),
              const SizedBox(width: 15),
              SizedBox(
                  width: (MediaQuery.of(context).size.width - (2 * defaultMargin) - 20) / 2,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      PRO(context).selectedCategory == "English" 
                      ? "Clock Out" 
                      : (PRO(context).selectedCategory == "Chinese"
                          ? "下班时间"
                          : "Jam Pulang"),
                       style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
                          ),
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                            keyboardType: TextInputType.numberWithOptions(decimal: false),
                            controller: _controllerPage.controllerJamPulang,
                            inputFormatters: <TextInputFormatter>[TimeTextInputFormatter(exp: RegExp(r'^[0-9:]+$'))], // This input formatter will do the job

                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              hintText: '00:00:00',
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.transparent, width: 0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(color: Colors.transparent, width: 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])),
            ]),
            const SizedBox(height: 30),
          ]),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Overtime" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "加班"
          : "Lembur"),
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
              ? "Overtime" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "加班"
                  : "Lembur"),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          ),
          body: GetBuilder<OptionOvertimeController>(
            initState: (state) async => await _controllerPage.initPage(context),
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      formDataOvertime(context),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async => await _controllerPage.submit(context),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                              backgroundColor: MaterialStateProperty.all(mainColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                            ),
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                              ? "Send" 
                              : (PRO(context).selectedCategory == "Chinese"
                                  ? "发送"
                                  : "Kirim"),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  _controllerPage.showModal == true ? modalSelectDate(context) : Container(),
                  _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
