multicurrency_sources = [
  'main.vala',
  'windows/main_window/main_window.vala',
  'windows/splash_window/splash_window.vala',
  'widgets/theme_switcher/theme_switcher.vala',
  'widgets/rate_widget/rate_widget.vala',
  'widgets/fill_widget/fill_widget.vala',
  'widgets/circular-progress-bar/circular-progress-bar.vala',
  'services/currency/currency_service.vala',
  'services/currency/currency_model.vala',
  'services/currency/currency_provider.vala',
  'utils/http.vala',
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
