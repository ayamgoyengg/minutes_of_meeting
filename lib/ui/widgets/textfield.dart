part of "a_widgets.dart";

TextField TEXT_FIELD(
  TextEditingController? editingController, {
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? hint,
  FocusNode? focusNode,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  bool obscureText = false,
}) {
  return TextField(
    obscureText: obscureText,
    obscuringCharacter: '•',
    onSubmitted: onSubmitted,
    focusNode: focusNode,
    onChanged: onChanged,
    style: Get.textTheme.bodyText1,
    controller: editingController,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontFamily: "MavenPro",
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    ),
  );
}

Widget ERROR_VALIDATION_FIELD(String? errorText,
    {double? textWidth, bool useOverFlow = true}) {
  if (errorText == null) {
    return Container();
  } else {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(255, 255, 255, 0.19)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: textWidth ?? (Get.width / 1.5),
                  child: Text(
                    errorText,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.red),
                  ),
                ),
                Icon(
                  Icons.disabled_by_default_outlined,
                  color: Colors.white,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget SUCCESS_VALIDATION_FIELD(String? successText) {
  if (successText == null) {
    return Container();
  } else {
    return Builder(builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.green[400]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width / 1.5,
                child: Text(
                  successText,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
              Icon(
                Icons.check_circle_outline_sharp,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
    });
  }
}
