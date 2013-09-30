gem_package "middleman" do
  gem_binary "/usr/bin/gem1.9.1"
  action :install
end

config = data_bag_item("middleman", "config")

#initiate the project if it hasn't been created yet
execute "middleman_init" do
  cwd "/vagrant/src/"
  command "middleman init . --skip-bundle" + " --template=" + config["template"] + " --css-dir=" + config["css_path"] + " --js-dir=" + config["js_path"] + " --images-dir=" + config["images_path"]
  not_if do
    ::File.exists?('/vagrant/src/config.rb')
  end
end

#update the gems
execute "bundle_install" do
  cwd "/vagrant/src"
  command "bundle install"
end