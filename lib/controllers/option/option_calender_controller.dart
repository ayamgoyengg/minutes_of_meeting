part of '../controllers.dart';

class OptionCalendarController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  String selectedDate = '';
  int? idAgendaSelected;
  String statusSaveOrPost = 'Tambahkan';

  void handleEditAgenda(CalenderData item) {
    controllerJudulAgenda.text = item.name ?? '';
    controllerTanggalAgenda.text = item.date ?? '';
    idAgendaSelected = item.idCalendar;
    statusSaveOrPost = 'Update';
    update();
  }

  Future<void> deleteCalenderData(BuildContext context, CalenderData item) async {
    WrapResponse? resData = await Api().DELETE('$API_CALENDER/delete/${item.idCalendar}', context, useToken: true, useSnackbar: true);
    if (resData?.statusCode == 200) {
      idAgendaSelected = null;
      statusSaveOrPost = 'Tambahkan';
      update();
      await getCalender(context);
    }
  }

  bool showModal = false;

  List<CalenderData> dataCalender = [];

  ScrollController controllerDataCalender = ScrollController();

  DateRangePickerController controllerDatePicker = DateRangePickerController();

  TextEditingController controllerJudulAgenda = TextEditingController();
  TextEditingController controllerTanggalAgenda = TextEditingController();

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      selectedDate = args.value.toString();
      controllerTanggalAgenda.text = args.value.toString().split(' ')[0];
      showModal = false;
      update();
    }
  }

  void handleShowModal() {
    showModal = true;
    update();
  }

  Future<void> getCalender(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_CALENDER, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<CalenderData> listDataCalender = [];
          for (var element1 in resData?.data['data']) {
            listDataCalender.add(CalenderData.fromJson(element1));
          }
          dataCalender = listDataCalender;
          update();
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      snackBarsError(message: 'Something wrong $e');
    }
  }

  bool validation(BuildContext context) {
    if (controllerJudulAgenda.text == '' ||
        controllerTanggalAgenda.text == '' ) {
      snackBars(message: 
        PRO(context).selectedCategory == "English" 
          ? "Please complete the form above" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Please complete the form above"
              : 'Tolong lengkapi form di atas'),
      );
      return false;
    }
    return true;
  }

  Future<void> submitCalender(BuildContext context) async {
    if (idAgendaSelected == null) {
      if (validation(context) == false) {
        return;
      }
      CalenderData itemSend = CalenderData(
        // userId: int.tryParse(PRO(context).userData?.id?.toString() ?? "") ?? 0,
        userId: PRO(context).userData?.id.toString(), 
        name: controllerJudulAgenda.text, 
        date: controllerTanggalAgenda.text
      );
      WrapResponse? resData = await Api().POSTFORMDATA('$API_CALENDER/tambah', itemSend.toJsonSend(), context, useToken: true, useSnackbar: true);
      try {
        if (resData?.statusCode == 200) {
        idAgendaSelected = null;
        controllerJudulAgenda.text = '';
        controllerTanggalAgenda.text = '';
        statusSaveOrPost = 'Tambahkan';
        update();
        await getCalender(context);
        }
      }catch (e) {
        snackBarsError(message: 'Something wrong $e');
        print('$e');
      }
    } else {
      CalenderData itemSend = CalenderData(name: controllerJudulAgenda.text, date: controllerTanggalAgenda.text);
      WrapResponse? resData = await Api().POSTFORMDATA('$API_CALENDER/$idAgendaSelected', itemSend.toJsonSend(), context, useToken: true, useSnackbar: true);
      if (resData?.statusCode == 200) {
        idAgendaSelected = null;
        controllerJudulAgenda.text = '';
        controllerTanggalAgenda.text = '';
        statusSaveOrPost = 'Tambahkan';
        update();
        await getCalender(context);
      }
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getCalender(context);
  }
}
