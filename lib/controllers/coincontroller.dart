import 'package:get/get.dart';
import 'package:crypto_app/models/cmodel.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController { 
    RxList<Coin> coinstList =<Coin>[].obs;

    fetchCoins()async{
        var response = await http.get(
            Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en');
        )
        List<Coin> coins = coinFromJson(response.body);

        coinsList.value = coins;
    }
}



