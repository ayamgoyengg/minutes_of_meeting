part of '../controllers.dart';

class OptionEditMomController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  List<MeetingData> meetingData = [];

  Future<void> getMeeting(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api()
          .GET(API_MEETING, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<MeetingData> listMeetingData = [];
          for (var element1 in resData?.data['data']) {
            listMeetingData.add(MeetingData.fromJson(element1));
          }
          listMeetingData
              .sort((a, b) => (b.idMeeting ?? 0).compareTo(a.idMeeting ?? 0));

          update();
          print(resData);
          print('Successfully fetched data');
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
  }
}
