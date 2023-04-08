ip_src = files(
  'explodegif.c',
  'fits.c',
  'fsmatch.c',
  'gaussfit.c',
  'lstsqr.c',
  'median.c',
  'stars.c',
  'stats.c',
  'sqr.c',
  'walk.c',
  'wcs.c',
)

ip_headers = include_directories('.')

ip = static_library('ip', ip_src,
  include_directories: astro_headers,
  link_with: astro,
)