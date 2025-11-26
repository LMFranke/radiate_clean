import 'package:readiate_clean/storage/storage_settings.dart';
import 'package:readiate_clean/translate/pt-BR.dart';

import 'en-US.dart';

enum Texts {
  home_title,
  client_title,
  report_title,
  service_title,
  add_client_title,
  add_service_title,
  add_event_title,
  edit_client_title,
  edit_service_title,
  edit_event_title,
  switch_language_title,
  client,
  service,
  event,
  report,
  save,
  delete,
  edit,
  info,
  all_day,
  half_day,
  confirm,
  add,
  create,
  frequency_unique,
  frequency_weekly,
  frequency_monthly,
  name,
  phone_number,
  address,
  preferences,
  description,
  value_all_day,
  value_half_day,
  extra_value,
  select_work_type,
  select_frequency,
  select_client,
  select_service,
  select_date,
  do_a_description,
  no_data_found_client,
  no_data_found_service,
  no_data_found_event,
  no_data_found_upcoming_event,
  error_to_load_clients,
  error_to_load_services,
  invalid_input_name,
  invalid_input_phone_number,
  invalid_input_address,
  invalid_input_date,
  invalid_input_client_not_selected,
  invalid_input_service_not_selected,
  invalid_input_is_empty,
  success_add_client,
  success_add_service,
  success_add_event,
  success_updated,

  language_config,
  logout,
  brazilian_portuguese,
  english,
  login_password_field_invalid,
  login,
  password,

  report_filter,
  filter_by_client,
  filter_by_service,
  group_by,
  start_date,
  end_date,
  apply,
  cancel,
  remember_me,
  make_call_tip,

  settings_title,
  enable_login,
  general,
  success_add_login,

  appearance,
  theme_system,
  theme_light,
  theme_dark,

  cancel_event_title,
  cancel_event_message,
  event_canceled,
}

class Translate {
  static String getString(Texts text) {
    switch (StorageSettings.language) {
      case "en-US":
        return LanguageEnglish().getTranslate(text);
      default:
        return LanguageBrazilianPortuguese().getTranslate(text);
    }
  }
}
