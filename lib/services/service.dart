import 'package:crud/utils/app_constances.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  
  // get data from the  back-end, with thsi we can get all data and a single data by ID
  Future<Response> getData(String uri) async {
    if(kDebugMode){
      print(AppConstanse.BASE_URL+uri);
    }
    Response response = await get(
      AppConstanse.BASE_URL + uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  // create data in the back-end
  Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(
      AppConstanse.BASE_URL + uri,
      body,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  // update the data 
  Future<Response> updateData(String uri, dynamic body) async {
    Response response = await put(
      AppConstanse.BASE_URL + uri,
      body,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }
  
}
