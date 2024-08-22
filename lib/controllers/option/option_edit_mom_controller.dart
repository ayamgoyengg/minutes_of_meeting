part of '../controllers.dart';

class OptionEditMomController extends GetxController {
  final QuillEditorController controllerNotes = QuillEditorController();
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
          meetingData = listMeetingData; // Make sure this line is present
          update(); // This updates the UI
          print('Successfully fetched data');
        }
      } else {
        print('Failed to fetch data');
      }
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();
      print('Error: $e');
    }
  }

  // edit
  Future<void> edit(BuildContext context, MeetingData item) async {
    handleLoadingWidget();
    // Get the current text from the Quill editor
    String notesText = await controllerNotes.getText();
    MeetingData data = MeetingData(
      notes: notesText,  // Use the text from Quill editor
    );

    WrapResponse? resData = await Api().POSTFORMDATA(
      'update/$API_MEETING/${item.idMeeting}',
      data.toJsonSend(),
      context,
      useSnackbar: true,
      useToken: true,
    );

  if (resData?.statusCode == 200) {
    snackBarsSuccess(
      message: 'Data meeting berhasil di update',
    );

    Get.offAll(() => FolderPage());
  } else {
    snackBarsError(
      message: 'Gagal edit data meeting',
    );
  }
}

  Future<void> initPage(BuildContext context) async {
    await getMeeting(context);
  }
}
