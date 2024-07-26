part of '../controllers.dart';

class AnnualController extends GetxController {
  List<EmpovertimeData> empovertimeData = [];
  List<PermissionData> permissionData = [];
  List<InventoryrequestData> inventoryrequestData = [];
  List<ForgetattendanceData> forgetattendanceData = [];

  Future<void> getEmpovertimeData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(empovertimeAPI, context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<EmpovertimeData> listEmpovertimeData = [];
          for (var element1 in resData?.data['data']) {
            listEmpovertimeData.add(EmpovertimeData.fromJson(element1));
          }
          listEmpovertimeData.sort((a, b) => (b.idEmpovertime ?? 0).compareTo(a.idEmpovertime ?? 0));
          empovertimeData = listEmpovertimeData;
          update();
        }
        // snackBarsSuccess(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      } else {
        // snackBarsError(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      }
    } catch (e) {
      // snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getPermissionData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(permissionAPI, context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<PermissionData> listPermissionData = [];
          for (var element1 in resData?.data['data']) {
            listPermissionData.add(PermissionData.fromJson(element1));
          }
          listPermissionData.sort((a, b) => (b.idPermission ?? 0).compareTo(a.idPermission ?? 0));
          permissionData = listPermissionData;
          update();
        }
        // snackBarsSuccess(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      } else {
        // snackBarsError(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      }
    } catch (e) {
      // snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getInventoryrequestData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(inventoryrequestAPI, context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<InventoryrequestData> listInventoryrequestData = [];
          for (var element1 in resData?.data['data']) {
            listInventoryrequestData.add(InventoryrequestData.fromJson(element1));
          }
          listInventoryrequestData.sort((a, b) => (b.idInventoryrequest ?? 0).compareTo(a.idInventoryrequest ?? 0));
          inventoryrequestData = listInventoryrequestData;
          update();
        }
        // snackBarsSuccess(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      } else {
        // snackBarsError(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      }
    } catch (e) {
      // snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> getForgetattendanceData(BuildContext context) async {
    try {
      WrapResponse? resData = await Api().GET(forgetattendanceAPI, context, useSnackbar: false, useToken: true, useLoading: false);
      log(resData?.statusCode.toString() ?? '');
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<ForgetattendanceData> listForgetattendanceData = [];
          for (var element1 in resData?.data['data']) {
            listForgetattendanceData.add(ForgetattendanceData.fromJson(element1));
          }
          listForgetattendanceData.sort((a, b) => (b.idForgetattendance ?? 0).compareTo(a.idForgetattendance ?? 0));
          forgetattendanceData = listForgetattendanceData;
          update();
        }
        // snackBarsSuccess(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      } else {
        // snackBarsError(message: "${resData?.metaData?.message ?? 'Berhasil'}");
      }
    } catch (e) {
      // snackBarsError(message: 'Something wrong $e');
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getEmpovertimeData(context);
    await getPermissionData(context);
    await getInventoryrequestData(context);
    await getForgetattendanceData(context);
  }
}
