application_id = 'io.github.r_sergii.multiCurrency'
f_usd_id = 'f_usd'
f_eur_id = 'f_eur'
f_gbp_id = 'f_gbp'
f_jpy_id = 'f_jpy'
f_chf_id = 'f_chf'
f_cad_id = 'f_cad'
f_aud_id = 'f_aud'
f_nzd_id = 'f_nzd'
up_id = 'up_green-hdpi'
down_id = 'down_red-hdpi'
equal_id = 'equal_blue-hdpi'

scalable_dir = join_paths('hicolor', 'scalable', 'apps')
install_data(
  join_paths(scalable_dir, ('@0@.svg').format(application_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_usd_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_eur_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_gbp_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_jpy_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_chf_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_cad_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_aud_id)),
  join_paths(scalable_dir, ('@0@.svg').format(f_nzd_id)),
  join_paths(scalable_dir, ('@0@.svg').format(up_id)),
  join_paths(scalable_dir, ('@0@.svg').format(down_id)),
  join_paths(scalable_dir, ('@0@.svg').format(equal_id)),
  install_dir: join_paths(get_option('datadir'), 'icons', scalable_dir)
)

symbolic_dir = join_paths('hicolor', 'symbolic', 'apps')
install_data(
  join_paths(symbolic_dir, ('@0@-symbolic.svg').format(application_id)),
  install_dir: join_paths(get_option('datadir'), 'icons', symbolic_dir)
)
