import 'package:flutter/material.dart';
import 'package:flutter_assessment/Screens/category_screen.dart';
import 'package:flutter_assessment/Screens/select_job_city.dart';
import 'package:flutter_assessment/widgets/back_button.dart';
import 'package:flutter_assessment/widgets/custom_textfield.dart';
import 'package:flutter_assessment/widgets/custome_dropdown_textfield.dart';
import 'package:flutter_assessment/widgets/submit_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List data = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        _dob.value = TextEditingValue(
            text: "${picked.day}/${picked.month}/${picked.year}");
      });
    }
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton(),
            Container(
              height: size.height * 0.83,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 75, right: 75),
                      child: Center(
                        child: Text(
                          "Let's create your Profile",
                          style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: SizedBox(
                        height: size.height * 0.20,
                        child: Image.asset("assets/images/create_profile.png"),
                      ),
                    ),
                    CustomTextField(
                      labelText: "Full Name",
                      haveIcon: true,
                      icon: Icons.person,
                      controller: _name,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: CustomTextField(
                        labelText: "Date of Birth",
                        haveIcon: true,
                        icon: Icons.calendar_month_outlined,
                        enabled: false,
                        controller: _dob,
                      ),
                    ),
                    const CustomDropDownTextField(),
                    GestureDetector(
                      onTap: () async {
                        data = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => SelectJobCity()));
                        setState(() {
                          _city.text = data[0];
                          _location.text = data[1];
                        });
                      },
                      child: CustomTextField(
                        labelText: "Job City",
                        haveIcon: false,
                        enabled: false,
                        controller: _city,
                      ),
                    ),
                    data.isNotEmpty ? CustomTextField(
                      labelText: "Job Location",
                      haveIcon: false,
                      enabled: false,
                      controller: _location,
                    ) : Container()
                  ],
                ),
              ),
            ),
            SubmitButton(
              text: 'Next',
              callback: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
