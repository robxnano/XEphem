project('xephem', 'c',
  version: '4.2.0',
  meson_version: '>= 0.30.0',
  default_options: ['c_std=c89', 'warning_level=1',
    'buildtype=release', 'strip=true'],
)

cc = meson.get_compiler('c')
gtk_update_icon_cache = find_program('gtk-update-icon-cache', required: false)

add_project_arguments('-D_XOPEN_SOURCE=500', language: 'c')

libjpeg = dependency('libjpeg')
libpng = dependency('libpng')
ssl = dependency('openssl')
xext = dependency('xext')
xmu = dependency('xmu')
xt = dependency('xt')
zlib = dependency('zlib')

lib_dirs = []
inc_dirs = []
if host_machine.system() == 'darwin'
  lib_dirs += meson.current_source_dir() + '/libXm/osx'
  inc_dirs += include_directories('libXm/osx')
elif host_machine.system() in ['freebsd', 'openbsd']
  lib_dirs += '/usr/local/lib'
  inc_dirs += include_directories('/usr/local/include')
elif host_machine.system() == 'netbsd'
  lib_dirs += '/usr/pkg/lib'
  inc_dirs += include_directories('/usr/pkg/include')
endif

motif = cc.find_library('Xm', dirs: lib_dirs)
if not cc.has_header('Xm/Xm.h', include_directories: inc_dirs)
  error('Motif headers not found.')
endif
m = cc.find_library('m', required: false)

subdir('libastro')
subdir('libip')
subdir('liblilxml')
subdir('GUI/xephem')

xephem_libs = [astro, lilxml, ip]
xephem_deps = [libjpeg, libpng, m, motif, ssl, xext, xmu, xt, zlib]
xephem_inc_dirs = [inc_dirs, astro_headers, ip_headers, lilxml_headers]
if host_machine.system() == 'sunos'
  xephem_deps += [cc.find_library('socket'), cc.find_library('nsl')]
endif

xephem = executable('xephem', xephem_src,
  link_with: xephem_libs,
  dependencies: xephem_deps,
  include_directories: xephem_inc_dirs,
  install: true,
)

if gtk_update_icon_cache.found()
  meson.add_install_script('gtk-update-icon-cache', '-f', '-t',
    join_paths(get_option('prefix'), get_option('datadir'), 'icons', 'hicolor'))
endif
