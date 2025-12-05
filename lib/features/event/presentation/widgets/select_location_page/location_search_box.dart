
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class LocationSearchBox extends ConsumerWidget {
  final Function(String placeId, String description) onSelect;

  const LocationSearchBox({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      addEventControllerProvider.select((val) => val.value!.predictions),
    );

    return Column(
      children: [
        /// TEXT FIELD
        HomePageSearchField(
          isLocation: true,
          hint: context.tr('search'),
          onChange: (value) {
            ref
                .read(addEventControllerProvider.notifier)
                .searchForLocation(value);
          },
        ),

        const SizedBox(height: 6),

        /// LIST OF PREDICTIONS
        if (state?.value?.isNotEmpty ?? false)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: state!.value!.length,
              itemBuilder: (context, index) {
                final p = state.value![index];
                return ListTile(
                  leading: Icon(Icons.location_on, color: AppColors.primary),
                  title: Text(
                    p.fullText,
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  onTap: () {
                    onSelect(p.placeId, p.fullText);

                    ref
                        .read(addEventControllerProvider.notifier)
                        .clearSearchSuggestions();
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
