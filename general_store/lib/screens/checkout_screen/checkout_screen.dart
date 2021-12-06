import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/screens/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'CheckOut',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              mapAndAddress(),

              paymentDetails(),

              placeOrderButton(),

            ],
          ),
        ),
      ),
    );
  }

  Widget mapAndAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: Get.height * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: mapView(),
                ),
              ),
              const SpacerWidth(10),
              Expanded(
                child: Container(
                  child: Text(
                    '7000, WhiteField, Manchester Highway, London, 401203',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'Sub Total',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),

                    Text(
                      '\$20.00',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),

                  ],
                ),
              ),
              CustomDivider(),

              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'Tax',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),

                    Text(
                      '\$00.00',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),

                  ],
                ),
              ),
              CustomDivider(),

              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),

                    Text(
                      '\$25.00',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),

                  ],
                ),
              ),
              CustomDivider(),


              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Payment',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),

              Row(
                children: [

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: CustomColor.kPinkColor),
                        image: DecorationImage(
                          image: AssetImage(ImgUrl.visa),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: CustomColor.kPinkColor),
                        image: DecorationImage(
                          image: AssetImage(ImgUrl.mastercard),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: CustomColor.kPinkColor),
                        image: DecorationImage(
                          image: AssetImage(ImgUrl.paypal),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: CustomColor.kPinkColor),
                        image: DecorationImage(
                          image: AssetImage(ImgUrl.visa1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget placeOrderButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          print('Clk');
          Get.to(()=> OrderConfirmedScreen());
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: CustomColor.kPinkColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'Place Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mapView() {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.1860, 72.7944),
      zoom: 10,
    );
    Completer<GoogleMapController> _controller = Completer();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: Get.height * 0.25,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        ),
      ),
    );
  }
}
