multicurrency_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
]

multicurrency_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
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
