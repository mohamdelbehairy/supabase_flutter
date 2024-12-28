import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/core/widgets/custom_app_bar.dart';
import 'package:supabase_flutter_app/features/image/data/repo/image_repo_impl.dart';
import 'package:supabase_flutter_app/features/image/presentation/manager/pick_image/pick_image_cubit.dart';
import 'package:supabase_flutter_app/features/image/presentation/manager/upload_image/upload_image_cubit.dart';

import 'widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PickImageCubit(ImageRepoImpl())),
        BlocProvider(create: (context) => UploadImageCubit(ImageRepoImpl())),
      ],
      child: Scaffold(
          appBar: customAppBar(title: "Edit View"),
          body: const EditViewBody()),
    );
  }
}
