import 'package:erp_system/hiveDatabase/hive_model.dart';
import 'package:erp_system/reusables/regexes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../hiveDatabase/hive_box.dart';
import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/sized_box_hw.dart';
import 'edit_staff_screen.dart';

class AddStaffWidget extends StatefulWidget {
  const AddStaffWidget({super.key});

  @override
  State<AddStaffWidget> createState() => _AddStaffWidgetState();
}

class _AddStaffWidgetState extends State<AddStaffWidget> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];
  String selectedItemName = '';
  List<String> genderList = ["Male", "Female"];

  String selectedRoleList = '';
  List<String> roleList = ["Manager", "HR", "Employee"];
  String selectedDesignationList = '';
  List<String> designationList = ["Software Developer", "Trainee", "Traders"];

  ///FormKey
  GlobalKey<FormState> addStaffFormKey = GlobalKey<FormState>();

  ///data map
  Map<String, dynamic> addStaffDataMap = <String, dynamic>{};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height - 200,
      width: size.width - 400,
      color: secondaryColor,
      child: Form(
        key: addStaffFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "Add Staff Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      onHover: (val) {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                              border: Border.all(
                                color: grey,
                                width: 1.0,
                              ),
                              color: secondaryColor,
                            ),
                            height: 470,
                            width: 300,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 50.0),
                                  child: CircleAvatar(
                                    maxRadius: 70,
                                    minRadius: 20,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_a_photo),
                                        Text("Upload photo"),
                                      ],
                                    ),
                                  ),
                                ),
                                hb10,
                                const Text(
                                  "Allowed format",
                                  style: TextStyle(fontSize: 9),
                                ),
                                const Text(
                                  "JPG,JPEG and PNG",
                                  style: TextStyle(fontSize: 10),
                                ),
                                hb20,
                                const Text(
                                  "Max file size",
                                  style: TextStyle(fontSize: 9),
                                ),
                                const Text(
                                  "2MB",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30),
                      child: Container(
                        height: 600,
                        width: 300,
                        color: secondaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                ),
                              ],
                              title: 'First name',
                              hintText: 'Role',
                              validatorMessage: 'First name',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['firstName'] = newValue;
                                }
                              },
                            ),
                            hb10,
                            CustomTextFormField(
                              title: 'Email address',
                              hintText: 'Enter email address',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['email'] = newValue;
                                }
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter an email address';
                                } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                            hb10,
                            CustomDropdownWithTitle(
                              hintText: "Select gender",
                              title: 'Gender',
                              value: selectedItemName,
                              items: genderList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedItemName = newValue;
                                  });
                                }
                              },
                            ),
                            hb10,
                            CustomDropdownWithTitle(
                              hintText: 'Select role',
                              title: 'Role',
                              value: selectedRoleList,
                              items: roleList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedRoleList = newValue;
                                  });
                                }
                              },
                            ),
                            hb20,
                            CustomTextFormField(
                              title: 'Staff Id',
                              hintText: 'Staff ID',
                              validatorMessage: 'Staff ID',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['staffID'] = newValue;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 30),
                      child: Container(
                        height: 600,
                        width: 300,
                        color: secondaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              title: 'Last name',
                              hintText: 'Octor',
                              validatorMessage: 'Last name',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['lastName'] = newValue;
                                }
                              },
                            ),
                            hb10,
                            CustomTextFormField(
                              title: 'Phone number',
                              hintText: 'Enter phone number',
                              validatorMessage: 'Phone number',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['phoneNumber'] = newValue;
                                }
                              },
                              inputFormatters: [phoneNumberFilter],
                            ),
                            hb10,
                            CustomTextFormField(
                              title: 'Phone number',
                              hintText: 'Enter phone number',
                              validatorMessage: 'Phone number',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['phoneNumber2'] = newValue;
                                }
                              },
                            ),
                            hb10,
                            CustomDropdownWithTitle(
                              hintText: 'Select designation',
                              title: 'Designation',
                              value: selectedDesignationList,
                              items: designationList,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedDesignationList = newValue;
                                  });
                                }
                              },
                            ),
                            hb10,
                            CustomTextFormField(
                              title: 'Official email',
                              hintText: 'Official email',
                              validatorMessage: 'Official email',
                              onSaved: (newValue) {
                                if (newValue != null && newValue.isNotEmpty) {
                                  addStaffDataMap['officialEmail'] = newValue;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                ///cta button
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: CTAButton(
                    submitTitle: 'Add Staff',
                    action: () {
                      if (addStaffFormKey.currentState!.validate()) {
                        addStaffFormKey.currentState?.save();
                        debugPrint("add staff data map${addStaffDataMap.toString()}");
                        showEditStaffDialog(context);
                      }
                      // debugPrint('selectedRoleList: - $selectedRoleList');
                      // debugPrint('selectedDesignationList:- $selectedDesignationList');
                      // debugPrint('selectedItemName:- $selectedItemName');
                      DetailsBox.detailsBox.saveDetail = Details(name: selectedRoleList, contact: 555555);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
