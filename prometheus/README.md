# Instructions for execution

ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_install_prometheus" -v 
ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_configure_prometheus" -v
ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_stop_prometheus" -v
ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_start_prometheus" -v
ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_restart_prometheus" -v
ansible-playbook linux_setup_prometheus.yml -i inventory/hosts --tags "linux_expose_prometheus" -v

TODO

# Download prometheus

# Setup a prometheus instance
# ./prometheus --config.file=./prometheus.yml --web.listen-address=":2121"

# Configure Prometheus Datasource in prometheus dashboard
# URL - http://fedres.stack.com:2121
