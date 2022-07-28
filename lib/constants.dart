import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

var gender = [
  const DropDownValueModel(name: "Male", value: "1"),
  const DropDownValueModel(name: "Female", value: "2"),
  const DropDownValueModel(name: "Other", value: "3"),
];

List<dynamic> cities = [
  "Mumbai",
  "Pune",
  "Nagpur",
  "Thane",
  "Nashik",
  "Kalyan",
  "Jalgaon",
  "Nanded",
  "Kolhapur",
  "Latur",
  "Dhule",
  "Amravati",
  "Buldhana",
  "Solapur",
  "Navi Mumbai"
];

Map<String, List> location = {
  "Mumbai" : ["Mumbai1", "Mumbai2", "Mumbai3", "Mumbai4"],
  "Pune" : ["Pune1", "Pune2", "Pune3", "Pune4"]
};

List<String> categoryList = [
  "Business Development",
  "Telecaller/ BPO",
  "Graphic Designer",
  "Technology",
  "Hello",
  "what",
  "yes",
  "No",
];

Map<String, Icon> categories = {
  "Business Development" : Icon(Icons.access_time),
  "Telecaller/ BPO" : Icon(Icons.access_time),
  "Graphic Designer" : Icon(Icons.access_time),
  "Technology" : Icon(Icons.access_time),
  "Hello" : Icon(Icons.access_time),
  "what" : Icon(Icons.access_time),
  "yes" : Icon(Icons.access_time),
  "No" : Icon(Icons.access_time),
};