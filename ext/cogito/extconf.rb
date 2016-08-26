require 'mkmf'

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  RbConfig::CONFIG['includedir'],

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  RbConfig::CONFIG['libdir'],

  # Finally fall back to /usr
  '/usr/lib',
]

dir_config('cogito', HEADER_DIRS, LIB_DIRS)

unless find_header('cogito.h', *HEADER_DIRS)
  abort 'cogito is missing. please install cogito.'
end

unless find_library('cogito', 'cg_to_json', *LIB_DIRS)
  abort 'cogito is missing. please install cogito'
end

create_makefile('cogito/cogito')
