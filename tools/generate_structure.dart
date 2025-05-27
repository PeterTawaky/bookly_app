import 'dart:io';

import 'templates.dart';

Future<void> main() async {
  // Set to true if you want to preview operations without creating files/folders
  const dryRun = false;

  // Define project structure
  final structure = {
    'lib': ['main.dart'],

    'lib/app': ['my_app.dart'],

    // ----Assets
    'assets/images': [],
    'assets/fonts': [],
    'assets/videos': [],
    'assets/sounds': [],
    'assets/icons': [],

    // ----Core
    'lib/core/utils/constants': [
      'app_colors.dart',
      'app_images.dart',
      'app_strings.dart',
      'app_enums.dart',
      'app_sizes.dart',
      'app_fonts.dart',
      'hive_constants.dart',
      'api_constatnts.dart',
    ],

    'lib/core/utils/theme': ['app_theme.dart'],

    'lib/core/utils/theme/custom_themes': [
      'text_theme.dart',
      'appbar_theme.dart',
      'bottom_sheet_theme.dart',
      'checkbox_theme.dart',
      'text_field_theme.dart',
      'elevated_button_theme.dart',
    ],

    'lib/core/utils/device': ['device_utility.dart'],
    'lib/core/utils': ['formatters.dart', 'validators.dart'],
    'lib/core/utils/helpers': ['functions.dart', 'calculations.dart'],

    // ----API
    'lib/core/utils/api': [
      'api_consumer.dart',
      'dio_consumer.dart',
      'api_interceptor.dart',
      'local_status_codes.dart',
      'api_keys.dart',
      'api_endpoints.dart',
      'api_error_factory.dart',
      'api_error_handler.dart',
      'api_error_model.dart',
    ],

    'lib/core/utils/cache': ['local_keys.dart'],
    'lib/core/dependencies': ['di_container.dart'],
    'lib/core/widgets/layout': [],
    'lib/core/widgets/components': [],
    'lib/core/routes': ['app_routes.dart', 'router_generator.dart'],
    'lib/core/errors': [],
    'lib/core/models': [],
    'lib/core/utils/context': ['size_config.dart'],
  };

  for (var entry in structure.entries) {
    final folder = entry.key;
    final files = entry.value;

    if (dryRun) {
      print('[Dry Run] Would create folder: $folder');
    } else {
      await Directory(folder).create(recursive: true);
      print('Created folder: $folder');
    }

    for (var file in files) {
      final filePath = '$folder/$file';

      if (dryRun) {
        print('[Dry Run] Would create file: $filePath');
      } else {
        final fileRef = File(filePath);
        if (await fileRef.exists()) {
          print('Skipped existing file: $filePath');
        } else {
          final content = templates[file] ?? '';
          await fileRef.writeAsString(content);
          print('Created file: $filePath');
        }
      }
    }
  }

  print(
    dryRun
        ? 'Dry run complete — no files or folders were actually created.'
        : 'All folders and files created successfully!',
  );
}
