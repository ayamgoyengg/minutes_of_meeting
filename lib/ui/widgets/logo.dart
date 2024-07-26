part of "a_widgets.dart";

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/brainstorming.png",
      width: MediaQuery.of(context).size.height / 6,
      height: MediaQuery.of(context).size.height / 6,
    );
  }
}
