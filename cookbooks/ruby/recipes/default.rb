# needed to install middleman
package "build-essential" do
  action :install
end

# upgrading to newer version of ruby
package "ruby1.9.3" do
  action :install
end

# upgrade rubygems
package "rubygems1.9.1" do
  action :install
end

# needed to used less files
package "nodejs" do
  action :install
end

#set ruby 1.9 as the default over 1.8
execute "update_alternatives_ruby19" do
  command "update-alternatives --set ruby /usr/bin/ruby1.9.1"
  not_if 'ruby -v | grep "1.9"' #only do this if ruby is not already at the right version
end

#set gem to latest
execute "update_alternatives_rubygems" do
  command "update-alternatives --set gem /usr/bin/gem1.9.1"
  not_if 'gem -v | grep "1.9"' #only do this if ruby is not already at the right version
end

# Remove ruby1.8
execute "apt-get autoremove" do
  command "apt-get -y autoremove"
end