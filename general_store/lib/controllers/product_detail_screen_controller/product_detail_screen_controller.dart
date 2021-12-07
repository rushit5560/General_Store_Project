import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:general_store/common/api_url.dart';
import 'package:general_store/models/product_detail_screen_model/product_detail_model.dart';
import 'package:get/get.dart';


class ProductDetailScreenController extends GetxController {
  int productId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxInt productCount = 1.obs;
  RxInt activeIndex = 0.obs;
  RxList<Datum> productDetailLists = RxList();

  getProductDetailData() async {
    isLoading(true);
    String url = ApiUrl.ProductDetailApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$productId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);

      ProductDetailsData productDetailsData = ProductDetailsData.fromJson(json.decode(response.body));
      isStatus = productDetailsData.success.obs;

      if(isStatus.value){
        productDetailLists = productDetailsData.data.obs;
      } else {
        print('Product Details False False');
      }

    } catch(e) {
      print('Product Details Error : $e');
    } finally {
      isLoading(false);
    }
    // getProductReview();
  }

  @override
  void onInit() {
    getProductDetailData();
    // getUserDetailFromPrefs();
    super.onInit();
  }


}