part of 'a_services.dart';

Future<ConnectivityResult> checkNetwork() async {
  return await (Connectivity().checkConnectivity());
}

class Api {
  BaseOptions _baseDioOption({String? customBaseUrl, int? connectTimeout}) {
    return BaseOptions(connectTimeout: 60000, baseUrl: customBaseUrl ?? BASE_URL);
  }

  String? _unknowError(dynamic error) {
    try {
      return error['message'];
    } catch (e) {
      return null;
    }
  }

// use raw
  Future<WrapResponse?> POST(
    String url,
    dynamic body,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();
    try {
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).post(
        url,
        data: body,
        options: Options(
          headers: (useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                }),
        ),
      );
      // Execute
      var _res = await _execute;
      if (_res.data.runtimeType == String) {
        throw _res.data.toString();
      }
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      // print(e.response?.data);
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

// use form data
  Future<WrapResponse?> POSTFORMDATA(
    String url,
    Map<String, dynamic> data,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();

    try {
      FormData formData = FormData.fromMap(data);

      BaseOptions testData = _baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout);
      print(testData.baseUrl);

      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).post(
        url,
        data: formData,
        options: Options(
          headers: (useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                }),
        ),
      );
      // Execute
      var _res = await _execute;

      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      // print(e.response?.data);
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?> POSTFORMDATA2(
    String url,
    PermissionData data,
    File file,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();
    try {
      String fileName = file.path.split('/').last;
      data.atc = await MultipartFile.fromFile(file.path, filename: fileName);
      FormData formData = FormData.fromMap(data.toJsonSend());

      BaseOptions testData = _baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout);
      print(testData.baseUrl);
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).post(
        url,
        data: formData,
        options: Options(
          headers: (useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                }),
        ),
      );
      // Execute
      var _res = await _execute;

      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      // print(e.response?.data);
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?> POSTFORMDATA3(
    String url,
    ReimbursementData data,
    File file,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();
    try {
      String fileName = file.path.split('/').last;
      data.atc = await MultipartFile.fromFile(file.path, filename: fileName);
      FormData formData = FormData.fromMap(data.toJsonSend());

      BaseOptions testData = _baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout);
      print(testData.baseUrl);
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).post(
        url,
        data: formData,
        options: Options(
          headers: (useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                }),
        ),
      );
      // Execute
      var _res = await _execute;

      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      // print(e.response?.data);
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?> POSTMULTIPART(
    String url,
    File file,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({"file": await MultipartFile.fromFile(file.path, filename: fileName)});
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).post(
        url,
        data: formData,
        options: Options(
          headers: (useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                }),
        ),
      );
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      // print(e.response?.data);
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?> POSTMULTIPARTCUSTOMTOKEN(
    String url,
    File file,
    String token,
    BuildContext context, {
    bool useLoading = true,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({"file": await MultipartFile.fromFile(file.path, filename: fileName)});
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).post(
        url,
        data: formData,
        options: Options(
          headers: ({
            "Content-Type": 'application/json',
            "Authorization": "Bearer $token",
          }),
        ),
      );
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      // print(e.response?.data);
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?> PATCH(
    String url,
    dynamic body,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    Map<String, String>? customHeader,
    String? customBaseUrl,
    bool useClearData = true,
    int? connectTimeout,
  }) async {
    var _net = await checkNetwork();
    try {
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl, connectTimeout: connectTimeout)).patch(url,
          data: body,
          options: Options(
              headers: (useToken
                  ? {
                      "Content-Type": 'application/json',
                      "Authorization": "Bearer ${PRO(context).userData?.token}",
                    }
                  : {
                      "Content-Type": 'application/json',
                    })));
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          useClearData ? PRO(context).clearAllData(context, true) : null;
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR('${e.response?.statusCode}', e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?> PUT(
    String url,
    dynamic body,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
  }) async {
    var _net = await checkNetwork();
    try {
      var _execute = Dio(_baseDioOption()).put(url,
          data: body,
          options: Options(
              headers: useToken
                  ? {"Content-Type": 'application/json', "Authorization": "Bearer ${PRO(context).userData?.token}", 'Accept': 'application/json'}
                  : {
                      "Content-Type": 'application/json',
                    }));
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      ERROR_SNACK_BAR("ERROR", "${e.response?.data}");
      if (e.type == DioErrorType.response) {
        if (e.response!.statusCode! == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", e.response?.statusMessage) : null;
          PRO(context).clearAllData(context, true);
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?>? GET(
    String url,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    String? customBaseUrl,
  }) async {
    // update();
    log(PRO(context).userData?.token.toString() ?? '');

    var _net = await checkNetwork();
    try {
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl)).get(
        url,
        options: Options(
          headers: useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                },
        ),
      );
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      log(e.toString());
      log(e.toString());
      log(e.toString());
      if (e.type == DioErrorType.response) {
        if (e.response!.statusCode! == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", e.response?.statusMessage) : null;
          await PRO(context).clearAllData(context, true);
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;
          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet") : null;
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan") : null;
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?>? GETCUSTOMETOKEN(
    String url,
    String token,
    BuildContext context, {
    bool useLoading = true,
    bool useSnackbar = true,
    String? customBaseUrl,
  }) async {
    var _net = await checkNetwork();
    try {
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl)).get(
        url,
        options: Options(
          headers: {
            "Content-Type": 'application/json',
            "Authorization": "Bearer $token",
          },
        ),
      );
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        if (e.response!.statusCode! == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", e.response?.statusMessage) : null;
          await PRO(context).clearAllData(context, true);
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }

  Future<WrapResponse?>? DELETE(
    String url,
    BuildContext context, {
    bool useLoading = true,
    bool useToken = false,
    bool useSnackbar = true,
    String? customBaseUrl,
  }) async {
    var _net = await checkNetwork();
    try {
      var _execute = Dio(_baseDioOption(customBaseUrl: customBaseUrl)).delete(
        url,
        options: Options(
          headers: useToken
              ? {
                  "Content-Type": 'application/json',
                  "Authorization": "Bearer ${PRO(context).userData?.token}",
                }
              : {
                  "Content-Type": 'application/json',
                },
        ),
      );
      var _res = await _execute;
      return WrapResponse(message: _res.statusMessage, statusCode: _res.statusCode, data: _res.data['data'], metaData: MetaData.fromJson(_res.data['meta']));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        if (e.response!.statusCode! == 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", e.response?.statusMessage) : null;
          await PRO(context).clearAllData(context, true);
          return null;
        } else if (e.response!.statusCode! >= 400 && e.response!.statusCode! != 401) {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        } else {
          useSnackbar ? ERROR_SNACK_BAR("${e.response?.statusCode}", _unknowError(e.response?.data) ?? e.response?.statusMessage) : null;

          return WrapResponse(message: e.response?.statusMessage ?? e.message, statusCode: e.response?.statusCode ?? 0, data: e.response?.data, metaData: MetaData.fromJson(e.response?.data['meta']));
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        useSnackbar ? ERROR_SNACK_BAR("Perhatian", "Koneksi tidak stabil") : null;
        return WrapResponse(message: "connection timeout", statusCode: e.response?.statusCode ?? 0, metaData: MetaData.fromJson(e.response?.data['meta']));
      } else if (_net == ConnectivityResult.none) {
        ERROR_SNACK_BAR("Perhatian", "Pastikan Anda terhubung ke Internet");
        return WrapResponse(message: "connection timeout", statusCode: 000);
      } else {
        ERROR_SNACK_BAR("Perhatian", "Terjadi Kesalahan");
        return WrapResponse(message: "connection timeout", statusCode: 999);
      }
    }
  }
}

class WrapResponse {
  String? message;
  int? statusCode;
  dynamic data;
  MetaData? metaData;

  WrapResponse({
    this.message,
    this.statusCode,
    this.data,
    this.metaData,
  });

  WrapResponse.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    statusCode = json['code'];
    data = json['data'];
    metaData = MetaData.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status_code'] = statusCode;
    _data['data'] = data;
    _data['metaData'] = metaData?.toJson();
    return _data;
  }

  @override
  String toString() {
    return "WrapResponse{message: $message, statusCode: $statusCode, data: $data}";
  }
}

class MetaData {
  int? code;
  String? status;
  String? message;

  MetaData({this.code, this.status, this.message});

  MetaData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
