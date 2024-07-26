part of "a_widgets.dart";

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              "#192126".toColor().withOpacity(0.7),
              "#192126".toColor().withOpacity(0.7),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(0);
                }
              },
              child: selectedIndex ==0 
              ? Container(
                padding:EdgeInsets.symmetric(vertical:3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor
                ),
                child: Row(
                    children: [
                      Icon(MdiIcons.home , color: Colors.white),
                      SizedBox(width:2),
                      Text("Home", style:blackFontStyle3.copyWith(color:Colors.white, fontSize:13))
                    ],
                  )
                )
              : Container(
                width: 32,
                height: 32,
                child: Icon(MdiIcons.homeOutline, color: Colors.white)),
            ),
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(1);
                }
              },
              child: selectedIndex ==1
              ? Container(
                padding:EdgeInsets.symmetric(vertical:3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor
                ),
                child: Row(
                    children: [
                      Transform.rotate(
                        angle: 120,
                        child: Icon(MdiIcons.rocket , color: Colors.white)),
                      SizedBox(width:2),
                      Text("Approval", style:blackFontStyle3.copyWith(color:Colors.white, fontSize:13))
                    ],
                  )
                )
              : Container(
                width: 32,
                height: 32,
                child: Transform.rotate(
                  angle: 120,
                  child: Icon(MdiIcons.rocketOutline, color: Colors.white))),
            ),
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(2);
                }
              },
              child: selectedIndex ==2
              ? Container(
                padding:EdgeInsets.symmetric(vertical:3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor
                ),
                child: Row(
                    children: [
                      Icon(MdiIcons.chartBox , color: Colors.white),
                      SizedBox(width:2),
                      Text("Attendance", style:blackFontStyle3.copyWith(color:Colors.white, fontSize:13))
                    ],
                  )
                )
              : Container(
                width: 32,
                height: 32,
                child: Icon(MdiIcons.chartBoxOutline, color: Colors.white)),
            ),
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(3);
                }
              },
              child: selectedIndex ==3
              ? Container(
                padding:EdgeInsets.symmetric(vertical:3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor
                ),
                child: Row(
                    children: [
                      Icon(MdiIcons.account , color: Colors.white),
                      SizedBox(width:2),
                      Text("Profile", style:blackFontStyle3.copyWith(color:Colors.white, fontSize:13))
                    ],
                  )
                )
              : Container(
                width: 32,
                height: 32,
                child: Icon(MdiIcons.accountOutline, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
