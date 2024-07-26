part of '../pages.dart';

class OptionLeave extends StatelessWidget {
  final _controllerPage = Get.put(OptionLeaveController());

  OptionLeave({super.key});

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
    return GetBuilder<OptionLeaveController>(
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

  Widget listView1(BuildContext context) {
    return GetBuilder<OptionLeaveController>(builder: (_) {
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
            ? "Category" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "类型"
                : "Kategori"),
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
            Text(
            PRO(context).selectedCategory == "English" 
            ? "Total Day" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "总日数"
                : "Total Hari"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
            CustomTextField3(placeHolder: 
            PRO(context).selectedCategory == "English" 
            ? "Input total day" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "输入总日数"
                : "Masukkan total hari"),
            labelFrom: '', keyboardType: TextInputType.number, controllerField: _controllerPage.controllerTotalHari),
            const SizedBox(height: 15),
            Text(
             PRO(context).selectedCategory == "English" 
              ? "Attachment" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "附件"
                  : "Lampiran"),
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
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
            ? "Paid Leave" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "申请加班"
                : "Pengajuan Libur"),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
            ? "Paid Leave" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "申请加班"
                : "Pengajuan Libur"),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<OptionLeaveController>(
            initState: (state) async => await _controllerPage.initPage(context),
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
                            child: Text(
                              PRO(context).selectedCategory == "English" 
                                  ? "Send" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "发送"
                                      : "Kirim"),
                               style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                  _controllerPage.showModal == true ? modalSelectDate(context) : Container(),
                  _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
                ],
              );
            }),
      ),
    );
  }
}
