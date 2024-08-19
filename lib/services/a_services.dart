import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:minutes_of_meeting/controllers/controllers.dart';
import 'package:minutes_of_meeting/models/models.dart';
import 'package:minutes_of_meeting/ui/widgets/a_widgets.dart';
import 'package:http/http.dart' as http;

part 'base_services.dart';
part 'local_service.dart';
part 'user_services.dart';

String BASE_URL = 'https://meeting.maxiidea.com/api/';
String API_SIGNIN = 'login';
String API_SIGNOUT = 'logout';
String API_SHIFT = 'shift';
String API_ATTENDANCE_TAMBAH = 'attendance/tambah';
String API_CALENDER = 'calendar';
String API_WARNLETTER = 'warnletter';
String payrollAPI = 'payroll';
String empovertimeAPI = 'empovertime';
String inventoryrequestAPI = 'inventoryrequest';
String forgetattendanceAPI = 'forgetattendance';
String permissionAPI = 'permission';
String reimbursementAPI = 'reimbursement';
String API_INVENTORY = 'inventory';
String API_HIK = 'hik';
String API_WHISTLEBLOWING = 'whistleblowing';
String API_KNOWLADGE = 'knowladge';
String API_TNC = 'tnc';
String API_KONTAK = 'contact';
String API_MAINTENANCE = 'maintenance';
String API_FORGOT_PASSWORD = 'forgot-password';
String API_USER = 'user';
String API_USER_RESET_PASSWORD = "reset-password";
String API_NOTIFICATION = 'notification';

String API_MEETING = 'meeting';
String API_STMEETING = 'stmeeting';
String API_ALLUSER = 'alluser';
