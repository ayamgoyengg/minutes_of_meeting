part of '../controllers.dart';

class OptionContactController extends GetxController {
  ContactData? contactData;
  Future<void> getContactData(BuildContext context) async {
    WrapResponse? resData = await Api().GET(API_KONTAK, context);
    if (resData?.data['data'] != null) {
      List<ContactData> listContactData = [];
      for (var element1 in resData?.data['data']) {
        listContactData.add(ContactData.fromJson(element1));
      }
      print(resData?.data);
      contactData = listContactData.isEmpty ? null : listContactData[0];
      update();
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getContactData(context);
  }
}