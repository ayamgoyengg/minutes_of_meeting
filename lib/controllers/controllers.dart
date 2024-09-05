import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:minutes_of_meeting/models/models.dart';
import 'package:minutes_of_meeting/services/a_services.dart';
import 'package:minutes_of_meeting/ui/pages/pages.dart';
import 'package:minutes_of_meeting/ui/widgets/a_widgets.dart';
import 'package:minutes_of_meeting/utilities/a_utilities.dart';
part 'auth/auth_signin_controller.dart';
part 'global_controller.dart';
part 'main/annual_controller.dart';
part 'option/option_createmeeting.dart';
part 'option/option_edit_mom_controller.dart';
part 'main/setting_controller.dart';
part 'main/home_controller.dart';
part 'main/calendar_controller.dart';
part 'option/option_tnc_controller.dart';
part 'auth/auth_forgot_password_controller.dart';
part 'auth/auth_edit_password_controller.dart';
part 'auth/auth_edit_profile_controller.dart';
part 'auth/auth_edit_photo_controller.dart';
part 'auth/auth_user_data.dart';
part 'option/option_stmeeting_controller.dart';
part 'option/option_meeting_controller.dart';