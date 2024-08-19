part of '../controllers.dart';

class OptionMeetingController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }
  List<MeetingData> meetingData = [];
  List<MeetingData> meetingUserData = [];

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
          meetingData = listMeetingData;
          update();
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getMeetingUser(BuildContext context) async {
    String? user = PRO(context).userData?.name;
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET('$API_MEETING?user=$user', context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<MeetingData> listMeetingUserData = [];
          for (var element1 in resData?.data['data']) {
            listMeetingUserData.add(MeetingData.fromJson(element1));
          }
          meetingUserData = listMeetingUserData;
          update();
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getMeeting(context);
    await getMeetingUser(context);
  }
}
