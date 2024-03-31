import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/views/widgets/product_item.dart';
import 'package:ecommerce_app/services/home_services.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
            title: const SizedBox(
          height: 50,
          child: TextField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
          ),
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last Search',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Clear All',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.orange, fontSize: 14),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        child: Row(
                          children: [
                            Text('Shose'),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.clear)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        child: Row(
                          children: [
                            Text('SweatShirt'),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.clear)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        child: Row(
                          children: [
                            Text('Clothes'),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.clear)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        child: Row(
                          children: [
                            Text('Vegatabels'),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.clear)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Popular Search',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dummyProducts.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 100,
                          child: Card(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: dummyProducts[index].imgUrl,
                                        fit: BoxFit.contain,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(dummyProducts[index].name),
                                          Text(dummy_categories[int.parse(
                                                      dummyProducts[index]
                                                          .id) -
                                                  1]
                                              .categoryName),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'click hear',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.white,
                                          ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                dummyProducts[index].isFav == true
                                                    ? AppColors.orange
                                                    : AppColors.red)),
                                  )
                                ]),
                          ));
                    })
              ],
            ),
          ),
        ));
  }
}