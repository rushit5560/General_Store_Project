import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [

                    Container(
                      height: Get.width * 0.14,
                      width: Get.width * 0.14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(ImgUrl.profile)
                        )
                      ),
                    ),
                    const SpacerWidth(15),

                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Your Order was Delivered. asas asas as asas ',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black
                              ),
                            ),
                            const SpacerHeight(5),
                            Text(
                              '10 Minutes Ago',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
