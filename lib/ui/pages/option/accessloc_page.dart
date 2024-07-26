part of "../pages.dart";

class PermissionLocation extends StatefulWidget {
  const PermissionLocation({Key? key}) : super(key: key);

  @override
  State<PermissionLocation> createState() => _PermissionLocationState();
}

class _PermissionLocationState extends State<PermissionLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const BackgroudImage(),
            Column(
              children: [
                const SizedBox(height:20),
                Image.asset(
                  "assets/.png",
                  width: MediaQuery.of(context).size.height / 9,
                  height: MediaQuery.of(context).size.height / 9,
                ),
                const SizedBox(height:20),
                Image.asset(
                  "assets/ilustration_4.png",
                  height: MediaQuery.of(context).size.height / 3,
                ),
                // title
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.mapMarkerOutline
                            ),
                            const SizedBox(width:4,),
                            Text(
                              "Location",
                              style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold,),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // description
                        Text(
                          "This app collects location data to enable onsite attendance feature even when the app is closed or not in use. This feature allows you to submit attendance submissions with accurate position information.",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: greyColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),

                        ElevatedButton(
                          onPressed: () async {
                            bool isLocationPermissionGranted = await permission.Permission.location.isGranted;
                            if (!isLocationPermissionGranted) {
                              permission.PermissionStatus status = await permission.Permission.location.request();
                              if (status.isGranted) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
                              } else {
                                // Handle if the user does not grant location permission
                              }
                            } else {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(250, 52)),
                            backgroundColor: MaterialStateProperty.all(mainColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                          child: Text(
                            "Allow Location Access",
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}