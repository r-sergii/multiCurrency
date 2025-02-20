multicurrency_sources = [
  'main.vala',
  'windows/main_window/main_window.vala',
  'windows/splash_window/splash_window.vala',
  'windows/language_window/language_window.vala',
  'windows/no_connect_window/no_connect_window.vala',
  'widgets/theme_switcher/theme_switcher.vala',
  'widgets/rate_widget/rate_widget.vala',
  'widgets/fill_widget/fill_widget.vala',
  'widgets/circular-progress-bar/circular-progress-bar.vala',
  'services/currency/currency_service.vala',
  'services/currency/currency_model.vala',
  'services/currency/currency_provider.vala',
  'services/connect/connect_service.vala',
  'services/connect/connect_provider.vala',
  'services/connect/connect_model.vala',
  'services/settings/settings_service.vala',
  'services/settings/settings_model.vala',
  'services/settings/theme_model.vala',
  'services/settings/locale_model.vala',
  'services/appsload/appsload_service.vala',
  'services/appsload/appsload_provider.vala',
  'services/appsload/appsload_model.vala',
  'services/translate/translate_service.vala',
  'services/translate/translate_provider.vala',
  'services/translate/translate_model.vala',
  'utils/http.vala',
  'utils/info_linux.vala',
  'utils/info_linux.c',
  'application.vala',
]

multicurrency_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
  dependency('gio-2.0'),
  dependency('gee-0.8'),
#  dependency ('libsoup-2.4'),
  dependency('json-glib-1.0')
]

gnome = import('gnome')

multicurrency_sources += gnome.compile_resources('multicurrency-resources',
  'multicurrency.gresource.xml',
  c_name: 'multicurrency'
)

executable('multicurrency', multicurrency_sources,
  vala_args: '--target-glib=2.50',  dependencies: multicurrency_deps,
  install: true,
)
