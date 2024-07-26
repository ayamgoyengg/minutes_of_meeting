// part of '../pages.dart';

// class OptionForgetattendance extends StatelessWidget {
//   OptionForgetattendance({Key? key}) : super(key: key);
//   final _controllerPage = Get.put(OptionForgetattendanceController());

//   Widget backButton(String titlePage, BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       color: mainColor,
//       height: 60,
//       alignment: Alignment.center,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           InkWell(
//               // onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : Get.offAll(() => const AuthOption()),
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                   size: 14,
//                 ),
//               )),
//           const SizedBox(width: 10),
//           Text(
//             titlePage,
//             style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget modalSelectDate(BuildContext context) {
//     return GetBuilder<OptionForgetattendanceController>(
//       builder: (_) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           color: Colors.black.withOpacity(0.5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 350,
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: const [BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)],
//                 ),
//                 child: SfDateRangePicker(
//                   controller: _controllerPage.controllerDatePicker,
//                   onSelectionChanged: _controllerPage.onSelectionChanged,
//                   headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center, textStyle: Theme.of(context).textTheme.titleLarge),
//                   headerHeight: 80,
//                   selectionMode: DateRangePickerSelectionMode.single,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget formDataOvertime(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
//         child: ListView(children: [
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Employee ID" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "工号"
//                 : "ID Employee"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomTextField3(placeHolder: 
//           PRO(context).selectedCategory == "English" 
//           ? "Your employee ID" 
//           : (PRO(context).selectedCategory == "Chinese"
//               ? "您的工号"
//               : "ID employee anda"), 
//            labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerEmployeeID),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Name" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "姓名"
//                 : "Nama"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomTextField3(placeHolder: 
//           PRO(context).selectedCategory == "English" 
//             ? "Your Name" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "您的姓名"
//                 : "Nama Anda"),
//           labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerName),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Division" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "部门"
//                 : "Divisi"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomTextField3(placeHolder: 
//           PRO(context).selectedCategory == "English" 
//             ? "Your Division" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "您的部门"
//                 : "Divisi Anda"),
//           labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerDivision),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Tag Location" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "位置标签"
//                 : "Tag Lokasi"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomTextField3(placeHolder: '', labelFrom: '', readOnly: true, controllerField: _controllerPage.controllerTag, obscureText: true),
//           const SizedBox(height: 15),

//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Location" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "位置"
//                 : "Lokasi"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomTextField3(placeHolder: 
//           PRO(context).selectedCategory == "English" 
//             ? "Input your location" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "添加您的位置"
//                 : "Masukkan nama lokasi anda"),
//           labelFrom: '', controllerField: _controllerPage.controllerLokasi),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Description" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "信息"
//                 : "Keterangan"),  
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomTextField3(placeHolder: 
//           PRO(context).selectedCategory == "English" 
//             ? "Input your description" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "添加您的信息"
//                 : "Masukkan keterangan anda"),
//           labelFrom: '', controllerField: _controllerPage.controllerKeterangan),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Date" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "日期"
//                 : "Tanggal"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           CustomDateField(
//             placeHolder: 'DD/MM/YY',
//             labelFrom: '',
//             readOnly: true,
//             customFunction2: _controllerPage.handleShowModal,
//             controllerField: _controllerPage.controllerTanggal,
//             suffixIcon: Icon(Icons.calendar_month),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Time" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "时间"
//                 : "Jam"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
//                 ),
//                 child: TextFormField(
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
//                   keyboardType: TextInputType.numberWithOptions(decimal: false),
//                   inputFormatters: <TextInputFormatter>[TimeTextInputFormatter(exp: RegExp(r'^[0-9:]+$'))], // This input formatter will do the job
//                   controller: _controllerPage.controllerTime,
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     focusColor: Colors.white,
//                     hoverColor: Colors.white,
//                     hintText: '00:00:00',
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//                     hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: greyColor),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: const BorderSide(color: Colors.transparent, width: 0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: const BorderSide(color: Colors.transparent, width: 0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Text(
//             PRO(context).selectedCategory == "English" 
//             ? "Status" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "现状"
//                 : "Status"),
//             style: blackFontStyle2.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
//           // Container(
//           //   width: double.infinity,
//           //   margin: const EdgeInsets.only(top: 10),
//           //   padding: EdgeInsets.symmetric(horizontal: 10),
//           //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black)),
//           //   child: DropdownButton<String>(
//           //     value: _controllerPage.selectedStatus,
//           //     isExpanded: true,
//           //     underline: const SizedBox(),
//           //     items: _controllerPage.statusOption
//           //         .map((e) => DropdownMenuItem(
//           //             value: e,
//           //             child: Text(
//           //               e,
//           //               style: blackFontStyle3,
//           //             )))
//           //         .toList(),
//           //     onChanged: (item) {
//           //       _controllerPage.handleSelectedStatus(item!);
//           //     },
//           //   ),
//           // ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 15),
//                 height: 45,
//                 width: 120,
//                 child: ElevatedButton(
//                   onPressed: () => _controllerPage.handleButtonStatus('Check In'),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(_controllerPage.selectedStatus == 'Check In' ? "#5667FD".toColor() : Colors.grey),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ))),
//                   child: Text('Check In', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 15),
//                 height: 45,
//                 width: 120,
//                 child: ElevatedButton(
//                   onPressed: () => _controllerPage.handleButtonStatus('Check Out'),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(_controllerPage.selectedStatus == 'Check Out' ? "#5667FD".toColor() : Colors.grey),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ))),
//                   child: Text('Check Out', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//         ]),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 
//       PRO(context).selectedCategory == "English" 
//             ? "Attendance Submission" 
//             : (PRO(context).selectedCategory == "Chinese"
//                 ? "申请上班"
//                 : "Pengajuan Kehadiran"),
//       home: RefreshIndicator(
//         onRefresh: () async {
//           await _controllerPage.initPage(context);
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             backgroundColor: mainColor,
//             title: Text(
//               PRO(context).selectedCategory == "English" 
//               ? "Attendance Submission" 
//               : (PRO(context).selectedCategory == "Chinese"
//                   ? "申请上班"
//                   : "Pengajuan Kehadiran"),
//             ),
//             systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
//           ),
//           body: GetBuilder<OptionForgetattendanceController>(
//             initState: (state) async => await _controllerPage.initPage(context),
//             builder: (_) {
//               return Stack(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       formDataOvertime(context),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         width: double.infinity,
//                         child: ElevatedButton(
//                             onPressed: () async => await _controllerPage.submit(context),
//                             style: ButtonStyle(
//                               minimumSize: MaterialStateProperty.all(const Size(100, 40)),
//                               backgroundColor: MaterialStateProperty.all(mainColor),
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
//                             ),
//                             child: Text(
//                               PRO(context).selectedCategory == "English" 
//                               ? "Send" 
//                               : (PRO(context).selectedCategory == "Chinese"
//                                   ? "发送"
//                                   : "Kirim"),
//                               style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900))),
//                       ),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                   _controllerPage.showModal == true ? modalSelectDate(context) : Container(),
//                   _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
