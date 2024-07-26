part of '../controllers.dart';

class OptionInventoryController extends GetxController {
  bool loadingWidget = false;

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }
  List<InventoryData> inventoryData = [];

  Future<void> getInventory(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api().GET(API_INVENTORY, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<InventoryData> listInventoryData = [];
          for (var element1 in resData?.data['data']) {
            listInventoryData.add(InventoryData.fromJson(element1));
          }
          inventoryData = listInventoryData;
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
    await getInventory(context);
  }
}
