part of "../pages.dart";

class AuthForgotPassword extends StatelessWidget {
  AuthForgotPassword({Key? key}) : super(key: key);

  final _controllerPage = Get.put(AuthForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.canPop(context)
            ? Navigator.pop(context)
            : Get.offAll(() => SignInPage());
        return true;
      },
      child: GetBuilder<AuthForgotPasswordController>(
        builder: (_) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Color(0xFFEEEEEE),
            appBar: AppBar(
              automaticallyImplyLeading: false, // Disable default back button
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(60))),
              toolbarHeight: 200,
              backgroundColor: Color(0xFFFF8F56),
              title: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Text("Forgot ur password?",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontSize: 25)),
                      Text("We’ll send you reset instructions.",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w300,
                              fontSize: 12))
                    ],
                  ),
                ),
                color: Color(0xFFFF8F56),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical:20),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 30, bottom: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          CustomTextField(
                              placeHolder: "Fill this with your email",
                              keyboardType: TextInputType.emailAddress,
                              controllerField: _controllerPage.emailField),
                          const SizedBox(height: 10),

                          Text(
                            "*Please input ur registered email",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontWeight: FontWeight.w900),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),

                          // BUTTON
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () =>
                                    _controllerPage.submit(context),
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(145, 52)),
                                  backgroundColor:
                                      MaterialStateProperty.all(mainColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Send",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                )),
                          ),
                          const SizedBox(height: 10),
                          if (_controllerPage.showStatusSend == true)
                            Center(
                              child: Text(
                                "Please check your email",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: greyColor,
                                        fontWeight: FontWeight.w900),
                              ),
                            ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () => Navigator.canPop(context)
                                    ? Navigator.pop(context)
                                    : () {},
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(145, 52)),
                                  backgroundColor:
                                      MaterialStateProperty.all(greyColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.chevron_left, size: 25, color: Colors.black38),
                                    Text(
                                      "Back to Log In",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _controllerPage.loadingWidget == true
                    ? const LoadingWidget()
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
