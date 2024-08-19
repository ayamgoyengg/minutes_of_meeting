part of 'shared.dart';

Color mainColor = "#ff8f56".toColor();
Color greyColor = Colors.grey;
Color bgGrey = "#D3D3D3".toColor();
Color backgroundColor = "eee".toColor();
Color secondColor = 'ffa012'.toColor();
Color thirdColor = '44a7de'.toColor();
Color forthColor = Colors.white;
Color widgetColor = 'f9f9f9'.toColor();
Color buttonColor = 'bdff00'.toColor();
Color notApprovedButton = Color.fromARGB(255, 247, 228, 65);
Color widgetBackgroundColor = 'd9d9d9'.toColor();
Color widgetBackgroundColor2 = '292929'.toColor();
Color blackColor = Colors.black;
Color whiteColor = Colors.white;
TextStyle firstStyle = GoogleFonts.poppins().copyWith(color: Colors.blue, fontSize: 10);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);

const double defaultMargin = 24;
