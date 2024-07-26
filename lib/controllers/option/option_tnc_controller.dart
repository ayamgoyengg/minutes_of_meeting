part of '../controllers.dart';

class OptionTncController extends GetxController {
  List<TncData>? tncData;
  Future<void> getTncData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_TNC, context);
    if (resData?.data['data'] != null) {
      List<TncData> listTncData = [];
      for (var element1 in resData?.data['data']) {
        listTncData.add(TncData.fromJson(element1));
      }
      tncData = listTncData;
      update();
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getTncData(context);
  }
}