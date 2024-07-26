part of '../pages.dart';

class ProfileKontakKami extends StatelessWidget {
  ProfileKontakKami({super.key});
  final _controllerPage = Get.put(OptionContactController());

  Widget backButton(String titlePage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: mainColor,
      height: 80,
      child: Row(
        children: [
          InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
          const SizedBox(width: 20),
          Text(
            titlePage,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget listView1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/contact.jpg',
              height: MediaQuery.of(context).size.height / 3.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
          PRO(context).selectedCategory == "English" 
          ? "Contact Us" 
          : (PRO(context).selectedCategory == "Chinese"
              ? "联系我们"
              : "Hubungi Kami"),  
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 20),
          Text(
            PRO(context).selectedCategory == "English" 
            ? "We are ready to help anytime and anywhere. Please contact us anytime via :"
            : (PRO(context).selectedCategory == "Chinese"
                ? "我们随时随地可以服务。请联系我们通过："
                : "Kami siap membantu kapan pun dan dimana pun. Silahkan hubungi kami kapan pun melalui:"),
          style: Theme.of(context).textTheme.titleSmall?.copyWith()),
          const SizedBox(height: 20),
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final Uri urlEmail = Uri(
                    scheme: 'mailto',
                    path: '${_controllerPage.contactData?.email}',
                    query: 'FROM WELLSUN HRIS CONTACT', // add subject and body here
                  );
                  try {
                    await launchUrl(urlEmail, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open contact');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.email)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.email}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String stringPhone = 'tel://${_controllerPage.contactData?.phone}';
                  Uri urlPhone = Uri.parse(stringPhone);
                  try {
                    await launchUrl(urlPhone, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open contact');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.phone)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Contact Center', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.phone}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String stringWebsite = 'https://${_controllerPage.contactData?.website}';
                  Uri urlWebsite = Uri.parse(stringWebsite);
                  try {
                    await launchUrl(urlWebsite, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open Web');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.web)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Website', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.website}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String stringWa = 'https://wa.me/${_controllerPage.contactData?.wa}';
                  Uri urlWa = Uri.parse(stringWa);
                  try {
                    await launchUrl(urlWa, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open Whatsapp');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.whatsapp)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Whatsapp', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.wa}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String stringTwitter = 'https://twitter.com/${_controllerPage.contactData?.twitter}';
                  Uri urlTwitter = Uri.parse(stringTwitter);
                  try {
                    await launchUrl(urlTwitter, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open Twitter');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.twitter)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Twitter', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.twitter}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String stringFb = 'https://www.facebook.com/${_controllerPage.contactData?.fb}';
                  Uri urlFb = Uri.parse(stringFb);
                  try {
                    await launchUrl(urlFb, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open Facebook');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.facebook)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Facebook', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.fb}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  String stringIg = 'https://www.instagram.com/${_controllerPage.contactData?.ig}';
                  Uri urlIg = Uri.parse(stringIg);
                  try {
                    await launchUrl(urlIg, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    snackBars(message: 'Could not open Instagram');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.indigo, child: Icon(MdiIcons.instagram)),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Instagram', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                            const SizedBox(height: 2),
                            Text('${_controllerPage.contactData?.ig}', style: Theme.of(context).textTheme.titleSmall?.copyWith()),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 
      PRO(context).selectedCategory == "English" 
      ? "Contact Us" 
      : (PRO(context).selectedCategory == "Chinese"
          ? "联系我们"
          : "Kontak Kami"),  
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(MdiIcons.chevronLeft, color: Colors.white, size: 40),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: mainColor,
          title: Text(
            PRO(context).selectedCategory == "English" 
            ? "Contact Us" 
            : (PRO(context).selectedCategory == "Chinese"
                ? "联系我们"
                : "Kontak Kami"),  
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: GetBuilder<OptionContactController>(initState: (state) async {
          await _controllerPage.initPage(context);
        }, builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  listView1(context),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}