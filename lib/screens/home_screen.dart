import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils.dart';
import '../controllers/coincontroller.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6CE4AC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Crypto Market",
              style: textStyle(24, Colors.white, FontWeight.bold),
            ),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          // Check if the screen width is less than or equal to a certain value (for mobile responsiveness)
                          if (constraints.maxWidth <= 600) {
                            return ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFBC700),
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(255, 145, 145, 145),
                                                  offset: const Offset(4, 4),
                                                  blurRadius: 5,
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.network(
                                                controller.coinsList[index].image,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.coinsList[index].name,
                                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  "${controller.coinsList[index].priceChangePercentage24H} %",
                                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  "\$ ${controller.coinsList[index].currentPrice}",
                                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  controller.coinsList[index].symbol,
                                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(color: Colors.white),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            // Default layout (without mobile responsiveness changes)
                            return ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFBC700),
                                            borderRadius: BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(255, 145, 145, 145),
                                                offset: const Offset(4, 4),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.network(
                                              controller.coinsList[index].image,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.coinsList[index].name,
                                                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "${controller.coinsList[index].priceChangePercentage24H} %",
                                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\$ ${controller.coinsList[index].currentPrice}",
                                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              controller.coinsList[index].symbol,
                                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
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
