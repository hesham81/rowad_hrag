import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/center_text.dart';
import 'package:rowad_hrag/core/widget/icon_error.dart';
import 'package:rowad_hrag/features/contact_with_support/presentation/manager/contacts_cubit.dart';
import 'package:rowad_hrag/features/contact_with_support/presentation/pages/add_new_contact.dart';

import '../../../../core/theme/app_colors.dart';

class ContactWithSupport extends StatelessWidget {
  const ContactWithSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تواصل مع الدعم",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.01.height.hSpace,
            CenterTextContainer(
              text: "قم بانشاء تذكره",
              onTap: () => slideLeftWidget(
                newPage: AddNewContact(),
                context: context,
              ),
            ),
            0.01.height.hSpace,
            BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                if (state is ContactsLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Placeholder(),
                    separatorBuilder: (context, index) => 0.01.height.hSpace,
                    itemCount: 10,
                  );
                } else if (state is ContactsError) {
                  return IconError(
                    error: state.message,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ).hPadding(0.03.width),
      ),
    );
  }
}
