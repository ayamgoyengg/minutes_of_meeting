part of "a_widgets.dart";

void ERROR_SNACK_BAR(String? title, String? message) {
  Get.rawSnackbar(
      message: message,
      title: title,
      snackPosition: SnackPosition.TOP,
      // backgroundColor: Colors.red[300]!,
      backgroundColor: Colors.black.withOpacity(0.5),
      isDismissible: true,
      duration: const Duration(seconds: 5));
}

void SUCCESS_SNACK_BAR(String? title, String? message) {
  Get.rawSnackbar(message: message, title: title, snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, isDismissible: true, duration: const Duration(seconds: 5));
}

// snackBars({
//   required String message,
//   int? duration,
//   bool? isDismissible,
//   bool? showProgressIndicator,
// }) async {
//   Get.rawSnackbar(
//     showProgressIndicator: showProgressIndicator ?? false,
//     dismissDirection: DismissDirection.horizontal,
//     duration: Duration(seconds: duration ?? 4),
//     message: message,
//     isDismissible: isDismissible ?? true,
//     snackPosition: SnackPosition.TOP,
//   );
// }
snackBars({
    required String message,
    int? duration,
    bool? isDismissible,
    bool? showProgressIndicator,
  }) {
    Get.snackbar("", "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: "#fcba03".toColor(),
    icon: Icon(
      MdiIcons.alertCircle,
      color: Colors.white,
    ),
    titleText: Text(
      "Caution !!",
      style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.poppins(color: Colors.white),
    ));
  }

snackBarsSuccess({
  required String message,
  int? duration,
  bool? isDismissible,
  bool? showProgressIndicator,
}) async {
  Get.snackbar("", "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: "#0bba02".toColor(),
    icon: Icon(
      MdiIcons.checkCircle,
      color: Colors.white,
    ),
    titleText: Text(
      "Yeay !!",
      style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.poppins(color: Colors.white),
    ));
}

snackBarsError({
  required String message,
  int? duration,
  bool? isDismissible,
  bool? showProgressIndicator,
}) async {
  Get.snackbar("", "",
  snackPosition: SnackPosition.BOTTOM,
    backgroundColor: "#ff1919".toColor(),
    icon: Icon(
      MdiIcons.closeCircle,
      color: Colors.white,
    ),
    titleText: Text(
      "Failed !!",
      style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.poppins(color: Colors.white),
    ));
}
