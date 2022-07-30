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
  "Jalgaon",
  "Nanded",
  "Kolhapur",
  "Latur",
  "Dhule",
  "Amravati",
  "Buldhana",
  "Solapur"
];


Map<String, List> location = {
  "Mumbai" : ["Borivali East", "Borivali West", "Borivlai East", "Dahisar East", "Dahisar West", "Goregaon East", "Goregaon West", "Jogeshwari East", "Jogeshwari West", "Kandivali East", "Kandivali West", "Kandivlai West", "Malad East", "Malad West"],
  "Pune" : ["Ambegaon", "Baramati", "Bhor	Pune", "Daund", "Haveli", "Indapur", "Junnar", "Khed", "Maval", "Mawal", "Mulashi", "Mulshi", "Purandar", "Shirur"	, "Shiurur"	, "Velhe"],
  "Nagpur" : ["Bhiwapur", "Hingna", "Kalmeshwar", "Kamptee", "Kamthi", "Katol", "Kuhi", "Mouda", "Narkhed", "Parseoni", "Ramtek", "Savner", "Umred"],
  "Thane" : ["Ambarnath", "Bassein", "Bhiwandi", "Dahanu", "Digha", "Jawhar", "Kalyan", "Mokhada", "Murbad", "Palghar", "Rabale", "Shahapur", "Talasari", "Thane", "Vada", "Vasai", "Vikramgad", "Wada"],
  "Nashik" : ["Chandvad", "Devla", "Dindoir", "Igatpuri", "Kalwan", "Kalwn", "Malegaon", "Nandgaon", "Nashik", "Niphad", "Peint", "Peth", "Satana", "Sinnar", "Surgana", "Trimbak", "Trimbakeshwar", "Yeola"],
  "Jalgaon" : ["Amalner", "Bhadgaon", "Bhusawal", "Bodwad", "Chalisgoan", "Chopda", "Dharangaon", "Erandol", "Jalgaon", "Jalgoan", "Muktai Nagar", "Pachora", "Parola", "Raver", "Yawal"],
  "Nanded" : ["Ardhapur", "Bhokar", "Biloli", "Bvhokar", "Degloor", "Dharmabad", "Hadgaon", "Himayatnagar", "Kandhar", "Kandhr", "Kinwat", "Kiwat", "Loha", "Mahore", "Mudkhed", "Mukhed", "Naigaon", "Nanded", "Umari"],
  "Kolhapur" : ["Ajara", "Bhudargad", "Chandgad", "Gadhinglaj", "Gaganbavada", "Hatkanagale", "Kagal", "Karveern", "Karvir", "Panhala", "Radhanagari", "Shahuwadi", "Shirol"],
  "Latur" : ["Ahmadpur", "Ausa", "Chakur", "Deoni", "Jalkot", "Latur", "Nilanga", "Osmanabad", "Paranda", "Renapur", "Shirur", "Udgir"],
  "Dhule" : ["Dhule", "Sakri", "Shinkheda", "Shirpur", "Sindkhede"],
  "Amravati" : ["Achalpur City", "Amaravati", "Anjangaon", "Bhatkuli", "Chandur Bazar", "Chikhaldara", "Daryapu	Amrav", "Dhamangaon", "Dharni", "Morshi", "Nandgaon", "Paratwada"],
  "Buldhana" : ["Budlana", "Chikhli", "Deulgaon Mahi", "Dulgaon Raja", "Jalgaon", "Jalgaon (Jamod)", "Kahmgaon", "Khamgoan", "Lonar", "Malkapur", "Mehkar", "Motala", "Nandura", "Sangrampur", "Shegaon", "Sindkhed Raja", "Sonala"],
  "Solapur" : ["Akkaikot", "Akkalkot", "Barshi", "Karmala", "Karmalaa", "Madha", "Mahda", "Malshira", "Malshiras", "Malsiras", "Malsras", "Mangalvedha", "Mhol", "Mohol", "Nort Solapur", "Pandharpur", "Sangola"],
};

List<String> categoryList = [
  "Business Development",
  "Telecaller/ BPO",
  "Graphic Designer",
  "Technology",
  "Network Administrator",
  "Systems Analyst",
  "Database Administrator",
  "Data Scientist",
];

Map<String, IconData> categories = {
  "Business Development" : Icons.add,
  "Telecaller/ BPO" : Icons.access_time,
  "Graphic Designer" : Icons.abc_rounded,
  "Technology" : Icons.ac_unit,
  "Network Administrator" : Icons.baby_changing_station,
  "Systems Analyst" : Icons.calendar_month,
  "Database Administrator" : Icons.dangerous_rounded,
  "Data Scientist" : Icons.e_mobiledata_outlined,
};