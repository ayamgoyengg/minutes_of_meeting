part of '../controllers.dart';

class OptionKnowladgeController extends GetxController {
  bool loadingWidget = false;
  final _knowladgeData = RxList<KnowladgeData>([]);
  final _loadingWidget = true.obs;
  final _searchedData = <KnowladgeData>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }
  List<KnowladgeData> knowladgeData = [];

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

      snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getKnowladge(context);
  }
}
