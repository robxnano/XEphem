xephem_src = files(
  'aavso.c',
  'annotmenu.c',
  'broadcast.c',
  'calmenu.c',
  'closemenu.c',
  'compiler.c',
  'coordsmenu.c',
  'datamenu.c',
  'db.c',
  'dbmenu.c',
  'earthmap.c',
  'earthmenu.c',
  'fallbacks.c',
  'favmenu.c',
  'formats.c',
  'fsmenu.c',
  'gallerymenu.c',
  'glance.c',
  'gsc.c',
  'gscnet.c',
  'helpmenu.c',
  'homeio.c',
  'hznmenu.c',
  'imregmenu.c',
  'indimenu.c',
  'jpeg2pm.c',
  'jupmenu.c',
  'listmenu.c',
  'mainmenu.c',
  'marsmenu.c',
  'marsmmenu.c',
  'moonmenu.c',
  'moviemenu.c',
  'msgmenu.c',
  'netmenu.c',
  'objmenu.c',
  'obslog.c',
  'patchlevel.c',
  'plot_aux.c',
  'plotmenu.c',
  'preferences.c',
  'progress.c',
  'ps.c',
  'query.c',
  'rotated.c',
  'satmenu.c',
  'saveres.c',
  'scope.c',
  'sites.c',
  'skybinary.c',
  'skyeyep.c',
  'skyfifos.c',
  'skyfiltmenu.c',
  'skyfits.c',
  'skyhist.c',
  'skyip.c',
  'skylist.c',
  'skytoolbar.c',
  'skyviewmenu.c',
  'splash.c',
  'solsysmenu.c',
  'srchmenu.c',
  'sunmenu.c',
  'time.c',
  'tips.c',
  'trailmenu.c',
  'ucac.c',
  'uranusmenu.c',
  'usno.c',
  'versionmenu.c',
  'webdbmenu.c',
  'xe2.c',
  'xe3.c',
  'xephem.c',
  'xmisc.c',
)

metainfo_file = files('io.github.xephem.metainfo.xml')

if host_machine.system() != 'darwin'
  install_data('XEphem.png',
    install_dir: join_paths(get_option('datadir'), 'icons/hicolor/128x128/apps'))
  install_data('io.github.xephem.desktop',
    install_dir: join_paths(get_option('datadir'), 'applications'))
  install_data(metainfo_file,
    install_dir: join_paths(get_option('datadir'), 'metainfo'))
endif

# Validate MetaInfo file

ascli_exe = find_program('appstreamcli', required: false)
if ascli_exe.found()
  test('validate metainfo file', ascli_exe,
    args: ['validate', '--no-net', '--pedantic', metainfo_file])
endif

install_man('xephem.1')
install_subdir('auxil', install_dir: shared_dir)
install_subdir('catalogs', install_dir: shared_dir)
install_subdir('fifos', install_dir: shared_dir)
install_subdir('fits', install_dir: shared_dir)
install_subdir('gallery', install_dir: shared_dir)
install_subdir('help', install_dir: shared_dir)
install_subdir('lo', install_dir: shared_dir)