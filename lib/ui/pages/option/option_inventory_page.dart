part of "../pages.dart";

class OptionInventory extends StatelessWidget {
  OptionInventory({Key? key}) : super(key: key);
  final _controllerPage = Get.put(OptionInventoryController());

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

  Widget listInventory(BuildContext context) {
    return GetBuilder<OptionInventoryController>(builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: _controllerPage.inventoryData == null
                ? []
                : _controllerPage.inventoryData!.isEmpty
                    ? []
                    : _controllerPage.inventoryData!.map((element1) {
                        return itemInventory(element1, context);
                      }).toList(),
          ),
          // child: ListView.builder(
          //     itemCount: listItemOptionOpenTrip.length,
          //     itemBuilder: (BuildContext context, index) {
          //       return itemInventory(listItemOptionOpenTrip[index]);
          //     }),
        ),
      );
    });
  }

  Widget itemInventory(InventoryData item, BuildContext context) {
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
            height:60,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${item.code}', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width:10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:5),
              Container(
                width:  (MediaQuery.of(context).size.width - 40 -60 - 10 - 20),
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
                  Text(
                    "${item.qty} ${item.satuan} | ${
                      PRO(context).selectedCategory == 'English'
                                  ? 'Condition : ' 
                                  : (PRO(context).selectedCategory == 'Chinese'
                                      ? '状态 : '
                                      : 'Kondisi : ')}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: blackFontStyle3.copyWith(color: Colors.grey ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:5, vertical:2),
                    decoration: BoxDecoration(
                     color: ('${item.condition}' == 'Baik')
                    ? "#71dd37".toColor()
                    : ('${item.condition}' == 'Kurang Baik')
                        ? "#696cff".toColor()
                        : Colors.red, 
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                     PRO(context).selectedCategory == "English"
                      ? item.condition == "Baik"
                          ? "Good"
                          : item.condition == "Kurang Baik"
                              ? "Not Good"
                              : "Broken"
                      : PRO(context).selectedCategory == "Chinese"
                          ? item.condition == "Baik"
                              ? "好"
                              : item.condition == "Kurang Baik"
                                  ? "不太好"
                                  : "坏"
                          : '${item.condition}',
                      style: blackFontStyle3.copyWith(color: Colors.white, fontSize:12 ),)
                  )
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
      ? "Inventory" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "库存"
          : "Inventaris"),
      home: RefreshIndicator(
        onRefresh: () async {
          await _controllerPage.initPage(context);
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () {
              Get.to(() => OptionInventoryreq());
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: mainColor,
            title: Text(
              PRO(context).selectedCategory == "English" 
              ? "Inventory" 
              : (PRO(context).selectedCategory == "Chinese"
                  ? "库存"
                  : "Inventaris"),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          ),
          body: GetBuilder<OptionInventoryController>(
            initState: (state) async {
              await _controllerPage.initPage(context);
            },
            builder: (_) {
            return Stack(
              children: [
                _controllerPage.inventoryData.isEmpty
                    ? Center(
                        child: Text(
                          PRO(context).selectedCategory == "English" 
                          ? "Empty inventory data" 
                          : (PRO(context).selectedCategory == "Chinese"
                              ? "无数据"
                              : "Data inventaris kosong"),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                        ),
                      )
                    : ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              listInventory(context),
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
            //           listInventory(context),
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