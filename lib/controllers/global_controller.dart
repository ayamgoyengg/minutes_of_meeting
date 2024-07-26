part of 'controllers.dart';

GlobalController PRO(BuildContext context) => Provider.of(context, listen: false);

// NAME DATA SAVE TO LOCAL / SHARED PREFERENCES
const String USER_STORAGE = "USER";
const String LANGUAGE_STORAGE = "SELECTED_LANGUAGE";

// SHARED PREFERENCES
final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

// CONTROLLER USER DATA AND LANGUAGE SELECTED
class GlobalController extends ChangeNotifier {
  UserData? userData;
  String selectedCategory = 'Indonesia';
  List<String> category = ['Indonesia', 'English', 'Chinese'];

  Future<void> readLocalUser({bool isPrint = false}) async {
    try {
      final SharedPreferences pref = await _sharedPreferences;
      String? userString = pref.getString(USER_STORAGE);
      String? selectedLanguageLocal = pref.getString(LANGUAGE_STORAGE);
      print('---------');
      print(selectedLanguageLocal);
      print('---------');
      if (selectedLanguageLocal != null && selectedLanguageLocal.isNotEmpty) {
        selectedCategory = selectedLanguageLocal;
        notifyListeners();
        print('Selected Category loaded from cache: $selectedCategory');
      }

      if (userString != null) {
        Map<String, dynamic> userJson = json.decode(userString);
        userData = UserData.fromJson(userJson);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveLocalUser(UserData? data) async {
    try {
      final SharedPreferences pref = await _sharedPreferences;
      if (data != null) {
        try {
          String userString = json.encode(data.toJson());
          Map<String, dynamic> userJson = json.decode(userString);
          userData = UserData.fromJson(userJson);
          notifyListeners();
          await pref.setString(USER_STORAGE, userString);
        } catch (e) {
          print('Something Wrong $e');
        }
      }
    } catch (e) {
      print('Something Wrong');
    }
  }

  bool loadingWidget = false;
  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    notifyListeners();
  }

  Future<void> clearAllData(BuildContext context, bool useNav) async {
    try {
      handleLoadingWidget();
      final SharedPreferences pref = await _sharedPreferences;
      await Api().POST(API_SIGNOUT, null, context, useSnackbar: false, useToken: true);
      pref.remove(USER_STORAGE).then((value) {
        userData = null;
        if (useNav == true) Get.offAll(() => SignInPage());
        notifyListeners();
      });
    } catch (e) {
      print('Something Wrong');
    }
  }

  void handleSelectedCategory(dynamic itemSelected) {
    selectedCategory = itemSelected;
    notifyListeners();
  }

  Future<void> changeLang(String? value) async {
    try {
      // Save selectedCategory to cache using shared_preferences
      final SharedPreferences pref = await _sharedPreferences;
      await pref.setString(LANGUAGE_STORAGE, value ?? 'Indonesia');
      print('Selected Category saved to cache: ${value ?? 'Indonesia'}');

      selectedCategory = value ?? 'Indonesia';

      notifyListeners();
      print(selectedCategory);

      if (userData != null) {
        Get.offAll(() => MainPage());
      } else {
        Get.offAll(() => SignInPage());
      }
    } catch (e) {
      print('Something Wrong');
    }
  }
}
