part of "a_widgets.dart";

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo.png",
      width: MediaQuery.of(context).size.height / 5,
      height: MediaQuery.of(context).size.height / 5,
    );
  }
}
