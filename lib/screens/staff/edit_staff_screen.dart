import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../hiveDatabase/hive_box.dart';
import '../../reusables/buttons.dart';
import '../../reusables/colors.dart';
import '../../reusables/custom_dropdown.dart';
import '../../reusables/custom_text_form_field.dart';
import '../../reusables/regexes.dart';
import '../../reusables/sized_box_hw.dart';

showEditStaffDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: secondaryColor,
        title: Text(
          "Edit Staff Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: EditStaffWidget(),
      );
    },
  );
}

class EditStaffWidget extends StatefulWidget {
  const EditStaffWidget({super.key});

  @override
  State<EditStaffWidget> createState() => _EditStaffWidgetState();
}

class _EditStaffWidgetState extends State<EditStaffWidget> {
  List<String> itemNameList = ["Item1", "Item2", "Item3", "Item4"];

  String selectedItemName = '';
  List<String> genderList = ["Male", "Female"];
  String selectedRoleList = '';
  List<String> roleList = ["Manager", "HR", "Employee"];

  String selectedDesignationList = '';
  List<String> designationList = ["Software Developer", "Trainee", "Traders"];

  GlobalKey<FormState> editStaffWidgeFormKey = GlobalKey<FormState>();

  Map<String, dynamic> editStaffWidgetDataMap = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    debugPrint('from editstaffwiget');
    var getData = DetailsBox.detailsBox.fetchDetails;
    debugPrint('getData: $getData');
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 750,
      width: 1000,
      child: Column(
        children: [
          Form(
            key: editStaffWidgeFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          onHover: (val) {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, bottom: 80),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ),
                                border: Border.all(
                                  color: grey,
                                  width: 1.0,
                                ),
                              ),
                              height: 470,
                              width: 300,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 80.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        'assets/images/app_logo.png',
                                      ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: SizedBox(
                            height: 600,
                            width: 300,
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
                                      editStaffWidgetDataMap['first name'] = newValue;
                                    }
                                  },
                                ),
                                hb10,
                                CustomTextFormField(
                                  title: 'Email address',
                                  hintText: 'Enter email address',
                                  onSaved: (newValue) {
                                    if (newValue != null && newValue.isNotEmpty) {
                                      editStaffWidgetDataMap['email'] = newValue;
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
                                const CustomTextFormField(
                                  title: 'Staff ID',
                                  hintText: 'Staff ID',
                                ),
                                hb10,
                                const CustomTextFormField(
                                  title: 'Official email',
                                  hintText: 'Official email',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: SizedBox(
                            height: 600,
                            width: 300,
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
                                      editStaffWidgetDataMap['lastName'] = newValue;
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
                                      editStaffWidgetDataMap['phoneNumber'] = newValue;
                                    }
                                  },
                                  inputFormatters: [phoneNumberFilter],
                                ),
                                CustomTextFormField(
                                  title: 'Phone number',
                                  hintText: 'Enter phone number',
                                  validatorMessage: 'Phone number',
                                  onSaved: (newValue) {
                                    if (newValue != null && newValue.isNotEmpty) {
                                      editStaffWidgetDataMap['phoneNumber'] = newValue;
                                    }
                                  },
                                  inputFormatters: [phoneNumberFilter],
                                ),
                                hb10,
                                CustomDropdownWithTitle(
                                  title: 'Designation',
                                  hintText: 'Select designation',
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, top: 20),
                                  child: CTAButton(
                                    submitTitle: 'Edit Staff',
                                    action: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          hb10,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Assign",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextFormField(
                    labelText: '*',
                    title: 'User ID',
                    hintText: '0221AD',
                  ),
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
                  CTAButton(
                    action: () {
                      if (editStaffWidgeFormKey.currentState!.validate()) {
                        editStaffWidgeFormKey.currentState?.save();
                        debugPrint("add staff data map${editStaffWidgetDataMap.toString()}");
                        showEditStaffDialog(context);
                      }
                    },
                    submitTitle: 'Submit',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
