middleman:
  gem.installed:
    - user: root
    - names:
      - middleman

# run the middleman init command only if the config.rb file doesn't exist
create-project:  
  cmd.run:
    - user: vagrant
    - name: 'cd /vagrant/src; middleman init . --template={{ pillar['middleman']['template'] }} --css-dir={{ pillar['middleman']['css_path'] }} --js-dir={{ pillar['middleman']['js_path'] }} --images-dir={{ pillar['middleman']['images_path'] }}'
    - onlyif: 'test ! -e /vagrant/project/config.rb'
    - require:
      - gem: middleman
      
# add therubyracer gem if it's not there already, needed for linux and middleman
modify-gemfile:
  cmd.run:
    - user: vagrant
    - name: 'grep -q "gem \"therubyracer\"" /vagrant/project/Gemfile || sed "$ a\gem \"therubyracer\"" -i /vagrant/project/Gemfile'
    - onlyif: 'test -e /vagrant/project/Gemfile'
    - require:
      - cmd: create-project
      

# run the bundle install command if we haven't yet      
install-gems:
  cmd.run:
    - user: vagrant
    - name: 'cd /vagrant/project; bundle install'
    - onlyif: 'test ! -e /vagrant/project/Gemfile.lock'
    - require:
      - cmd: modify-gemfile