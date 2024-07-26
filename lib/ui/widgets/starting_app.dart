part of "a_widgets.dart";

class StartingApp extends StatefulWidget {
  const StartingApp({Key? key}) : super(key: key);

  @override
  State<StartingApp> createState() => _StartingAppState();
}

class _StartingAppState extends State<StartingApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Widget child = const SplashScreen();

  @override
  void initState() {
    super.initState();
  }

  // Future<void> initialization(BuildContext context) async {
  //   await Future.delayed(const Duration(seconds: 10));
  //   Get.offAll(() => SignInPage());

  // final SharedPreferences prefs = await _prefs;
  // final bool? repeat = prefs.getBool('repeat');
  // if (repeat != null) {
  //   if (repeat == true) {
  //     // aplikasi sudah pernah dibuka
  //     Get.offAll(() => SignInPage());
  //   } else if (repeat == false) {
  //     // aplikasi belum pernah dibuka
  //     Get.offAll(() => SignInPage());
  //   }
  // } else {
  //   // aplikasi belum pernah dibuka => jika null
  //   Get.offAll(() => SignInPage());
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FutureBuilder(
      //   future: initialization(context),
      //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      //     return child;
      //   },
      // ),
      body: child,
    );
  }
}
