part of '../pages.dart';

class OptionCalendar extends StatelessWidget {
  OptionCalendar({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionCalendarController());

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
    return GetBuilder<OptionCalendarController>(
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

  Widget createUpdateAgendaWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              PRO(context).selectedCategory == "English" 
              ? "Create your agenda" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "安排您的日程"
                  : "Buat agenda anda"),
               style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
            const Divider(),
            CustomDateField(
              placeHolder: 'DD/MM/YY',
              labelFrom: '',
              readOnly: true,
              customFunction2: _controllerPage.handleShowModal,
              controllerField: _controllerPage.controllerTanggalAgenda,
              suffixIcon: Icon(Icons.calendar_month),
            ),
            CustomTextField3(placeHolder: 
            PRO(context).selectedCategory == "English" 
            ? "Input your agenda" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "添加日程主题"
                : "Masukkan judul agenda anda"),
            labelFrom: '', controllerField: _controllerPage.controllerJudulAgenda),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async => await _controllerPage.submitCalender(context),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
                  ),
                  child: Text(
                    _controllerPage.statusSaveOrPost == "Tambahkan"
                    ? PRO(context).selectedCategory == "English"
                        ? "Create"
                        : (PRO(context).selectedCategory == "Chinese" ? "保存" : "Simpan")
                    : PRO(context).selectedCategory == "English"
                        ? "Update"
                        : (PRO(context).selectedCategory == "Chinese" ? "更新" : "Ubah"),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
            ),
          ],
        ),
      ),
    );
  }

  Widget yourAgendaWidget(BuildContext context) {
    return Expanded(
      child: GetBuilder<OptionCalendarController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                 PRO(context).selectedCategory == "English" 
                                  ? "Your agenda" 
                                  : (PRO(context).selectedCategory == "Chinese"
                                      ? "您的日程"
                                      : "Agenda anda"),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      controller: _controllerPage.controllerDataCalender,
                      itemCount: _controllerPage.dataCalender.length,
                      itemBuilder: (context, index) {
                        return itemNote(context, _controllerPage.dataCalender[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemNote(BuildContext context, CalenderData data) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(MdiIcons.calendarTextOutline, size: 20)],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name ?? '-', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900)),
                            const Divider(),
                            Text(formatDateDDMMMMYY(data.date), overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 80,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _controllerPage.handleEditAgenda(data),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(5)),
                        child: Icon(MdiIcons.noteEditOutline, color: Colors.white)),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () async => await _controllerPage.deleteCalenderData(context, data),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                        child: Icon(MdiIcons.deleteOutline, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Calendar" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "日历"
          : "Kalender"),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
            ? "Calendar" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "日历"
                : "Kalender"),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<OptionCalendarController>(
          initState: (state) async => await _controllerPage.initPage(context),
          builder: (_) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    createUpdateAgendaWidget(context),
                    const SizedBox(height: 10),
                    yourAgendaWidget(context),
                    const SizedBox(height: 10),
                  ],
                ),
                _controllerPage.showModal == true ? modalSelectDate(context) : Container(),
                _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
