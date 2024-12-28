import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/views/widgets/custom_button.dart';

import '../../../../auth/presentation/manager/user_data/user_data_cubit.dart';
import '../../../../image/presentation/manager/pick_image/pick_image_cubit.dart';
import '../../../../image/presentation/manager/upload_image/upload_image_cubit.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var image = context.read<PickImageCubit>();
    var upload = context.read<UploadImageCubit>();
    var update = context.read<UserDataCubit>();
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          context.read<UserDataCubit>().getUserData();
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                name: "Pick Image",
                onPressed: () async {
                  await image.pickImage();
                }),
            CustomButton(
                name: "Upload Image",
                onPressed: () async {
                  final imageUrl = await upload.uploadImage(image.image!);
                  await update.updateUserData(userImage: imageUrl!);
                }),
          ],
        ),
      ),
    );
  }
}
