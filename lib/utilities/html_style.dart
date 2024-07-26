part of 'a_utilities.dart';

Html HTML_VIEW(String? data, {double? fontSize, double? wordSpace, Color? textColor, FontWeight? fontWeight, Map<String, Style>? style}) {
  return Html(data: data, style: style ?? HTML_STYLE(fontSize: fontSize, wordSpace: wordSpace, fontWeight: fontWeight, textColor: textColor));
}

Map<String, Style> HTML_STYLE({TextAlign? textAlign, double? fontSize, double? wordSpace, Color? textColor, FontWeight? fontWeight, TextOverflow? textOverflow, int? maxLines, Display? displayLi}) {
  return {
    "p": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 14),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
      maxLines: maxLines,
    ),
    "li": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 14),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      padding: HtmlPaddings.symmetric(vertical: 2, horizontal: 10),
      display: displayLi,
      textOverflow: textOverflow,
    ),
    "span": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 14),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "b": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 14),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "h1": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 30),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "h2": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 30),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "h3": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 30),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "h4": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 20),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "h5": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 26),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
    "h6": Style(
      wordSpacing: wordSpace ?? 4,
      fontFamily: GoogleFonts.lato(color: textColor ?? Colors.black).fontFamily,
      fontSize: FontSize(fontSize ?? 26),
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      padding: HtmlPaddings.all(0),
      textOverflow: textOverflow,
    ),
  };
}