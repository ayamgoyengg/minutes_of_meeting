part of "a_widgets.dart";

class Loading extends PopupRoute {
  static Loading? _currentHud;

  // show loading
  static Future<void> show({required BuildContext context}) async {
    try {
      if (_currentHud != null) {
        _currentHud?.navigator?.pop();
      }
      Loading hud = Loading();
      _currentHud = hud;
      await Navigator.push(context, hud);
    } catch (e) {
      _currentHud = null;
    }
  }

  //hide loading
  static Future<void> hide() async {
    try {
      _currentHud?.navigator?.pop();
      _currentHud = null;
    } catch (e) {
      _currentHud = null;
    }
  }

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => kThemeAnimationDuration;

  @override
  bool get barrierDismissible => false;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // print(STATE(context).sendProgress);
    return Stack(
      children: <Widget>[
        Container(color: mainColor.withOpacity(0.6)),
        Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: Container(height: 100, width: 100, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white), child: LOADING_ICON(context)))],
          ),
        ),
      ],
    );
  }

  Stack LOADING_ICON(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Padding(padding: const EdgeInsets.all(8.0), child: Align(alignment: Alignment.center, child: SpinKitPulse(size: 45, color: mainColor))),
    ]);
  }
}