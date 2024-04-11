// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:one_net/utils/colour.dart';
// import 'package:one_net/utils/fonts_style.dart';
// import 'package:one_net/utils/screen_size.dart';
// import 'package:one_net/view_models/currency_selection.dart';
// import 'package:one_net/view_models/store_view_model.dart';
// import 'package:one_net/views/home_screen.dart';
// import 'package:one_net/views/select_payment.dart';
// import 'package:one_net/widgets/button.dart';
// import 'package:one_net/widgets/footer.dart';
// import 'package:one_net/widgets/header.dart';
// import 'package:one_net/widgets/keyboard_btn.dart';
// import 'package:one_net/widgets/round_btn.dart';
// import 'package:provider/provider.dart';

// import '../view_models/keyboard_view_model.dart';

// class InputRecipientNum extends StatefulWidget {
//   const InputRecipientNum({super.key});

//   @override
//   State<InputRecipientNum> createState() => _InputRecipientNumState();
// }

// class _InputRecipientNumState extends State<InputRecipientNum> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // Provider.of<CardPaymentViewModel>(context, listen: false).payNow(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String transactionType =
//         Provider.of<StoreViewModel>(context).getTxnType();
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/images/home.png"), fit: BoxFit.cover),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               "assets/images/logo2.png",
//               width: ScreenSize().getScreenWidth(70),
//               height: ScreenSize().getScreenHeight(15),
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: ScreenSize().getScreenHeight(2),
//               ),
//               child: Container(
//                 height: ScreenSize().getScreenHeight(70),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color.fromARGB(166, 119, 118, 116), //New
//                       blurRadius: 25.0,
//                     )
//                   ],
//                   image: const DecorationImage(
//                       image: AssetImage("assets/images/card.jpg"),
//                       fit: BoxFit.fill),
//                   borderRadius: BorderRadius.circular(
//                     ScreenSize().getScreenHeight(3),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(ScreenSize().getScreenHeight(2)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Consumer<StoreViewModel>(
//                         builder: (context, myTxnType, child) {
//                           return Header(
//                             showHome: true,
//                             showPrevious: true,
//                             titleText: myTxnType
//                                 .transactionData["TransactionType"]
//                                 .toString(),
//                             subtitleText: 'Enter Your Detial Below',
//                             previousFunction: () {
//                               Navigator.pop(context);
//                             },
//                           );
//                         },
//                       ),
//                       Divider(
//                         thickness: 1,
//                         color: Colour().primary(),
//                       ),
//                       SizedBox(
//                         height: ScreenSize().getScreenHeight(1),
//                       ),
//                       Consumer<StoreViewModel>(
//                         builder: (context, myAmount, child) {
//                           return SizedBox(
//                             height: ScreenSize().getScreenHeight(7),
//                             width: double.infinity,
//                             child: TextFormField(
//                               initialValue: myAmount
//                                   .transactionData["rechargeAmount"]
//                                   .toString(),
//                               textAlign: TextAlign.start,
//                               autofocus: false,
//                               textAlignVertical: TextAlignVertical.center,
//                               // inputFormatters: [
//                               //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                               // ],
//                               maxLength: 5,
//                               onChanged: (value) {
//                                 Provider.of<InputAmountViewModel>(context,
//                                         listen: false)
//                                     .setCustonAmount(value);
//                               },
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: ScreenSize().getScreenHeight(2),
//                               ),
//                               textInputAction: TextInputAction.done,
//                               keyboardType: TextInputType.number,
//                               onEditingComplete: () {
//                                 Navigator.push(
//                                   context,
//                                   PageRouteBuilder(
//                                     pageBuilder:
//                                         (context, animation1, animation2) =>
//                                             const SelectPaymentOption(),
//                                     transitionDuration: Duration.zero,
//                                     reverseTransitionDuration: Duration.zero,
//                                   ),
//                                 );
//                               },
//                               decoration: InputDecoration(
//                                   hintText: 'Enter Recipient Number',
//                                   suffixIcon: const Icon(
//                                     Icons.dialpad,
//                                   ),
//                                   filled: true,
//                                   fillColor:
//                                       const Color.fromARGB(113, 211, 210, 210),
//                                   suffixIconColor:
//                                       MaterialStateColor.resolveWith((states) =>
//                                           states.contains(MaterialState.focused)
//                                               ? Colour().primary()
//                                               : const Color.fromRGBO(
//                                                   134, 134, 134, 1)),
//                                   counterText: "",
//                                   labelStyle: const TextStyle(
//                                       color: Color.fromRGBO(134, 134, 134, 1)),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       width: 2,
//                                       color: Colour().primary(),
//                                     ),
//                                     borderRadius: BorderRadius.circular(
//                                       ScreenSize().getScreenHeight(1),
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       width: 2,
//                                       color: Colour().primary(),
//                                     ),
//                                     borderRadius: BorderRadius.circular(
//                                       ScreenSize().getScreenHeight(1),
//                                     ),
//                                   )),
//                             ),
//                           );
//                         },
//                       ),
//                       SizedBox(
//                         height: ScreenSize().getScreenHeight(3),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           KeyboardButton(
//                             btnAction: () {
//                               // Provider.of<InputAmountViewModel>(context,
//                               //         listen: false)
//                               //     .setCustonAmount('1');
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('1');
//                             },
//                             btnLabel: Text(
//                               '1',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('2');
//                             },
//                             btnLabel: Text(
//                               '2',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('3');
//                             },
//                             btnLabel: Text(
//                               '3',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: ScreenSize().getScreenHeight(1.2),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           KeyboardButton(
//                             btnAction: () {
//                               // Provider.of<InputAmountViewModel>(context,
//                               //         listen: false)
//                               //     .setCustonAmount('1');
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('4');
//                             },
//                             btnLabel: Text(
//                               '4',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('5');
//                             },
//                             btnLabel: Text(
//                               '5',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('6');
//                             },
//                             btnLabel: Text(
//                               '6',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: ScreenSize().getScreenHeight(1.2),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           KeyboardButton(
//                             btnAction: () {
//                               // Provider.of<InputAmountViewModel>(context,
//                               //         listen: false)
//                               //     .setCustonAmount('1');
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('7');
//                             },
//                             btnLabel: Text(
//                               '7',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('8');
//                             },
//                             btnLabel: Text(
//                               '8',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('9');
//                             },
//                             btnLabel: Text(
//                               '9',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: ScreenSize().getScreenHeight(1.2),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           KeyboardButton(
//                             btnAction: () {
//                               // Provider.of<InputAmountViewModel>(context,
//                               //         listen: false)
//                               //     .setCustonAmount('1');
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('.');
//                             },
//                             btnLabel: Text(
//                               '.',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('0');
//                             },
//                             btnLabel: Text(
//                               '0',
//                               style: FontsStyle().inputAmtText(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: ScreenSize().getScreenWidth(1.5),
//                           ),
//                           KeyboardButton(
//                             btnAction: () {
//                               Provider.of<InputAmountViewModel>(context,
//                                       listen: false)
//                                   .setCustonAmount('back');
//                             },
//                             btnLabel: Image.asset(
//                               "assets/images/clear.png",
//                               width: ScreenSize().getScreenWidth(10),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: ScreenSize().getScreenHeight(2.5),
//                       ),
//                       Consumer<StoreViewModel>(
//                         builder: (context, myType, child) {
//                           return Button(
//                             btnAction:
//                                 myType.transactionData["rechargeAmount"] ==
//                                             null ||
//                                         myType.transactionData["rechargeAmount"]
//                                             .isEmpty
//                                     ? () {}
//                                     : () {
//                                         Navigator.push(
//                                           context,
//                                           PageRouteBuilder(
//                                             pageBuilder: (context, animation1,
//                                                     animation2) =>
//                                                 const SelectPaymentOption(),
//                                             transitionDuration: Duration.zero,
//                                             reverseTransitionDuration:
//                                                 Duration.zero,
//                                           ),
//                                         );
//                                       },
//                             inerColor:
//                                 myType.transactionData["rechargeAmount"] ==
//                                             null ||
//                                         myType.transactionData["rechargeAmount"]
//                                             .isEmpty
//                                     ? const Color.fromARGB(255, 245, 195, 154)
//                                     : Colour().primary(),
//                             btnLabel: Text(
//                               'Proceed ',
//                               style: FontsStyle().startbtnText(),
//                             ),
//                             btnInwardHightSize: ScreenSize().getScreenHeight(7),
//                             btnOutwardHieghtSize:
//                                 ScreenSize().getScreenHeight(8.5),
//                             btnInwardWidthSize: ScreenSize().getScreenWidth(78),
//                             btnOutwardWidthSize:
//                                 ScreenSize().getScreenWidth(81),
//                             outerColor: Colour().primary().withOpacity(0.5),
//                           );
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: ScreenSize().getScreenHeight(2),
//               ),
//               child: const Footer(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
