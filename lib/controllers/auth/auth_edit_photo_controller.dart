part of '../controllers.dart';

class AuthEditPhotoController extends GetxController {
  bool loadingWidget = false;
  File? pickImageUser;
  Future<void> handlePickImageUser(BuildContext context) async {
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    // photo?.length().then((value) => log(value.toString()));
    if (photo != null) {
      pickImageUser = File(photo.path);
      update();
    }
  }

  bool validation(BuildContext context) {
    if (pickImageUser == null) {
      snackBars(message: 'Tolong ganti foto terlebih dahulu');
      return false;
    }
    return true;
  }

  Future<void> submitPhoto(BuildContext context) async {
  // Check if the user has selected an image
  if (pickImageUser == null) {
    snackBarsError(message: 'Harap lampirkan foto terlebih dahulu');
    return;
  }

  // Perform additional validation if needed
  if (!validation(context)) {
    return;
  }

  // Show loading indicator
  handleLoadingWidget();

  // Prepare data for the API request
  UserEditPhoto data = UserEditPhoto();

  try {
    // Send API request to update the profile photo
    WrapResponse? resData = await Api().USERDATA(
      '$API_USER/photo', 
      data, 
      pickImageUser!, 
      context, 
      useSnackbar: true, 
      useToken: true // Make sure the token is being used correctly
    );

    // Check if the request was successful
    if (resData?.statusCode == 200) {
      // Fetch updated user data to refresh the profile
      WrapResponse? resGetData = await Api().GET(
        API_USER, 
        context, 
        useToken: true // Include the token in the GET request as well
      );

      // Parse the response into UserData object
      if (resGetData?.statusCode == 200) {
        UserData? userData = UserData.fromJson(resGetData?.data);
        // Preserve the current token
        userData?.token = PRO(context).userData?.token;
        
        // Save the updated user data locally
        await PRO(context).saveLocalUser(userData);

        // Show success message
        snackBarsSuccess(
          message: PRO(context).selectedCategory == "English"
              ? "Profile successfully changed"
              : (PRO(context).selectedCategory == "Chinese"
                  ? "Profile successfully changed"
                  : "Profile berhasil diganti"),
        );

        // Navigate to the main page to refresh the UI
        Get.offAll(() => MainPage());
      } else {
        snackBars(message: resGetData?.message ?? "Failed to fetch updated user data.");
      }
    } else if (resData?.statusCode == 401) {
      // Handle Unauthorized error
      snackBarsError(message: "Unauthorized. Please log in again.");
      // Optionally, redirect to the login page or prompt re-authentication
      // Get.offAll(() => LoginPage());
    } else {
      // Handle other API errors
      snackBars(message: resData?.message ?? "Failed to update profile photo.");
    }
  } catch (e) {
    // Handle any unexpected errors
    snackBarsError(message: "An unexpected error occurred: $e");
  } finally {
    // Hide loading indicator
    handleLoadingWidget();
  }
}


  
//   Future<void> submitPhoto(BuildContext context) async {
//   if (pickImageUser == null) {
//     snackBarsError(message: 'Harap lampirkan foto terlebih dahulu');
//     return;
//   }

//   // Validate input data
//   if (!validation(context)) {
//     return;
//   }

//   // Display loading widget during the operation
//   handleLoadingWidget();

//   // Prepare user data for the request
//   UserData data = UserData();

//   try {
//     // Call the service to upload the photo
//     WrapResponse? resData = await Api().USERDATA(
//       '$API_USER/photo',
//       data,
//       pickImageUser!,
//       context,
//       useToken: true,
//       useSnackbar: false,
//     );

//     // Log the response details for troubleshooting
//     print('Response Status Code: ${resData?.statusCode}');
//     print('Response Message: ${resData?.message}');
//     print('Response Data: ${resData?.data}');

//     // Check if the response indicates success
//     if (resData?.statusCode == 200) {
//       snackBarsSuccess(message: 'Pergantian foto profil Berhasil');
//       Get.offAll(() => MainPage());
//     } else {
//       // Handle failed responses, especially unauthorized (401) scenarios
//       snackBarsError(message: 'Pergantian foto profil Gagal');
//       if (resData?.statusCode == 401) {
//         snackBarsError(message: 'Pergantian foto profil Gagal (401)');
//       } else {
//         Get.offAll(() => MainPage());
//       }
//     }
//   } catch (e) {
//     // Handle exceptions and provide user feedback
//     snackBarsError(message: 'Terjadi kesalahan saat mengunggah foto.');
//     print('Exception: $e');
//   }
// }

  void handleLoadingWidget() {
    loadingWidget = !loadingWidget;
    update();
  }

  List<UserData> userData = [];

  Future<void> getUser(BuildContext context) async {
    try {
      handleLoadingWidget();
      WrapResponse? resData = await Api()
          .GET(API_USER, context, useSnackbar: false, useToken: true);
      if (resData?.statusCode == 200) {
        if (resData?.data['data'] != null) {
          List<UserData> listUserData = [];
          for (var element1 in resData?.data['data']) {
            listUserData.add(UserData.fromJson(element1));
          }
          listUserData.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
          userData = listUserData; // Make sure this line is present
          update(); // This updates the UI
          print('Successfully fetched data');
        }
      } else {
        print('Failed to fetch data');
      }
      handleLoadingWidget();
    } catch (e) {
      handleLoadingWidget();
      print('Error: $e');
    }
  }

  // edit
  Future<void> edit(BuildContext context, UserData user) async {
    handleLoadingWidget();
    // Get the current text from the Quill editor

    UserData data = UserData();

    WrapResponse? resData = await Api().POSTFORMDATA(
      'update/$API_USER/${user.id}',
      data.toJsonSend(),
      context,
      useSnackbar: true,
      useToken: true,
    );

    if (resData?.statusCode == 200) {
      snackBarsSuccess(
        message: 'Data meeting berhasil di update',
      );

      Get.offAll(() => FolderPage());
    } else {
      snackBarsError(
        message: 'Gagal edit data meeting',
      );
    }
  }

  Future<void> initPage(BuildContext context) async {
    await getUser(context);
  }
}
