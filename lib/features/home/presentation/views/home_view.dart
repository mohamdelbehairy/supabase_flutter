import 'package:flutter/material.dart';
import 'package:supabase_flutter_app/features/home/presentation/views/edit_view.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/custom_logout_button.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Home",
          automaticallyImplyLeading: false,
          actions: [const CustomLogoutButton()]),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (contect) => const EditView())),
      ),
    );
  }
}
