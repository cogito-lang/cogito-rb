require 'mkmf'

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  RbConfig::CONFIG['includedir'],

  # Finally fall back to /usr
  '/usr/include'
].freeze

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  RbConfig::CONFIG['libdir'],

  # Finally fall back to /usr
  '/usr/lib'
].freeze

failure_message = "\n" << '=' * 85 << "\n"
failure_message << "libcogito is missing from your system. Please install by running the following steps:\n\n"
failure_message <<
  if `uname`.chomp == 'Darwin'
    <<-MSG
  $ brew tap localytics/formulae git@github.com:localytics/homebrew-formulae
  $ brew install cogito
MSG
  else
    <<-MSG
  $ FILE=$(mktemp)
  $ wget 'https://s3.amazonaws.com/public.localytics/artifacts/libcogito_0.0.1-1_amd64.deb' -qO $FILE
  $ sudo dpkg -i $FILE && rm $FILE
MSG
  end
failure_message << '=' * 85 << "\n\n"

dir_config('cogito', HEADER_DIRS, LIB_DIRS)
abort failure_message unless find_header('cogito.h', *HEADER_DIRS)
abort failure_message unless find_library('cogito', 'cg_to_json', *LIB_DIRS)

create_makefile('cogito/cogito')
