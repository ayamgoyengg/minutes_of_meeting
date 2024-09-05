part of '../pages.dart';

class SignInPage extends StatelessWidget {
  // bool isLoading = false;
  final _controllerPage = Get.put(AuthSignInController());

  SignInPage({super.key});

  Widget formDataOvertime(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(children: [
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 6),
            child: const Text("Email",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: _controllerPage.emailField,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: const Text("Password",
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)),
            child: TextField(
              obscureText: _controllerPage.obsecureText,
              controller: _controllerPage.passwodField,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(_controllerPage.obsecureText
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: _controllerPage.toggleObsecureText,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: GestureDetector(
                onTap: () {
                  Get.to(AuthForgotPassword());
                },
                child: Text("Forgot Password?",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: _controllerPage.checkTnC,
                      onChanged: (bool? value) => _controllerPage.handleTnc(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("I understand and agree",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        GestureDetector(
                          onTap: () => Get.to(() => ProfileSyaratKetentuan()),
                          child: const Text("Terms and Conditions",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF8F56))),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 14),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () async => await _controllerPage.submit(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  _controllerPage.loadingWidget == true
                      ? Center(child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                      : Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      title: "Sign In",
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xFFEEEEEE),
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(60))),
            toolbarHeight: 200,
            backgroundColor: mainColor,
            title: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text("Get into your account!",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 25)),
                    Text("Log in filling form below to continue",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                            fontSize: 12))
                  ],
                ),
              ),
            ),
          ),
          body: GetBuilder<AuthSignInController>(
            initState: (state) async {
              await _controllerPage.initPage(context);
            },
            builder: (_) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      formDataOvertime(context),
                      Column(
                        children: [
                          Center(
                            child: Text(
                                "Ver ${_controllerPage.appVersion}",
                                style: blackFontStyle2.copyWith(fontSize: 10)),
                          ),
                          Center(
                            child: Text("© 2024 Maxiidea",
                                style: blackFontStyle2.copyWith(fontSize: 10)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
