//homescreendart
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import '../utils.dart'; // Import your custom utilities file
import '../controllers/coincontroller.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crypto Market",
              style: textStyle(24, Colors.white, FontWeight.bold),
            ), //text
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[700],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[700]!,
                                              offset: const Offset(4, 4),
                                              blurRadius: 5,
                                            ), //boxShadow
                                          ],
                                        ), //boxDecoration
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.network(
                                            controller.coinsList[index].image),//image network padding
                                        ), //padding
                                      ), //Container
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            controller.coinsList[index].name,
                                            style: textStyle(18, Colors.white,
                                                FontWeight.w600),
                                          ), //text
                                          Text(
                                            "${controller.coinsList[index].priceChangePercentage24H} %",
                                            style: textStyle(18, Colors.grey,
                                                FontWeight.w600),
                                          ), //text
                                        ],
                                      ), //column
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$ ${controller.coinsList[index].currentPrice}",
                                        style: textStyle(18, Colors.white,
                                            FontWeight.w600),
                                      ), //text
                                      Text(
                                        controller.coinsList[index].symbol,
                                        style: textStyle(18, Colors.grey,
                                            FontWeight.w600),
                                      ), //text
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
