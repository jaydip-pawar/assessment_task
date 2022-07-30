import 'package:flutter/material.dart';
import 'package:flutter_assessment/Screens/profile_screen.dart';

import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/widgets/back_button.dart';
import 'package:flutter_assessment/widgets/custom_search_field.dart';

class SelectJobLocation extends StatefulWidget {
  final String city;

  const SelectJobLocation({Key? key, required this.city}) : super(key: key);

  @override
  State<SelectJobLocation> createState() => _SelectJobLocationState();
}

class _SelectJobLocationState extends State<SelectJobLocation> {
  final TextEditingController _serachController = TextEditingController();
  String _searchText = "";
  List searchresult = [];

  _SelectJobLocationState() {
    _serachController.addListener(() {
      if (_serachController.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _serachController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const CustomBackButton(),
          title: const Text(
            "Select Job Location",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: TextFormField(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      labelText: widget.city,
                      fillColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
              CustomSearchField(
                controller: _serachController,
                callback: searchOperation,
                label: "Enter Nearest Railway/ Bus / Autostand",
              ),
              Flexible(
                child:
                    searchresult.isNotEmpty || _serachController.text.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemCount: searchresult.length,
                            itemBuilder: (BuildContext context, int index) {
                              String listData = searchresult[index];
                              return ListTile(
                                title: Text(listData.toString()),
                                onTap: () {
                                  Navigator.of(context)
                                      .pop([widget.city, listData]);
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                Divider(height: 0, color: Colors.grey),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: location[widget.city]!.length,
                            itemBuilder: (BuildContext context, int index) {
                              String listData = location[widget.city]![index];
                              return ListTile(
                                title: Text(listData.toString()),
                                onTap: () {
                                  Navigator.of(context)
                                      .pop([widget.city, listData]);
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                Divider(height: 0, color: Colors.grey),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    for (int i = 0; i < location[widget.city]!.length; i++) {
      String data = location[widget.city]![i];
      if (data.toLowerCase().contains(searchText.toLowerCase())) {
        searchresult.add(data);
      }
    }
  }
}
