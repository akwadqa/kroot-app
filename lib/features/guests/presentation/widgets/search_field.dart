// features/guests/presentation/widgets/guests_search_field.dart
import 'package:flutter/material.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class GuestsSearchField extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  const GuestsSearchField({super.key, required this.hint, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: hint,
             hintStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(fontSize: 14, color: AppColors.grey600),
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ).symmetricPadding(horizontal: 20,vertical: 8),
    );
  }
}
