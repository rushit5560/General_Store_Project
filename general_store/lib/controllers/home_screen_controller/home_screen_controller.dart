import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/models/home_screen_model/banner_model.dart';
import 'package:general_store/models/home_screen_model/category_model.dart';
import 'package:general_store/models/home_screen_model/popular_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  TextEditingController searchFieldController = TextEditingController();
  String? searchValue;
  RxList<Datum> bannerLists = RxList();
  RxInt activeIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  List<CategoryInfo> categoryLists = [
    CategoryInfo(img: ImgUrl.cat1, catName: 'Pen'),
    CategoryInfo(img: ImgUrl.cat2, catName: 'Colors'),
    CategoryInfo(img: ImgUrl.cat3, catName: 'Clipboard'),
    CategoryInfo(img: ImgUrl.cat4, catName: 'Paper Clip'),
    CategoryInfo(img: ImgUrl.cat5, catName: 'Books'),
    CategoryInfo(img: ImgUrl.cat6, catName: 'Pages'),
    CategoryInfo(img: ImgUrl.cat1, catName: 'Pen'),
    CategoryInfo(img: ImgUrl.cat2, catName: 'Colors'),
    CategoryInfo(img: ImgUrl.cat3, catName: 'Clipboard'),
    CategoryInfo(img: ImgUrl.cat4, catName: 'Paper Clip'),
    CategoryInfo(img: ImgUrl.cat5, catName: 'Books'),
    CategoryInfo(img: ImgUrl.cat6, catName: 'Pages'),
  ];

  List topCategoryLists = [
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3
  ];

  List<PopularInfo> popularLists = [
    PopularInfo(img: ImgUrl.popular1, name: 'Popular 1 Pen'),
    PopularInfo(img: ImgUrl.popular2, name: 'Popular 2 Books'),
    PopularInfo(img: ImgUrl.popular3, name: 'Popular 3 Papers'),
    PopularInfo(img: ImgUrl.popular4, name: 'Popular 4 Pencils'),
  ];

  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if(isStatus.value){
        bannerLists = bannerList.data.obs;
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      isLoading(false);
    }
    // getFeaturedProductData();
  }


  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }
}