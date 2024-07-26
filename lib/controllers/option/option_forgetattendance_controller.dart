// part of '../controllers.dart';

// class OptionForgetattendanceController extends GetxController {
//   TextEditingController controllerEmployeeID = TextEditingController();
//   TextEditingController controllerTime = TextEditingController();
//   TextEditingController controllerName = TextEditingController();
//   TextEditingController controllerDivision = TextEditingController();
//   TextEditingController controllerTag = TextEditingController();
//   TextEditingController controllerLokasi = TextEditingController();
//   TextEditingController controllerKeterangan = TextEditingController();

//   String? selectedStatus;
//   String statusController = '';
//   Location location = new Location();

//   List<String> statusOption = ['Check In', 'Check Out'];
//   List<ForgetattendanceData> forgetattendancesData = [];

//   void handleSelectedStatus(String item) {
//     selectedStatus = item;
//     update();
//   }

//   void handleButtonStatus(String status) {
//     selectedStatus = status;
//     update();
//   }

//   // modal Date
//   bool showModal = false;
//   String selectedDate = '';
//   TextEditingController controllerTanggal = TextEditingController();
//   DateRangePickerController controllerDatePicker = DateRangePickerController();

//   void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       selectedDate = args.value.toString();
//       controllerTanggal.text = args.value.toString().split(' ')[0];
//       showModal = false;
//       update();
//     }
//   }

//   void handleShowModal() {
//     showModal = true;
//     update();
//   }
//   // end modal Date

//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;
//     LocationData locationData;

//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }

//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     locationData = await location.getLocation();

//     // Set the controller text with the longitude and latitude values
//     controllerTag.text = '${locationData.latitude}, ${locationData.longitude}';
//   }

//   bool validation(BuildContext context) {
//     if (controllerEmployeeID.text == '' ||
//         controllerTanggal.text == '' ||
//         controllerTime.text == '' ||
//         controllerName.text == '' ||
//         controllerDivision.text == '' ||
//         controllerTag.text == '' ||
//         controllerLokasi.text == '' ||
//         controllerKeterangan.text == '' ||
//         selectedStatus == '' ||
//         selectedStatus == null) {
//       snackBars(message: 
//         PRO(context).selectedCategory == "English" 
//           ? "Please complete the form above" 
//           : (PRO(context).selectedCategory == "Chinese"
//               ? "Please complete the form above"
//               : 'Tolong lengkapi form di atas'),
//       );
//       return false;
//     }
//     return true;
//   }

//   bool loadingWidget = false;

//   void handleLoadingWidget() {
//     loadingWidget = !loadingWidget;
//     update();
//   }

//   // submit
//   Future<void> submit(BuildContext context) async {
//     bool conditionJam = isValidTime(controllerTime.text);
//     if (conditionJam == false) {
//       snackBars(message: 
//       PRO(context).selectedCategory == "English" 
//           ? "Please enter the time correctly, such as 08:00:00" 
//           : (PRO(context).selectedCategory == "Chinese"
//               ? "Please enter the time correctly, such as 08:00:00"
//               : 'Harap memasukkan waktu dengan benar, seperti 08:00:00'),
//       );
//       return;
//     }
//     if (validation(context) == false) {
//       return;
//     }
//     handleLoadingWidget();
//     ForgetattendanceData data = ForgetattendanceData(
//         employeeId: controllerEmployeeID.text.toString(),
//         division: controllerDivision.text,
//         tgl: controllerTanggal.text,
//         time: controllerTime.text,
//         name: controllerName.text,
//         status: selectedStatus,
//         tag: controllerTag.text,
//         lokasi: controllerLokasi.text,
//         keterangan: controllerKeterangan.text);

//     WrapResponse? resData = await Api().POSTFORMDATA('$forgetattendanceAPI/tambah', data.toJsonSend(), context, useSnackbar: false, useToken: true);
//     if (resData?.statusCode == 200) {
//       snackBarsSuccess(message: 
//         PRO(context).selectedCategory == "English" 
//             ? "Successful Absence Submission" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "Successful Absence Submission"
//                 : 'Pengajuan Absen Berhasil'),
//       );

//       Get.offAll(() => MainPage());
//     } else {
//       snackBarsError(message: 
//         PRO(context).selectedCategory == "English" 
//           ? "Failed Absence Submission" 
//           : (PRO(context).selectedCategory == "Chinese"
//               ? "Failed Absence Submission"
//               : 'Pengajuan Absen Gagal'),
//       );
//     }
//   }

//   bool conditionGetAPI = false;
//   Future<void> getUserData(BuildContext context) async {
//     WrapResponse? resData = await Api().GET(API_USER, context, useToken: true, useSnackbar: false);
//     try {
//       if (resData?.data != null) {
//         UserData? userData = UserData.fromJson(resData?.data);
//         userData.token = PRO(context).userData?.token;
//         controllerEmployeeID.text = userData.employeeId.toString() ?? '';
//         controllerDivision.text = userData.personGroup.toString() ?? '';
//         controllerName.text = userData.name.toString() ?? '';
//         await PRO(context).saveLocalUser(userData);
//         conditionGetAPI = true;
//         update;
//       } else {
//         conditionGetAPI = false;
//         controllerEmployeeID.text = '';
//         controllerDivision.text = '';
//         controllerName.text = '';
//         update;
//         ERROR_SNACK_BAR("Perhatian", "Tidak bisa mendapatkan data terbaru user");
//       }
//     } catch (e) {
//       log('${e.toString()} line 68');
//     }
//   }

//   Future<void> initPage(BuildContext context) async {
//     await getUserData(context);
//     await _getCurrentLocation();
//   }
// }
