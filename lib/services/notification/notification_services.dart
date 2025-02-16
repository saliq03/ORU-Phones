import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationServices{
  FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  void requestNotificationPermission()async{
    NotificationSettings settings= await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,);

    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print("user granted permission");
    }
    else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      print("user granted provisional permission");
    }
    else{
      AppSettings.openAppSettings();
      print("user denied permission");
    }
  }

  void initLocalNotifications(BuildContext context, RemoteMessage message)async{
    var androidInitializationSettings=AndroidInitializationSettings('@mipmap/launcher_icon');
    var iosInitializationSettings=DarwinInitializationSettings();
    var initializationSettings=InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    await flutterLocalNotificationsPlugin.
    initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload){

        });
  }
  void firebaseInit(BuildContext context){
    FirebaseMessaging.onMessage.listen((message){
      if(Platform.isAndroid){
        print(message.data);
        print(message.data["id"]);
        initLocalNotifications(context, message);
        showNotifications(message);
      }
    });
  }

  Future<void> showNotifications(RemoteMessage message)async {
    AndroidNotificationChannel channel=AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notifications",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channelDescription: 'your channel description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker');

    DarwinNotificationDetails iosNotificationDetails=DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true );

    NotificationDetails notificationDetails=NotificationDetails(
        android: androidNotificationDetails,
        iOS:iosNotificationDetails);

    Future.delayed(Duration.zero,(){
      flutterLocalNotificationsPlugin.show(
          1,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }




  Future<String> getDeviceToken()async{
    String? token=await firebaseMessaging.getToken();
    return token!;
  }
}