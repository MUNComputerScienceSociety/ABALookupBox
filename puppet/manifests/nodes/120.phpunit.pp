composer::exec { 'global-install':
    cmd                  => 'install',
    cwd                  => '/vagrant',
}