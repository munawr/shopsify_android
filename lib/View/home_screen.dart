import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/View/Widgets/CustomAppBar.dart';
import 'package:shopsify/View/Widgets/ItemsView.dart';
import '../../Provider/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(builder: (context, data, _) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: CustomAppBar(),
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "POLICE Analog Watch - For Men PLPEWJF0006203",image: "https://rukminim2.flixcart.com/image/612/612/xif0q/watch/r/l/t/1-plpewjf0006203-police-men-original-imaguh42zg64xvas.jpeg?q=70",offer: "40% off%",),
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Fastrack Tees Analog Watch - For Men 68011PP08",image: "https://rukminim2.flixcart.com/image/416/416/xif0q/watch/a/k/e/-original-imagnydrewxe5qeg.jpeg?q=70",offer: "50% off%",),
                  ],
                ),
                Row(
                  children: [
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Titan Karishma refresher Analog Watch - For Men NM1712YM02",image: "https://rukminim2.flixcart.com/image/832/832/k79dd3k0pkrrdj/watch-refurbished/p/g/j/d-1712ym02-titan-original-imafpkmqkc3rhstx.jpeg?q=70",offer: "60% off%",),
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Fastrack Stunners 1.0 Analog Watch - For Men 3254NM01",image: "https://rukminim2.flixcart.com/image/832/832/xif0q/watch/p/9/q/-original-imagnvwqkhhs7bfy.jpeg?q=70",offer: "20% off%",),
                  ],
                ),

                Row(
                  children: [
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Fastrack Tees Analog Watch - For Men 68011PP08",image: "https://rukminim2.flixcart.com/image/832/832/xif0q/watch/p/9/q/-original-imagnvwqkhhs7bfy.jpeg?q=70",offer: "30% off%",),
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Fastrack Minimalists Analog Watch - For Men 38024PP25",image: "https://rukminim2.flixcart.com/image/832/832/xif0q/watch/v/w/o/-original-imagta7uyupbfzsf.jpeg?q=70",offer: "50% off%",),
                  ],
                ),
                Row(
                  children: [
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Titan Analog Watch - For Men NP1773SL02",image: "https://rukminim2.flixcart.com/image/832/832/xif0q/watch/x/o/8/-original-imagnvwtyv2panhd.jpeg?q=70",offer: "63% off%",),
                    CustomItems(bestSeller: "Best Seller", dealOfTheDay: "Deal of the Day",name: "Fastrack Tees Analog Watch - For Men 68011PP08",image: "https://rukminim2.flixcart.com/image/416/416/xif0q/watch/a/k/e/-original-imagnydrewxe5qeg.jpeg?q=70",offer: "700% off%",),
                  ],
                ),
              ],
            ),
          ),

        );
      }),
    );
  }
}
