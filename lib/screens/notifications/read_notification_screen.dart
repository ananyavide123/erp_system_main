import 'package:flutter/material.dart';

import '../../reusables/buttons.dart';
import '../../reusables/sized_box_hw.dart';

class SecondNotificationScreen extends StatelessWidget {
  const SecondNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height - 100,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Notifications from HR",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  CTAButton(
                    action: () {},
                    submitTitle: 'Delete All',
                  ),
                ],
              ),
              hb10,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Friday, nov11.  10:00am",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet consectetur. Aliquet nisl laoreet nunc enim dignissim pulvinar ut enim nilla. Lorem eget ultrices est\ntellus enim proin id. nunc enim dignissim pulvinar ut nulla. Lorem eget ultrices est tellus enim proin id.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet consectetur. Aliquet nisl laoreet nunc enim dignissim pulvinar ut enim nilla. Lorem eget ultrices est\ntellus enim proin id. nunc enim dignissim pulvinar ut nulla. Lorem eget ultrices est tellus enim proin id.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  hb20,
                  const Text(
                    "Saturday,Nov12.  01:20pm",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  hb20,
                  const ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet consectetur. Aliquet nisl laoreet nunc enim dignissim pulvinar ut enim nilla. Lorem eget ultrices est\ntellus enim proin id. nunc enim dignissim pulvinar ut nulla. Lorem eget ultrices est tellus enim proin id.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet consectetur. Aliquet nisl laoreet nunc enim dignissim pulvinar ut enim nilla. Lorem eget ultrices est\ntellus enim proin id. nunc enim dignissim pulvinar ut nulla. Lorem eget ultrices est tellus enim proin id.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  hb20,
                  const Text(
                    "Sunday,Nov13.  09:20am",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  hb20,
                  const ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit amet consectetur. Aliquet nisl laoreet nunc enim dignissim pulvinar ut enim nilla. Lorem eget ultrices est\ntellus enim proin id. nunc enim dignissim pulvinar ut nulla. Lorem eget ultrices est tellus enim proin id.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
