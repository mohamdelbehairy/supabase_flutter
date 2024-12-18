import 'package:flutter/material.dart';
import 'package:supabase_flutter/core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Home", actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
      ]),
    );
  }
}
