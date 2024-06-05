import 'dart:developer';

import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class NotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> requestingPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  static Future<void> reciveMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        FlutterRingtonePlayer().playNotification();
        Get.snackbar(message.notification!.title.toString(),
            message.notification!.body.toString());
        refreshOrderPindingPage(message.data);
      }
    });
  }

  static refreshOrderPindingPage(Map data) async {
    if (data["pagename"] == "orderpendingrefresh" &&
        Get.currentRoute == "/pendingorders") {
      PendingConrollerImp controller = Get.find<PendingConrollerImp>();
      await controller.refreshPendingOrders();
      log("refresh =-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=");
    }
  }

  static Future<void> runAllFunctions() async {
    await requestingPermissions();
    await reciveMessage();
  }
}
