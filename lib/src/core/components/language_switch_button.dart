import 'package:book_store/src/core/constants/constants.dart';
import 'package:book_store/src/core/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSwitchButton extends StatelessWidget {
  const LanguageSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, widget) {
        final theme = Theme.of(context);
        final currentLocale = ref.watch(localeProvider);
        final isDark = theme.brightness == Brightness.dark;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   border: Border.all(color: kPrimaryColor),
          // ),
          child: PopupMenuButton<Locale>(
            icon: const Icon(Icons.language, color: kPrimaryColor),
            onSelected: (Locale locale) {
              ref.read(localeProvider.notifier).state = locale;
            },
            color: isDark ? kIconDimmedColor1 : kLightBGColor,
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: Locale('en'), child: Text("English")),
                PopupMenuItem(value: Locale('ar'), child: Text("العربية")),
              ];
            },
          ),
        );
      },
    );
  }
}
