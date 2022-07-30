import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/widgets/category_card.dart';
import 'package:flutter_assessment/widgets/submit_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List searchresult = [];
  List selectedList = [];

  _CategoryScreenState() {
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          height: 70,
          width: double.infinity,
          color: Colors.blue[900],
          child: SubmitButton(
            text: "Done",
            callback: (){},
            hasIcon: false,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: _size.height * 0.20,
              padding: selectedList.isEmpty
                  ? const EdgeInsets.only(right: 65, left: 65)
                  : const EdgeInsets.only(
                      left: 15, right: 15, top: 40, bottom: 40),
              child: selectedList.isEmpty
                  ? Center(
                      child: Text(
                        "Let's Start by Selecting Your area of Intrest",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: _size.width * 0.065,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        selectedList.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedList.removeAt(index);
                              });
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                    height: _size.width * 0.30,
                                    width: _size.width * 0.20,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      child: Icon(categories[selectedList[index]]),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 10,
                                  top: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 13,
                                    child: Icon(
                                      Icons.close_outlined,
                                      size: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
            Container(
              height: _size.height * 0.7042,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Choose Your Category",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Text(
                      "You have to choose atleast one category",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: searchOperation,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search",
                          contentPadding: EdgeInsets.only(
                              left: 25, top: 20, bottom: 20, right: 10),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    searchresult.isNotEmpty || _searchController.text.isNotEmpty
                        ? Container(
                            height: _size.height * 0.46,
                            child: GridView.count(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                              crossAxisCount: 2,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 10,
                              childAspectRatio: (.6 / .55),
                              children: List.generate(
                                searchresult.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedList
                                            .contains(searchresult[index])) {
                                          selectedList
                                              .remove(searchresult[index]);
                                        } else {
                                          selectedList.add(searchresult[index]);
                                        }
                                      });
                                    },
                                    child: CategoryCard(
                                      label: searchresult[index],
                                      icon: Icon(categories[searchresult[index]], size: 45),
                                      isSelected: selectedList
                                          .contains(searchresult[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(
                            height: _size.height * 0.46,
                            child: GridView.count(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                              crossAxisCount: 2,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 10,
                              childAspectRatio: (.6 / .55),
                              children: List.generate(
                                categoryList.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedList
                                            .contains(categoryList[index])) {
                                          selectedList
                                              .remove(categoryList[index]);
                                        } else {
                                          selectedList.add(categoryList[index]);
                                        }
                                      });
                                    },
                                    child: CategoryCard(
                                      label: categoryList[index],
                                      icon: Icon(categories[categoryList[index]], size: 45),
                                      isSelected: selectedList
                                          .contains(categoryList[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    for (int i = 0; i < categoryList.length; i++) {
      String data = categoryList[i];
      if (data.toLowerCase().contains(searchText.toLowerCase())) {
        searchresult.add(data);
      }
    }
  }
}
