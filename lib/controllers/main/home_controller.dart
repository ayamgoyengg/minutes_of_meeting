part of '../controllers.dart';

class HomeController extends GetxController {
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
  List<KnowladgeData> knowladgeData = [];
  List<NotificationData> notificationData = [];
  List<NotificationData> notificationData1 = [];
  List<NotificationData> notificationData2 = [];
  List<NotificationData> notificationData3 = [];
  List<NotificationData> notificationData4 = [];

  List<MeetingData> meetingDataAll = [];
  List<MeetingData> meetingData1 = [];
  List<MeetingData> meetingData2 = [];
  List<MeetingData> meetingData3 = [];
  List<MeetingData> meetingData4 = [];

  List<HikData> masukData = [];
  List<HikData> pulangData = [];
  
  MaintenanceData? maintenanceData;

  Future<void> getKnowladge(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_KNOWLADGE, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<KnowladgeData> listKnowladgeData = [];
          for (var element1 in resData?.data['data']) {
            listKnowladgeData.add(KnowladgeData.fromJson(element1));
          }
          listKnowladgeData.sort((a, b) => (b.idKnowladge ?? 0).compareTo(a.idKnowladge ?? 0));
          knowladgeData = listKnowladgeData;
          update();
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
          meetingData = listMeetingData;
          update();
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      // snackBarsError(message: 'Something wrong $e');
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
      print(meetingDataAll.map((data) => data.toJson()).toList());
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

      // snackBarsError(message: 'Something wrong $e');
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

      // snackBarsError(message: 'Something wrong $e');
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

      // snackBarsError(message: 'Something wrong $e');
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

      // snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getMaintenanceData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_MAINTENANCE, context);
    if (resData?.data['data'] != null) {
      List<MaintenanceData> listMaintenanceData = [];
      for (var element1 in resData?.data['data']) {
        listMaintenanceData.add(MaintenanceData.fromJson(element1));
      }
      print(listMaintenanceData);
      maintenanceData = listMaintenanceData.isEmpty ? null : listMaintenanceData[0];
      update();
    }
  }

  Future<void> getNotification(BuildContext context) async {
    String? user = PRO(context).userData?.name;
    String? divisi = PRO(context).userData?.personGroup;

    try {
      handleLoadingWidget();

      List<NotificationData> listNotificationData1 = [];
      WrapResponse? resData1 = await Api().GET('$API_NOTIFICATION?direction=$user', context, useSnackbar: false, useToken: true);
      if (resData1?.statusCode == 200) {
        if (resData1?.data['data'] != null) {
          for (var element1 in resData1?.data['data']) {
            listNotificationData1.add(NotificationData.fromJson(element1));
          }
          listNotificationData1.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          notificationData1 = listNotificationData1;
        }
      }

      List<NotificationData> listNotificationData2 = [];
      WrapResponse? resData2 = await Api().GET('$API_NOTIFICATION?division=$divisi', context, useSnackbar: false, useToken: true);
      if (resData2?.statusCode == 200) {
        if (resData2?.data['data'] != null) {
          for (var element1 in resData2?.data['data']) {
            listNotificationData2.add(NotificationData.fromJson(element1));
          }
          listNotificationData2.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          notificationData2 = listNotificationData2;
        }
      }

      List<NotificationData> listNotificationData3 = [];
      WrapResponse? resData3 = await Api().GET('$API_NOTIFICATION?direction=Semua Pengguna', context, useSnackbar: false, useToken: true);
      if (resData3?.statusCode == 200) {
        if (resData3?.data['data'] != null) {
          for (var element3 in resData3?.data['data']) {
            listNotificationData3.add(NotificationData.fromJson(element3));
          }
          listNotificationData3.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          notificationData3 = listNotificationData3;
        }
      }

      List<NotificationData> listNotificationData4 = [];
      WrapResponse? resData4 = await Api().GET('$API_NOTIFICATION?division=Semua Divisi', context, useSnackbar: false, useToken: true);
      if (resData4?.statusCode == 200) {
        if (resData4?.data['data'] != null) {
          for (var element1 in resData4?.data['data']) {
            listNotificationData4.add(NotificationData.fromJson(element1));
          }
          listNotificationData4.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          notificationData4 = listNotificationData4;
        }
      }

      notificationData = listNotificationData1 + listNotificationData2 + listNotificationData3 + listNotificationData4;
      notificationData.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
      update();
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();
      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getMasuk(BuildContext context) async {
    try {
      handleLoadingWidget();
      DateTime currentDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);

      List<HikData> listHikData = [];
      WrapResponse? resData = await Api().GET('$API_HIK?tgl=$formattedDate&status=Check In', context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          for (var element in resData?.data['data']) {
            listHikData.add(HikData.fromJson(element));
          }
          listHikData.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          masukData = listHikData;
        }
      }

      masukData = listHikData;
      masukData.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
      update();
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();
      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getPulang(BuildContext context) async {
    try {
      handleLoadingWidget();
      DateTime currentDate = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);

      List<HikData> listHikData = [];
      WrapResponse? resData = await Api().GET('$API_HIK?tgl=$formattedDate&status=Check Out', context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          for (var element in resData?.data['data']) {
            listHikData.add(HikData.fromJson(element));
          }
          listHikData.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
          pulangData = listHikData;
        }
      }

      pulangData = listHikData;
      pulangData.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));
      update();
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
    await getKnowladge(context);
    await getMaintenanceData(context);
    await getNotification(context);
    await getMasuk(context);
    await getPulang(context);
  }
}
