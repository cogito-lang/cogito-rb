require 'mkmf'

LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  INCLUDEDIR,

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  LIBDIR,

  # Finally fall back to /usr
  '/usr/lib',
]

cogito_dirs = dir_config('cogito', '/opt/local/include', '/opt/local/lib')

unless ['', ''] == cogito_dirs
  HEADER_DIRS.unshift cogito_dirs[0]
  LIB_DIRS.unshift cogito_dirs[1]
end

unless find_header('cogito/parser.tab.h', *HEADER_DIRS)
  abort 'cogito is missing. Please install cogito.'
end

create_makefile('cogito/cogito')
