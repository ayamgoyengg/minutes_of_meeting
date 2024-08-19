part of '../controllers.dart';

class CalendarPageController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  List<StmeetingData> stmeetingData = [];
  List<MeetingData> meetingData = [];


  Future<void> getStmeeting(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_STMEETING, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<StmeetingData> listStmeetingData = [];
          for (var element1 in resData?.data['data']) {
            listStmeetingData.add(StmeetingData.fromJson(element1));
          }
          listStmeetingData.sort((a, b) => (b.idStmeeting ?? 0).compareTo(a.idStmeeting ?? 0));
          stmeetingData = listStmeetingData;
          update();
          // print(resData);
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      // snackBarsError(message: 'Something wrong $e');
    }
  }
  
  Future<void> getMeeting(BuildContext context) async {
  try {
    handleLoadingWidget();
    WrapResponse? resData = await Api().GET(API_MEETING, context, useSnackbar: false, useToken: true);
    if (resData?.statusCode == 200) {
      if (resData?.data['data'] != null) {
        List<MeetingData> listMeetingData = [];
        for (var element1 in resData?.data['data']) {
          listMeetingData.add(MeetingData.fromJson(element1));
        }
        listMeetingData.sort((a, b) => (b.idMeeting ?? 0).compareTo(a.idMeeting ?? 0));
        // Limit to the 3 most recent entries
        meetingData = listMeetingData;
          update();
      }
    } else {
      print('Failed to fetch data');
    }
    handleLoadingWidget();
  } catch (e) {
    handleLoadingWidget();
    // Optional: Handle the error as needed
    // snackBarsError(message: 'Something went wrong: $e');
  }
}



  Future<void> initPage(BuildContext context) async {
    await getMeeting(context);
    await getStmeeting(context);
  }
}
