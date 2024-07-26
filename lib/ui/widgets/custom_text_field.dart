part of "a_widgets.dart";

class CustomTextField extends StatefulWidget {
  final String? placeHolder;
  final int? maxLine;
  final bool? obscureText;
  final TextEditingController? controllerField;
  final VoidCallback? customFunction1;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final VoidCallback? customFunction2;

  const CustomTextField({
    Key? key,
    this.placeHolder,
    this.maxLine,
    this.obscureText,
    this.controllerField,
    this.customFunction1,
    this.customFunction2,
    this.keyboardType,
    this.readOnly,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.customFunction2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(spreadRadius: 2, blurRadius: 15, color: Colors.black12)],
        ),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900, color: Colors.black),
          maxLines: widget.maxLine ?? 1,
          obscureText: widget.obscureText ?? false,
          controller: widget.controllerField,
          readOnly: widget.readOnly ?? false,
          onTap: widget.customFunction2,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText == null
                ? null
                : IconButton(
                    icon: Icon(
                      widget.obscureText! ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: widget.customFunction1,
                  ),
            fillColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            hintText: widget.placeHolder,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900, color: greyColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField1 extends StatefulWidget {
  final String? placeHolder;
  final int? maxLine;
  final bool? obscureText;
  final TextEditingController? controllerField;
  final VoidCallback? customFunction1;
  final Function? onChangedFunction;
  final TextInputType? keyboardType;

  const CustomTextField1({Key? key, this.placeHolder, this.maxLine, this.obscureText, this.controllerField, this.customFunction1, this.onChangedFunction, this.keyboardType}) : super(key: key);

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(spreadRadius: 2, blurRadius: 15, color: Colors.black12)],
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
        maxLines: widget.maxLine ?? 1,
        obscureText: widget.obscureText ?? false,
        controller: widget.controllerField,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          if (widget.onChangedFunction != null) widget.onChangedFunction!(value);
        },
        decoration: InputDecoration(
          suffixIcon: widget.obscureText == null
              ? null
              : IconButton(
                  icon: Icon(
                    widget.obscureText! ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: widget.customFunction1,
                ),
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintText: widget.placeHolder,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatefulWidget {
  final String placeHolder;
  final int? maxLine;
  final bool? obscureText;
  final TextEditingController? controllerField;
  final VoidCallback? customFunction1;
  final TextInputType? keyboardType;
  const CustomTextField2({Key? key, required this.placeHolder, this.maxLine, this.obscureText, this.controllerField, this.customFunction1, this.keyboardType}) : super(key: key);

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(spreadRadius: 2, blurRadius: 15, color: Colors.black12)],
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
        maxLines: widget.maxLine ?? 1,
        keyboardType: widget.keyboardType,
        controller: widget.controllerField,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintText: widget.placeHolder,
          prefixIcon: Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
      ),
    );
  }
}

class CustomTextField3 extends StatefulWidget {
  final String placeHolder;
  final String labelFrom;
  final int? maxLine;
  final bool? obscureText;
  final TextEditingController? controllerField;
  final VoidCallback? customFunction1;
  final TextInputType? keyboardType;
  final bool? readOnly;

  const CustomTextField3({Key? key, required this.placeHolder, required this.labelFrom, this.maxLine, this.obscureText, this.controllerField, this.customFunction1, this.keyboardType, this.readOnly})
      : super(key: key);

  @override
  State<CustomTextField3> createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelFrom == '' ? Container() : Text(widget.labelFrom, style: blackFontStyle1.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
          ),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
            keyboardType: widget.keyboardType,
            controller: widget.controllerField,
            readOnly: widget.readOnly ?? false,
            obscureText: widget.obscureText ?? false,
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,
              hintText: widget.placeHolder,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDateField extends StatefulWidget {
  final String placeHolder;
  final String labelFrom;
  final int? maxLine;
  final bool? obscureText;
  final TextEditingController? controllerField;
  final VoidCallback? customFunction1;
  final VoidCallback? customFunction2;
  final Icon? suffixIcon;

  final TextInputType? keyboardType;
  final bool? readOnly;

  const CustomDateField(
      {Key? key,
      required this.placeHolder,
      required this.labelFrom,
      this.maxLine,
      this.obscureText,
      this.controllerField,
      this.customFunction1,
      this.customFunction2,
      this.keyboardType,
      this.readOnly,
      this.suffixIcon})
      : super(key: key);

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.customFunction2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelFrom == '' ? Container() : Text(widget.labelFrom, style: blackFontStyle1.copyWith(color: Colors.black, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
            ),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
              keyboardType: widget.keyboardType,
              controller: widget.controllerField,
              readOnly: widget.readOnly ?? false,
              onTap: widget.customFunction2,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                hintText: widget.placeHolder,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.transparent, width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.transparent, width: 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
