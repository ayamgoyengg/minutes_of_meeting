part of '../controllers.dart';

class OptionNotificationController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }
  List<NotificationData> notificationData = [];
  List<NotificationData> notificationData1 = [];
  List<NotificationData> notificationData2 = [];
  List<NotificationData> notificationData3 = [];
  List<NotificationData> notificationData4 = [];

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



  Future<void> initPage(BuildContext context) async {
    await getNotification(context);
  }
}
