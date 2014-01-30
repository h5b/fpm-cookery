class Graveio < FPM::Cookery::Recipe

  name 'graveio'
  version '0.0.1'
  revision 0
  source 'https://github.com/kmerz/graveio', :with => :git

  maintainer	'Sebastian Trahm <sebastian.trahm@gmail.com>'
  license	'BSD'

  description	'An easy-to-use Pastebin-Solution'
  section	'admin'

  depends 'nodejs', 'sqlite3', 'rake', 'ruby1.9.3'

  pre_install	'preinst'
  post_install	'postinst'

  def build
    system 'bundle package'
    system 'bundle install'
  end

  def install
    share('graveio').install Dir['*']
    share('graveio').install Dir['vendor']
    share('graveio').install Dir['.bundle']
    share('graveio/tmp/cache').mkpath
    share('graveio/tmp/pids').mkpath
    share('graveio/tmp/sessions').mkpath
    share('graveio/tmp/sockets').mkpath
  end

end
