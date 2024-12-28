import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/views/widgets/custom_button.dart';

import '../../../../image/presentation/manager/pick_image/pick_image_cubit.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(name: "Pick Image", onPressed: () async{
            await context.read<PickImageCubit>().pickImage();
          }),
        ],
      ),
    );
  }
}
