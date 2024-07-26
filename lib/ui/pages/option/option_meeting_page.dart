part of "../pages.dart";

class OptionMeeting extends StatelessWidget {
  OptionMeeting({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionMeetingController());

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 60,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 14,
                ),
              )),
          const SizedBox(width: 10),
          Text(
            titlePage,
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget listMeeting1(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(now);
    return GetBuilder<OptionMeetingController>(builder: (_) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical:20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:  (MediaQuery.of(context).size.width - 225),
                  child: Text(
                    PRO(context).selectedCategory == "English" 
                    ? "Your meeting schedule today" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "您今天的会议安排"
                        : "Jadwal meeting anda hari ini"),
                    style:blackFontStyle1.copyWith(color:mainColor,fontSize:15, fontWeight: FontWeight.w700), maxLines:2)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:5, vertical:5),
                  decoration: BoxDecoration(
                    color: "#9193ff".toColor(),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    children: [
                      Text(formattedDate,style: blackFontStyle3.copyWith(color: Colors.white, fontSize:12 ),),
                      SizedBox(width:2),
                      Container(
                        width:20,
                        height:20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:"#0003ad".toColor(),
                        ),
                        child: Center(child: Text(_controllerPage.meetingDataAll?.length.toString() ?? "0", style: blackFontStyle3.copyWith(color:Colors.white),))
                      ),
                    ],
                  )
                )
              ],
            ),
            SizedBox(height:10),
            Container(
              height:80,
              width:double.infinity,
              padding: EdgeInsets.symmetric(horizontal:5, vertical:5),
              decoration: BoxDecoration(
                color: "#eee".toColor(),
                borderRadius: BorderRadius.circular(9),
              ),
              child:ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor: MaterialStateProperty.all<Color>(mainColor),
                  trackColor: MaterialStateProperty.all<Color>(Colors.white),
                  trackBorderColor: MaterialStateProperty.all<Color>(mainColor),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  showTrackOnHover: true,
                  thickness: 8,
                  radius: Radius.circular(10),
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: 
                     _controllerPage.meetingDataAll == null
                    ? []
                    : _controllerPage.meetingDataAll!.isEmpty
                        ? []
                        : _controllerPage.meetingDataAll!.map((element1) {
                            return itemMeetingToday(element1, context);
                          }).toList(),
                    
                  ),
                ),
              )
            )
          ]
        )
      );
    });
  }
  
  Widget listMeeting2(BuildContext context) {
    return GetBuilder<OptionMeetingController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           _controllerPage.meetingDivisiData!.isEmpty
            ? Container()
            : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                PRO(context).selectedCategory == "English" 
                    ? "Division Meeting" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "部门会议"
                        : "Meeting Divisi"),
                style:blackFontStyle2.copyWith(color: mainColor, fontWeight: FontWeight.w700))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: _controllerPage.meetingDivisiData == null
                    ? []
                    : _controllerPage.meetingDivisiData!.isEmpty
                        ? []
                        : _controllerPage.meetingDivisiData!.map((element1) {
                            return itemMeeting(element1, context);
                          }).toList(),
              ),
              // child: ListView.builder(
              //     itemCount: listItemOptionOpenTrip.length,
              //     itemBuilder: (BuildContext context, index) {
              //       return itemMeeting(listItemOptionOpenTrip[index]);
              //     }),
            ),
          ),
        ],
      );
    });
  }

  Widget listMeeting3(BuildContext context) {
    return GetBuilder<OptionMeetingController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _controllerPage.meetingUserData!.isEmpty
            ? Container()
            : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                PRO(context).selectedCategory == "English" 
                    ? "Special Meeting" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "特殊会议"
                        : "Meeting Khusus"),
                style:blackFontStyle2.copyWith(color: mainColor, fontWeight: FontWeight.w700))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: _controllerPage.meetingUserData == null
                    ? []
                    : _controllerPage.meetingUserData!.isEmpty
                        ? []
                        : _controllerPage.meetingUserData!.map((element1) {
                            return itemMeeting(element1, context);
                          }).toList(),
              ),
              // child: ListView.builder(
              //     itemCount: listItemOptionOpenTrip.length,
              //     itemBuilder: (BuildContext context, index) {
              //       return itemMeeting(listItemOptionOpenTrip[index]);
              //     }),
            ),
          ),
        ],
      );
    });
  }

  Widget listMeeting4(BuildContext context) {
    return GetBuilder<OptionMeetingController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           _controllerPage.meetingDivisiAllData!.isEmpty
            ? Container()
            : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                PRO(context).selectedCategory == "English" 
                    ? "General Meeting" 
                    : (PRO(context).selectedCategory == "Chinese"
                        ? "公共会议"
                        : "Meeting Umum"),
                 style:blackFontStyle2.copyWith(color: mainColor, fontWeight: FontWeight.w700))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: _controllerPage.meetingDivisiAllData == null
                    ? []
                    : _controllerPage.meetingDivisiAllData!.isEmpty
                        ? []
                        : _controllerPage.meetingDivisiAllData!.map((element1) {
                            return itemMeeting(element1, context);
                          }).toList(),
              ),
              // child: ListView.builder(
              //     itemCount: listItemOptionOpenTrip.length,
              //     itemBuilder: (BuildContext context, index) {
              //       return itemMeeting(listItemOptionOpenTrip[index]);
              //     }),
            ),
          ),
        ],
      );
    });
  }

  Widget listMeeting5(BuildContext context) {
    return GetBuilder<OptionMeetingController>(builder: (_) {
      return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                children: _controllerPage.meetingUserAllData == null
                    ? []
                    : _controllerPage.meetingUserAllData!.isEmpty
                        ? []
                        : _controllerPage.meetingUserAllData!.map((element1) {
                            return itemMeeting(element1, context);
                          }).toList(),
              ),
              // child: ListView.builder(
              //     itemCount: listItemOptionOpenTrip.length,
              //     itemBuilder: (BuildContext context, index) {
              //       return itemMeeting(listItemOptionOpenTrip[index]);
              //     }),
            )
          );
    }
    );
  }

  Widget itemMeeting(MeetingData item, BuildContext context) {
    DateTime time = DateFormat('H:m:s').parse('${item.time}');
    String formattedTime = DateFormat('H:mm').format(time);
    
    String dateString = '${item.date}';
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(spreadRadius: 1, blurRadius: 3, color: Color.fromARGB(31, 180, 180, 180))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:60,
            height:100,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(MdiIcons.calendarAlert, color: Colors.white),
            ),
          ),
          SizedBox(width:10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:5),
              Container(
                width:  (MediaQuery.of(context).size.width - 40 -60 - 10 - 20 -19),
                child: Text(
                  '${item.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: blackFontStyle1.copyWith(fontWeight: FontWeight.w700, fontSize: 15, ),
                ),
              ),
              SizedBox(height:3),
              Row(
                children: [
                  Icon(MdiIcons.calendarOutline, size:15),
                  SizedBox(width:2),
                  Text(
                    formattedDate,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackFontStyle3.copyWith(color: Colors.black ),
                  ),
                  SizedBox(width:10),
                  Icon(MdiIcons.clockOutline, size:15),
                  SizedBox(width:2),
                  Container(
                    child: Text(
                      formattedTime,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: blackFontStyle3.copyWith(color: Colors.black ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:3),
              Row(
                children: [
                  Icon(MdiIcons.mapMarkerOutline, size:15),
                  SizedBox(width:2),
                  Container(
                    width:  (MediaQuery.of(context).size.width - 200),
                    child: Text(
                      '${item.place}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: blackFontStyle3.copyWith(color: Colors.black ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:3),
              Row(
                children: [
                  Icon(MdiIcons.informationOutline, size:15),
                  SizedBox(width:2),
                  Container(
                    width:  (MediaQuery.of(context).size.width - 200),
                    child: Text(
                      '${item.penerbit != null ? item.penerbit : "-"}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: blackFontStyle3.copyWith(color: Colors.black ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget itemMeetingToday(MeetingData item, BuildContext context) {
    DateTime time = DateFormat('H:m:s').parse('${item.time}');
    String formattedTime = DateFormat('H:mm').format(time);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical:5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   width:40,
          //   height:40,
          //   decoration: BoxDecoration(
          //     color: "#ffcb3b".toColor(),
          //     borderRadius: BorderRadius.circular(50),
          //   ),
          //   child: Center(
          //     child: Icon(MdiIcons.calendarAlert, color: Colors.white),
          //   ),
          // ),
          SizedBox(width:10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:5),
              Container(
                width:  (MediaQuery.of(context).size.width - 40 -60 - 10 ),
                child: Text(
                  '${item.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: blackFontStyle1.copyWith(fontWeight: FontWeight.w700, fontSize: 15, ),
                ),
              ),
              SizedBox(height:3),
              Row(
                children: [
                  Icon(MdiIcons.clockOutline, size:15),
                  SizedBox(width:2),
                  Text(
                    formattedTime,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackFontStyle3.copyWith(color: Colors.black ),
                  ),
                  SizedBox(width:10),
                  Icon(MdiIcons.mapMarkerOutline, size:15),
                  SizedBox(width:2),
                  Container(
                    width:  (MediaQuery.of(context).size.width - 230),
                    child: Text(
                      PRO(context).selectedCategory == "English" 
                      ? 'Location : ${item.place} '
                      : (PRO(context).selectedCategory == "Chinese"
                          ? '位置 : ${item.place} '
                          : 'Lokasi : ${item.place} '),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: blackFontStyle3.copyWith(color: Colors.black ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Meeting Schedule" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "会议日程"
          : "Agenda Meeting"),
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
          backgroundColor: "#eee".toColor(),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: mainColor,
            title: Text(
            PRO(context).selectedCategory == "English" 
            ? "Meeting Schedule" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "会议日程"
                : "Agenda Meeting"),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          ),
          body: GetBuilder<OptionMeetingController>(
            initState: (state) async {
              await _controllerPage.initPage(context);
            },
            builder: (_) {
            return Stack(
              children: [
                _controllerPage.meetingData.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              width: 200,
                              child: const Image(
                                image: AssetImage('assets/nf.gif'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                children: [
                                  Text(
                                    PRO(context).selectedCategory == "English" 
                                    ? "Oops!\nData not found"
                                    : (PRO(context).selectedCategory == "Chinese"
                                        ? "哦！\n未找到数据"
                                        : "Oops!\nData tidak ditemukan"),
                                    style: blackFontStyle1.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    PRO(context).selectedCategory == "English" 
                                    ? "You don't have meeting schedule"
                                    : (PRO(context).selectedCategory == "Chinese"
                                        ? "您没有会议安排"
                                        : 'Anda tidak memiliki jadwal meeting'),
                                    style: blackFontStyle1.copyWith(color: greyColor, fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              listMeeting1(context),
                              const SizedBox(height: 10),
                              listMeeting2(context),
                              const SizedBox(height: 10),
                              listMeeting3(context),
                              const SizedBox(height: 10),
                              listMeeting4(context),
                              listMeeting5(context),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                _controllerPage.loadingWidget == true ? const LoadingWidget() : Container(),
              ],
            );
          },
            // builder: (_) {
            //   return ListView(
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           const SizedBox(height: 10),
            //           listMeeting(context),
            //           const SizedBox(height: 30),
            //         ],
            //       ),
            //     ],
            //   );
            // },
          ),
        ),
      ),
    );
  }
}