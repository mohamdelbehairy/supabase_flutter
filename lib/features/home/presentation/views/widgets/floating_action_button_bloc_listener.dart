import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/manager/user_data/user_data_cubit.dart';

class FloatingActionButtonBloclistener extends StatelessWidget {
  const FloatingActionButtonBloclistener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, state) async {
        if (state is UpdateUserDataSuccess) {
          await context.read<UserDataCubit>().getUserData();
        }
      },
      child: FloatingActionButton(
        onPressed: () async {
          await context.read<UserDataCubit>().updateUserData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
