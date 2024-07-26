part of '../controllers.dart';

class OptionMeetingController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }
  List<MeetingData> meetingData = [];
  List<MeetingData> meetingTodayData = [];
  List<MeetingData> meetingDivisiData = [];
  List<MeetingData> meetingUserData = [];
  List<MeetingData> meetingDivisiAllData = [];
  List<MeetingData> meetingUserAllData = [];

  List<MeetingData> meetingDataAll = [];
  List<MeetingData> meetingData1 = [];
  List<MeetingData> meetingData2 = [];
  List<MeetingData> meetingData3 = [];
  List<MeetingData> meetingData4 = [];

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

  Future<void> getMeetingToday(BuildContext context) async {
    DateTime now = DateTime.now();
    String formattedDate = '${now.year}-${(now.month)}-${(now.day)}';
    String? user = PRO(context).userData?.name;
    String? divisi = PRO(context).userData?.personGroup;

    try {
      handleLoadingWidget();

      List<MeetingData> listMeetingData1 = [];
      WrapResponse? resData1 = await Api().GET('$API_MEETING?user=$user&date=$formattedDate', context, useSnackbar: false, useToken: true);
      if (resData1?.statusCode == 200) {
        if (resData1?.data['data'] != null) {
          for (var element1 in resData1?.data['data']) {
            listMeetingData1.add(MeetingData.fromJson(element1));
          }
          listMeetingData1.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          meetingData1 = listMeetingData1;
        }
      }

      List<MeetingData> listMeetingData2 = [];
      WrapResponse? resData2 = await Api().GET('$API_MEETING?division=$divisi&date=$formattedDate', context, useSnackbar: false, useToken: true);
      if (resData2?.statusCode == 200) {
        if (resData2?.data['data'] != null) {
          for (var element1 in resData2?.data['data']) {
            listMeetingData2.add(MeetingData.fromJson(element1));
          }
          listMeetingData2.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          meetingData2 = listMeetingData2;
        }
      }

      List<MeetingData> listMeetingData3 = [];
      WrapResponse? resData3 = await Api().GET('$API_MEETING?user=Semua Pengguna&date=$formattedDate', context, useSnackbar: false, useToken: true);
      if (resData3?.statusCode == 200) {
        if (resData3?.data['data'] != null) {
          for (var element3 in resData3?.data['data']) {
            listMeetingData3.add(MeetingData.fromJson(element3));
          }
          listMeetingData3.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          meetingData3 = listMeetingData3;
        }
      }

      List<MeetingData> listMeetingData4 = [];
      WrapResponse? resData4 = await Api().GET('$API_MEETING?division=Semua Divisi&date=$formattedDate', context, useSnackbar: false, useToken: true);
      if (resData4?.statusCode == 200) {
        if (resData4?.data['data'] != null) {
          for (var element1 in resData4?.data['data']) {
            listMeetingData4.add(MeetingData.fromJson(element1));
          }
          listMeetingData4.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          meetingData4 = listMeetingData4;
        }
      }

      meetingDataAll = listMeetingData1 + listMeetingData2 + listMeetingData3 + listMeetingData4;
      meetingDataAll.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
      
      update();
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();
      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getMeetingDivisi(BuildContext context) async {
    String? divisi = PRO(context).userData?.personGroup;
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET('$API_MEETING?division=$divisi', context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<MeetingData> listMeetingDivisiData = [];
          for (var element1 in resData?.data['data']) {
            listMeetingDivisiData.add(MeetingData.fromJson(element1));
          }
          meetingDivisiData = listMeetingDivisiData;
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

  Future<void> getMeetingDivisiAll(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET('$API_MEETING?division=Semua Divisi', context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<MeetingData> listMeetingDivisiAllData = [];
          for (var element1 in resData?.data['data']) {
            listMeetingDivisiAllData.add(MeetingData.fromJson(element1));
          }
          meetingDivisiAllData = listMeetingDivisiAllData;
          update();
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getMeetingUserAll(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET('$API_MEETING?user=Semua Pengguna', context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<MeetingData> listMeetingUserAllData = [];
          for (var element1 in resData?.data['data']) {
            listMeetingUserAllData.add(MeetingData.fromJson(element1));
          }
          meetingUserAllData = listMeetingUserAllData;
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
    await getMeetingToday(context);
    await getMeetingDivisi(context);
    await getMeetingUser(context);
    await getMeetingDivisiAll(context);
    await getMeetingUserAll(context);
  }
}
