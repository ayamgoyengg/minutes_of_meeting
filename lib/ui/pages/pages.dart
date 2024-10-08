import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:image_stack/image_stack.dart';
import 'package:intl/intl.dart';
// import 'package:location/location.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:supercharged/supercharged.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:minutes_of_meeting/constants.dart';
import 'package:minutes_of_meeting/controllers/controllers.dart';
import 'package:minutes_of_meeting/models/models.dart';
import 'package:minutes_of_meeting/shared/shared.dart';
import 'package:minutes_of_meeting/ui/widgets/a_widgets.dart';
import 'package:minutes_of_meeting/utilities/a_utilities.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;


part 'detail/create_mom1.dart';
part 'detail/create_mom.dart';
part 'general_page.dart';
part 'main/calendar_page.dart';
part 'main/main_page.dart';
part 'main/profile_page.dart';
part 'main/folder_page.dart';
part 'profile/sign_in_page.dart';
part 'detail/see_detail.dart';
part 'detail/detail_mom.dart';
part 'detail/edit_mom.dart';
part 'option/option_tnc_page.dart';
part 'profile/auth_forget_password_page.dart';
part 'profile/edit_profile.dart';
part 'profile/edit_photo.dart';
part 'profile/edit_password.dart';