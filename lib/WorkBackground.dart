import 'dart:io';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import './Notification.dart';

var _timeBackground = 60; //time background task

void initializeWorkBackground() {
  Workmanager.initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  // IOS change in AppDelegate.swift
  // Android
  if (Platform.isAndroid) {
    Workmanager.registerPeriodicTask(
      "1",
      "TarefaBackground",
      initialDelay: Duration(seconds: _timeBackground),
    );
  }
}

void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager.executeTask((task, inputData) async {
    print("************* background task *****  $task");
    try {
    // call notification
      await showNotification();
    } catch (e, s) {
      print("notification failed - $e");
      print("Stack: \n$s");
    }
    return Future.value(true);
  });
}
