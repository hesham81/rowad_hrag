import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:rowad_hrag/core/extensions/align.dart';
import 'package:rowad_hrag/core/extensions/extensions.dart';
import 'package:rowad_hrag/core/widget/arrow_widget.dart';
import '../../../../core/theme/app_colors.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final cvvCodeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreditCardBrand? brandData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: SafeArea(
          child: Column(
            children: [
              Text(
                "الدفع",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
              ).center,
              0.02.height.hSpace,
              CreditCardWidget(
                enableFloatingCard: true,
                isHolderNameVisible: true,
                isSwipeGestureEnabled: true,
                cardNumber: cardNumberController.text,
                expiryDate: expiryDateController.text,
                cardHolderName: cardHolderNameController.text,
                cvvCode: cvvCodeController.text,
                cardType: CardType.visa,
                showBackView: cvvCodeController.text.isNotEmpty,
                onCreditCardWidgetChange: (CreditCardBrand brand) {
                  brandData = brand;
                },
              ),
              0.02.height.hSpace,
              CreditCardForm(
                cardNumber: cardNumberController.text,
                expiryDate: expiryDateController.text,
                cardHolderName: cardHolderNameController.text,
                cvvCode: cvvCodeController.text,
                isHolderNameVisible: true,
                onCreditCardModelChange: (CreditCardModel creditCardModel) {
                  cardNumberController.text = creditCardModel.cardNumber;
                  expiryDateController.text = creditCardModel.expiryDate;
                  cardHolderNameController.text = creditCardModel.cardHolderName;
                  cvvCodeController.text = creditCardModel.cvvCode;
                  setState(() {});
                },
                formKey: formKey,
              ),
            ],
          ),
        ).hPadding(0.03.width),
      ),
    );
  }
}
