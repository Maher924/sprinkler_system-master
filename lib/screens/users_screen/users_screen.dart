import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/create_user_screen/create_user_screen.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/screens/users_screen/local_widgets/user_card.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/utils/util_values.dart';
import 'package:sprinkler_system/widgets/primary_button.dart';
import 'package:sprinkler_system/widgets/logout_button.dart';

import '../../widgets/custom_app_bar.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Users',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const LogoutButton(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              physics: UtilValues.scrollPhysics,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return UserCard(
                  id: '201900823',
                  imageUrl: AssetsManager.refaie,
                  name: 'Mohamed Refaie',
                  phone: '+201014838889',
                  email: 'mohamedrefaie@gmail.com',
                  onTap: () {
                    Navigator.of(context).pushNamed(MainScreen.routeName);
                  },
                );
              },
              separatorBuilder: (context, index) => Gaps.gap16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: PrimaryButton(
              label: 'Create New User',
              onPressed: () {
                Navigator.of(context).pushNamed(CreateUserScreen.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
