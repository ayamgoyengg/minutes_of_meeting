part of '../controllers.dart';

class OptionWarnletterController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  List<WarnletterData> warnletterData = [];
  ScrollController controllerWarnletterData = ScrollController();

  Future<void> getWarnletter(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_WARNLETTER, context, useSnackbar: false, useToken: true);
      print(resData?.toJson());
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<WarnletterData> listWarnletterData = [];
          for (var element1 in resData?.data['data']) {
            listWarnletterData.add(WarnletterData.fromJson(element1));
          }
          listWarnletterData.sort((a, b) {
            DateTime date1 = DateTime.fromMillisecondsSinceEpoch(a.updatedAt! * 1000);
            DateTime date2 = DateTime.fromMillisecondsSinceEpoch(b.updatedAt! * 1000);
            // date1 => 2022-10-10 16:43:43.000
            // birthday  => 2022-12-31
            return date1.compareTo(date2);
          });
          warnletterData = listWarnletterData;
          update();
          print(resData?.toJson().toString());
        }
      } else {}
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();

      snackBarsError(message: 'Something wrong $e');
      print('$e');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getWarnletter(context);
  }
}
