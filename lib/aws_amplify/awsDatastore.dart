
import 'dart:developer';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:trilicious_social/models/ModelProvider.dart';

class AWSAmplifyHelper {
  static final AWSAmplifyHelper instance = AWSAmplifyHelper._init();
  AWSAmplifyHelper._init();

  Future<void> saveUser({
   required String avatar,
    required bool block,
    required TemporalDateTime date,
    required String dob,
    required String email,
    required String id,
    required double lat,
    required double long,
    required String name,
    required String number,
  }) async {
    log("adding");
    final newPost = UserData(
      avatar: avatar,
      block: block,
      date: date,
      dob: dob,
      email: email,
      lat: lat,
      long: long,
      name: name,
      number: number,
      authId: id,
    );
    try {
      await Amplify.DataStore.save(newPost);
    } catch (e) {
      log('error ${e.toString()}');
    }
    log("added");
  }

  Future<bool> readUserExists({id}) async {
    try {
      log('aaaa');
      final posts = await Amplify.DataStore.query(
        UserData.classType,
      );
      log('posts: ${posts.toString()}');
      return posts.isNotEmpty ? true : false;
    } on DataStoreException catch (e) {
      log('Query failed: $e');
    }
    return false;
  }
}
