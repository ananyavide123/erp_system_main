import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/custom_popup_menu.dart';
import '../../reusables/navigators.dart';
import '../../reusables/snack_bar.dart';
import '../../services/auth_services.dart';
import '../auth/loginForm/login_form.dart';

class DashboardAppBar extends StatefulWidget {
  const DashboardAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  final AuthenticationService auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: CustomPopUpMenu(
        menuList: [
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: black,
              ),
              title: Text("Profile"),
            ),
          ),
          PopupMenuItem(
            onTap: () async {
              pushSimple(context, const LoginForm());
              showSnackBar(context, "User logout in Email:${auth.currentUser()?.email} successfully");
              await auth.signOut(context, "side_menu.dart");
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: red,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
