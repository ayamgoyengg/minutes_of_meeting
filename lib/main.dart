import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:upgrader/upgrader.dart';
import 'package:minutes_of_meeting/controllers/controllers.dart';
import 'package:minutes_of_meeting/ui/widgets/a_widgets.dart';

// import 'cubit/cubit.dart';
import 'ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalController>(create: (_) => GlobalController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: UpgradeAlert(
        upgrader: Upgrader(dialogStyle: UpgradeDialogStyle.cupertino),
        child: const SplashScreen()
      ),
      onReady: () async {
        await Future.delayed(const Duration(seconds: 1));
        await PRO(context).readLocalUser();
        await Future.microtask(
          () async {
            await STARTING(context: context);
          },
        );
      },
    );
  }
}

Future<void> STARTING({bool isLock = true, required BuildContext context}) async {
  PermissionStatus status = await Permission.location.status;
  if (PRO(context).userData != null) {
    // await PRO(context).getFavoriteData(context);
    Get.offAll(() => MainPage());
  } else {
    if (status.isGranted) {
      Get.offAll(() => SignInPage());
    } else {
      Get.offAll(() => SignInPage());
    }
  }
}
