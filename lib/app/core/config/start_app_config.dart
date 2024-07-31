import 'package:chess_pdv/app/core/helpers/environment.dart';
import 'package:chess_pdv/app/core/helpers/platforms_enum.dart';
import 'package:chess_pdv/app/model/authorization_model.dart';
import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/model/role_model.dart';
import 'package:chess_pdv/app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:universal_platform/universal_platform.dart';

class StartAppConfig {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configPlatform();
    await _startHive();
  }

  Future<void> _startHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(RoleModelAdapter());
    Hive.registerAdapter(AuthorizationModelAdapter());
    Hive.registerAdapter(PdvModelAdapter());
    await Hive.openBox<PdvModel>('pdv');
    await Hive.openBox<UserModel>('user');
    await Hive.openBox<AuthorizationModel>('authorization');
  }

  Future<void> configPlatform() async {
    if(UniversalPlatform.isWeb){
      setUrlStrategy(PathUrlStrategy());
      Environment.platform = PlatformsEnum.web;
    }else if(UniversalPlatform.isAndroid){
      Environment.platform = PlatformsEnum.android;
      await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }else if(UniversalPlatform.isIOS){
      Environment.platform = PlatformsEnum.ios;
    }else{
      Environment.platform = PlatformsEnum.unknown;
    }
  }
}
