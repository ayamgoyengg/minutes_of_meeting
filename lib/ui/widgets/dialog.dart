part of "a_widgets.dart";

Widget dialogFilterDestination({
  required BuildContext context,
  required bool conditionShow,
  required TextEditingController namaKota,
  required TextEditingController batasHargaMin,
  required TextEditingController batasHargaMax,
  required TextEditingController ratingMin,
  required TextEditingController ratingMax,
  required String stringNamaKotaFilter,
  required String stringKapasitasHargaFilter,
  required String stringRatingFilter,
  required bool checkBoxNamaKota,
  required bool checkBoxBatasHarga,
  required bool checkBoxRating,
  required Function handleCheckBox,
  required VoidCallback handleTelusuri,
  required VoidCallback handleShow,
  required Function parent,
}) {
  if (conditionShow == false) {
    return Container();
  }
  return parent(
    childCustom: AlertDialog(
      backgroundColor: mainColor,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Nama Kota', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            //     Checkbox(value: checkBoxNamaKota, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringNamaKotaFilter)),
            //   ],
            // ),
            // const SizedBox(height: 5),
            // CustomTextField1(placeHolder: 'Masukkan Nama Kota', controllerField: namaKota),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Batas Harga', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                Checkbox(value: checkBoxBatasHarga, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringKapasitasHargaFilter)),
              ],
            ),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Minimal', keyboardType: TextInputType.number, controllerField: batasHargaMin),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Maksimal', keyboardType: TextInputType.number, controllerField: batasHargaMax),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rating', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                Checkbox(value: checkBoxRating, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringRatingFilter)),
              ],
            ),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Minimal', keyboardType: TextInputType.number, controllerField: ratingMin),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Maksimal', keyboardType: TextInputType.number, controllerField: ratingMax),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1, style: BorderStyle.solid), borderRadius: BorderRadius.circular(5))),
            ),
            onPressed: handleShow,
            child: const Text('Tutup', style: TextStyle(color: Colors.white))),
        TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)), onPressed: handleTelusuri, child: const Text('Telusuri', style: TextStyle(color: Colors.black))),
      ],
    ),
  );
}

Widget dialogFilterDestination2({
  required BuildContext context,
  required bool conditionShow,
  required TextEditingController namaKota,
  required TextEditingController batasHargaMin,
  required TextEditingController batasHargaMax,
  required TextEditingController ratingMin,
  required TextEditingController ratingMax,
  required String stringNamaKotaFilter,
  required String stringKapasitasHargaFilter,
  required String stringRatingFilter,
  required bool checkBoxNamaKota,
  required bool checkBoxBatasHarga,
  required bool checkBoxRating,
  required Function handleCheckBox,
  required VoidCallback handleTelusuri,
  required VoidCallback handleShow,
  required Function parent,
}) {
  if (conditionShow == false) {
    return Container();
  }
  return parent(
    childCustom: AlertDialog(
      backgroundColor: mainColor,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nama Kota', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                Checkbox(value: checkBoxNamaKota, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringNamaKotaFilter)),
              ],
            ),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Masukkan Nama Kota', controllerField: namaKota),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Batas Harga', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                Checkbox(value: checkBoxBatasHarga, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringKapasitasHargaFilter)),
              ],
            ),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Minimal', keyboardType: TextInputType.number, controllerField: batasHargaMin),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Maksimal', keyboardType: TextInputType.number, controllerField: batasHargaMax),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rating', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                Checkbox(value: checkBoxRating, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringRatingFilter)),
              ],
            ),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Minimal', keyboardType: TextInputType.number, controllerField: ratingMin),
            const SizedBox(height: 5),
            CustomTextField1(placeHolder: 'Maksimal', keyboardType: TextInputType.number, controllerField: ratingMax),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1, style: BorderStyle.solid), borderRadius: BorderRadius.circular(5))),
            ),
            onPressed: handleShow,
            child: const Text('Tutup', style: TextStyle(color: Colors.white))),
        TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)), onPressed: handleTelusuri, child: const Text('Telusuri', style: TextStyle(color: Colors.black))),
      ],
    ),
  );
}

Widget dialogFilterTransportation({
  required BuildContext context,
  required bool conditionShow,
  required TextEditingController namaTransportasi,
  required TextEditingController kapasitasPenumpang,
  required TextEditingController batasHargaMin,
  required TextEditingController batasHargaMax,
  required bool checkBoxNamaTransportasi,
  required bool checkBoxKapasitasPenumpang,
  required bool checkBoxHarga,
  required String stringNamaTransportasi,
  required String stringKapasitasPenumpang,
  required String stringKapasitasHarga,
  required Function handleCheckBox,
  required VoidCallback handleTelusuri,
  required VoidCallback handleShow,
  required Function parent,
}) {
  if (conditionShow == false) {
    return Container();
  } else {
    return parent(
      childCustom: AlertDialog(
        backgroundColor: mainColor,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Nama Transportasi', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
              //     Checkbox(value: checkBoxNamaTransportasi, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringNamaTransportasi))
              //   ],
              // ),
              // const SizedBox(height: 5),
              // CustomTextField1(placeHolder: 'Masukkan nama transportasi', controllerField: namaTransportasi),
              // const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Kapasitas Penumpang', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
              //     Checkbox(value: checkBoxKapasitasPenumpang, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringKapasitasPenumpang)),
              //   ],
              // ),
              // const SizedBox(height: 5),
              // CustomTextField1(placeHolder: 'Masukkan kapasitas penumpang', keyboardType: TextInputType.number, controllerField: kapasitasPenumpang),
              // const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Batas Harga', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  Checkbox(value: checkBoxHarga, side: BorderSide(color: Colors.white), activeColor: Colors.yellow, onChanged: (value) => handleCheckBox(stringKapasitasHarga)),
                ],
              ),
              const SizedBox(height: 5),
              CustomTextField1(placeHolder: 'Min', keyboardType: TextInputType.number, controllerField: batasHargaMin),
              const SizedBox(height: 5),
              CustomTextField1(placeHolder: 'Max', keyboardType: TextInputType.number, controllerField: batasHargaMax),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1, style: BorderStyle.solid), borderRadius: BorderRadius.circular(5))),
              ),
              onPressed: handleShow,
              child: const Text('Tutup', style: TextStyle(color: Colors.white))),
          TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)), onPressed: handleTelusuri, child: const Text('Telusuri', style: TextStyle(color: Colors.black))),
        ],
      ),
    );
  }
}
