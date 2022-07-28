import 'package:flutter/material.dart';
import 'package:flutter_assessment/Screens/select_job_location.dart';
import 'package:flutter_assessment/constants.dart';
import 'package:flutter_assessment/widgets/back_button.dart';
import 'package:flutter_assessment/widgets/custom_search_field.dart';

class SelectJobCity extends StatefulWidget {
  const SelectJobCity({Key? key}) : super(key: key);

  @override
  State<SelectJobCity> createState() => _SelectJobCityState();
}

class _SelectJobCityState extends State<SelectJobCity> {
  final TextEditingController _serachController = TextEditingController();
  String _searchText = "";
  List searchresult = [];
  var data = [];

  _SelectJobCityState() {
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
            "Select Job City",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomSearchField(
                controller: _serachController,
                callback: searchOperation,
                label: "Search",
              ),
              Flexible(
                child:
                    searchresult.isNotEmpty || _serachController.text.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchresult.length,
                            itemBuilder: (BuildContext context, int index) {
                              String listData = searchresult[index];
                              return ListTile(
                                title: Text(listData.toString()),
                                onTap: () async {
                                  data = await Navigator.push(context, MaterialPageRoute(builder: (_) => SelectJobLocation(city: listData)));
                                  if(data.isNotEmpty) {
                                    Navigator.pop(context, data);
                                  }
                                },
                              );
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: cities.length,
                            itemBuilder: (BuildContext context, int index) {
                              String listData = cities[index];
                              return ListTile(
                                title: Text(listData.toString()),
                                  onTap: () async{
                                    data = await Navigator.push(context, MaterialPageRoute(builder: (_) => SelectJobLocation(city: listData)));
                                    if(data.isNotEmpty) {
                                      Navigator.pop(context, data);
                                    }
                                  }
                              );
                            },
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
    for (int i = 0; i < cities.length; i++) {
      String data = cities[i];
      if (data.toLowerCase().contains(searchText.toLowerCase())) {
        searchresult.add(data);
      }
    }
  }
}
