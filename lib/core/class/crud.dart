import 'dart:async';
import 'dart:convert';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/check_internet.dart';
import 'package:ecommerce/data/model/return_twotypes.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        // if (1) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Either.right(responsebody);
        } else {
          return Either.left(StatusRequest.nodata);
        }
      } else {
        return Either.left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return Either.left(StatusRequest.serverfailure);
    }
  }
}
