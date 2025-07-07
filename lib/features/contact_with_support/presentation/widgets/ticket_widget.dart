import 'package:flutter/material.dart';
import 'package:rowad_hrag/core/widget/custom_container.dart';
import 'package:rowad_hrag/features/contact_with_support/data/models/contact_data_model.dart';

import '../../../../core/theme/app_colors.dart';

class TicketWidget extends StatelessWidget {
  final ContactDataModel contactDataModel;

  const TicketWidget({
    super.key,
    required this.contactDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              contactDataModel.details,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              contactDataModel.subject,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: (contactDataModel.status == "open")
                  ? Colors.green
                  : Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              contactDataModel.status,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
