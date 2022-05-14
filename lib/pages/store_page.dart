import 'package:flutter/material.dart';
import 'package:shop_ui/Themes/Color.dart';

import '../Json/constant.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Phnom Penh',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.location_on,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              'Find all \nstores here',
              style: TextStyle(
                fontSize: 30,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: TextField(
                        cursorColor: primary,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration:
                      const BoxDecoration(color: black, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.location_on_rounded,
                      color: white,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'All stores',
              style: TextStyle(
                fontSize: 22,
                color: black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(storeList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(storeList[index]['img']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 65,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        storeList[index]['open'] == 0 ? 'Close' : 'Open',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: storeList[index]['open'] == 0 ? Colors.redAccent : Colors.greenAccent,
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on, size: 20, color: white),
                                  const SizedBox(width: 10),
                                  Text(storeList[index]['name'], style: const TextStyle(fontSize: 18, color: white),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
