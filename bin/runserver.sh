# go to the project directory
echo "Starting up middleman at http://localhost:4567.  If it does not come up, check the middleman.log file for any error messages."
vagrant ssh -c "cd /vagrant/src; bundle exec middleman server --force-polling -l 1 &> middleman.log &"
