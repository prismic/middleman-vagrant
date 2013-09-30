link "project" do
  user "vagrant"
  group "vagrant"
  link_type :symbolic
  target_file "/home/vagrant/src"
  to "/vagrant/src"
end

