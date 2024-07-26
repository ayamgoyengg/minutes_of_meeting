part of "a_widgets.dart";

class BackgroudImage extends StatelessWidget {
  const BackgroudImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/background_1.png",
      fit: BoxFit.fitWidth,
      width: MediaQuery.of(context).size.width,
      // height: 190,
    );
  }
}
