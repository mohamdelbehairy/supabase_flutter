import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/user_data/user_data_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.userData.userImage != null)
                  Image.network(state.userData.userImage!),
                Text(state.userData.userID),
                Text(state.userData.userName),
                Text(state.userData.email),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
