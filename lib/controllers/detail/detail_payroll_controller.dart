part of '../controllers.dart';

class DetailPayrollController extends GetxController {
  Future<void> submit(BuildContext context, PayrollData item) async {
    WrapResponse? resData = await Api().POSTFORMDATA('$payrollAPI/${item.idPayroll}', item.toJsonSend(), context, useSnackbar: false, useToken: true);
    if (resData?.statusCode == 200) {
      snackBarsSuccess(message: 
        PRO(context).selectedCategory == "English" 
          ? "Salary data successfully loaded" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Salary data successfully loaded"
              : 'Data gaji berhasil dimuat'),
      );

      Get.offAll(() => MainPage());
    } else {
      snackBarsError(message: 
        PRO(context).selectedCategory == "English" 
          ? "Salary data failed to load" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "Salary data failed to load"
              : 'Data gaji gagal dimuat'),
      );
    }
  }
}
