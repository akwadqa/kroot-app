//  // import 'package:easy_localization/easy_localization.dart' as local;
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:ahtizam/src/extenssions/int_extenssion.dart';
// import 'package:ahtizam/src/extenssions/widget_extensions.dart';
// import 'package:ahtizam/src/features/auth/regestration/presentation/widgets/text_form_fields/user_name_form_field.dart';

// import '../../../../../../../gen/assets.gen.dart';
// import '../../../../../../routing/app_router.gr.dart';
// import '../../../../../../shared_widgets/app_dialogs.dart';
// import '../../../../../../shared_widgets/custom_button_widget.dart';
// import '../../../../../../shared_widgets/fade_circle_loading_indicator.dart';
// import '../../../../../../theme/app_colors.dart';
// import '../../controller/auth_controller/auth_controller.dart';
// import '../../widgets/auth_text/auth_text.dart';
// import '../../widgets/text_form_fields/email_text_form_field.dart';
// import '../../widgets/phone_number_field/phone_number_field.dart';

//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();

//   String? _userName;
//   String? _phoneNumber;
//   String? _email;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 _buildHeader(),
//                 _buildLoginForm(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: AppColors.lightPeach,
//             borderRadius: const BorderRadius.vertical(
//               bottom: Radius.circular(15),
//             ),
//           ),
//           height: 200,
//           width: double.infinity,
//         ),
//         Assets.images.logo
//             .image(height: 120, width: 120)
//             .onlyPadding(top: 50)
//             .centered(),
//       ],
//     );
//   }

//   Widget _buildLoginForm(BuildContext context) {
//     return Column(
//       children: [
//         const AuthText(description: "sign_up_desc", title: "sign_up_welcome"),
//         54.verticalSpace,
//         PhoneNumberField(
//           onSaved: (value) => _phoneNumber = value,
//         ),
//         20.verticalSpace,
//         UserNameFormField(
//           onSaved: (value) => _userName = value,
//         ),
//         20.verticalSpace,
//         EmailTextFormField(
//           onSaved: (value) => _email = value,
//         ),
//         54.verticalSpace,
//         _buildSendCodeButton(context),
//         24.verticalSpace,
//         _buildOrDivider(context),
//         24.verticalSpace,
//         _buildCreateAccountText(context),
//         15.verticalSpace,
//       ],
//     ).symmetricPadding(horizontal: 12);
//   }

//   Widget _buildSendCodeButton(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Consumer(
//         builder: (BuildContext context, WidgetRef ref, Widget? child) {
//           ref.listen(authControllerProvider, (prev, next) {
//             if (next is AsyncData) {
//               context
//                   .navigateTo(VerificationRoute(inputedPhone: _phoneNumber!));
//             } else if (next is AsyncError) {
//               showErrorDialog(context, next.error.toString());
//             }
//           });

//           final asyncLogin = ref.watch(authControllerProvider);
//           if (asyncLogin is AsyncLoading) {
//             return const FadeCircleLoadingIndicator();
//           }

//           return CustomButtonWidget(
//             text: context.tr("create_account"),
//             onTap: () {
//               if (_formKey.currentState!.validate()) {
//                 _formKey.currentState!.save();
//                 // Uncomment to enable login functionality
//                 ref
//                     .read(authControllerProvider.notifier)
//                     .signup(_email!, _userName!, _phoneNumber!);
//               }
//             },
//             backgroundColor: AppColors.black,
//             isFiled: true,
//             height: 52,
//             radius: 12,
//             width: MediaQuery.sizeOf(context).width,
//           ).onlyPadding(bottom: 20);
//         },
//       ),
//     );
//   }

//   Widget _buildOrDivider(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             color: AppColors.stoneGray,
//             width: double.infinity,
//             height: 0.3,
//           ),
//         ),
//         Text(
//           context.tr("or"),
//           style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                 fontWeight: FontWeight.w300,
//                 color: AppColors.black800,
//               ),
//         ).symmetricPadding(horizontal: 10),
//         Expanded(
//           child: Container(
//             color: AppColors.stoneGray,
//             width: double.infinity,
//             height: 0.3,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCreateAccountText(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           context.tr("already_have_account"),
//           style: Theme.of(context)
//               .textTheme
//               .labelSmall!
//               .copyWith(fontSize: 14, color: AppColors.black),
//         ),
//         4.horizontalSpace,
//         InkWell(
//           onTap: () {
//             context.router.replace(LoginRoute());
//           },
//           child: Text(
//             context.tr("sign_in"),
//             style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                   color: AppColors.primary,
//                   fontSize: 14,
//                 ),
//           ),
//         ),
//       ],
//     );
//   }

//   // void _showDialog() {
//   //   showCustomDialog(
//   //     context: context,
//   //     title: context.tr('welcomeBack'),
//   //     icon: Assets.icons.markIcon.svg(),
//   //   );
//   // }
// }
