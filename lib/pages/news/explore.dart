import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/basicHeader.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/news/FilterExplore.dart';
import 'package:skripsilocal/pages/news/afterSearchExplore.dart';
import 'package:flutter/services.dart';

import '../../repository/authentication_repository/authentication_repository.dart';
import 'NewsDetail.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String idBer = "";
  String ? selectedFilter;
  List<String> filters = ['Terbaru', 'Terlama'];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final controller = Get.put(NewsController());
    final detailSearch = TextEditingController();
    final userController = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        appBar: BasicHeader(),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: detailSearch,
                    decoration: InputDecoration(
                      hintText: 'Cari berita anda...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: (value) {
                      String inputSearh = detailSearch.text;
                      Get.to(() => ExploreSearchPage(inputSearch: inputSearh));
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: FutureBuilder<List<NewsModel>>(
                        future: controller.getAllNews(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  for (var index = 0; index < snapshot.data!.length; index++)
                                    Column(
                                      children: [
                                        Material(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                              side: const BorderSide(
                                                color: Colors.black,
                                              )
                                          ),
                                          color: index.isOdd ? Colors.grey.shade300 : Colors.grey.shade500,
                                          child: ListTile(
                                            title: Row(
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  height: 80,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      border: Border.all(
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.network(
                                                        snapshot.data![index].urlImage,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        snapshot.data![index].title,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 3,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              snapshot.data![index].publisher,
                                                              style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () async{
                                              controller.getNewsData(snapshot.data![index].title);
                                              await Future.delayed(const Duration(milliseconds: 100));
                                              controller.updateViews(snapshot.data![index].id.toString());
                                              if(AuthenticationRepository.instance.firebaseUser!=null){
                                                await Future.delayed(const Duration(milliseconds: 100));
                                                userController.updateUserScoreCategory(snapshot.data![index].category);
                                              }
                                              Get.to(() => NewsDetail(
                                                id: snapshot.data![index].id.toString(),
                                                title: snapshot.data![index].title,
                                                publisher: snapshot.data![index].publisher,
                                                urlImage: snapshot.data![index].urlImage,
                                                urlNews: snapshot.data![index].urlNews,
                                                description: snapshot.data![index].description,
                                                penulis: snapshot.data![index].author,
                                                kategori: snapshot.data![index].category,
                                              ));
                                            },
                                          ),

                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else {
                              return const Center(
                                child: Text("Something Went Wrong"),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: (MediaQuery.of(context).size.width - 130) / 2,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.sort,
                        size: 20,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          selectedFilter != null ? selectedFilter! : 'Urutkan',
                          style: TextStyle(
                            color: selectedFilter != null ? Colors.black : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  value: selectedFilter,
                  items: filters.map((String filter) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(filter),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue;
                      // print(selectedFilter);
                    });
                    if (selectedFilter == filters[0]) {
                      Get.to(() => FilterExplorePage(inputFilter: "DESC"));
                    } else if (selectedFilter == filters[1]) {
                      Get.to(() => FilterExplorePage(inputFilter: "ASC"));
                    }
                    setState(() {
                      selectedFilter = null;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 60,
                    width: 130,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 16,
                    iconEnabledColor: Colors.transparent,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    offset: const Offset(0, 110),
                    isOverButton: true,
                    maxHeight: 200,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const MyNavBar(index: 0),
      ),
    );
  }
}
