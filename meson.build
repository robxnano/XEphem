project('xephem', 'c',
  version: '4.2.0',
  meson_version: '>= 0.30.0',
  default_options: ['c_std=gnu89', 'warning_level=1'],
)

cc = meson.get_compiler('c')

libjpeg = dependency('libjpeg')
libpng = dependency('libpng')
ssl = dependency('openssl')
xext = dependency('xext')
xmu = dependency('xmu')
xt = dependency('xt')
zlib = dependency('zlib')

m = cc.find_library('m', required: false)
if host_machine.system() == 'darwin'
  motif = cc.find_library('Xm',
    dirs: meson.current_source_dir() + '/libXm/osx')
  motif_headers = include_directories('libXm/osx')
else
  motif = cc.find_library('Xm')
  if not cc.has_header('Xm/Xm.h')
    error('Motif headers not found.')
  endif
endif

subdir('libastro')
subdir('libip')
subdir('liblilxml')
subdir('GUI/xephem')

xephem_libs = [astro, lilxml, ip]
xephem_deps = [libjpeg, libpng, m, motif, ssl, xext, xmu, xt, zlib]
xephem_inc_dirs = [astro_headers, ip_headers, lilxml_headers]
if host_machine.system() == 'darwin'
  xephem_inc_dirs += motif_headers
endif

xephem = executable('xephem', xephem_src,
  link_with: xephem_libs,
  dependencies: xephem_deps,
  include_directories: xephem_inc_dirs,
  install: true,
)