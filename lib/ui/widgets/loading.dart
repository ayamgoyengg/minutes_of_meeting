part of "a_widgets.dart";

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: Align(alignment: Alignment.center, child: SpinKitPulse(size: 45, color: mainColor))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
