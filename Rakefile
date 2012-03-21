task :link do
  Dir['_*'].each do |fn|
    dot_fn = fn.gsub(/^_/, '~/.')
    sh "ln -f #{fn} #{dot_fn}"
  end
end

namespace :bs do
  task :vim => :ubuntu do
    sh 'git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; true'
    sh 'vim +BundleInstall +qall'
  end

  task :ubuntu do
    tools = %w{ 
      vim-gnome chromium-browser
      build-essential openssl libreadline6 libreadline6-dev 
      curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev 
      libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev 
      libxslt-dev autoconf libc6-dev ncurses-dev automake 
      libtool bison subversion
    }
    sh "sudo apt-get install #{tools * ' '}"
  end

  task :ruby => :ubuntu do
    sh "curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer > /tmp/rvm-installer"
    sh "bash /tmp/rvm-installer"
    sh "rvm reload"
    sh "rvm install 1.9.2"
    sh "rvm use 1.9.2"
    sh "gem install bundler"
  end
end