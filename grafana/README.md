# Instructions for execution

ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_install_grafana" -v 
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_configure_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_stop_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_start_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_restart_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_expose_grafana" -v

TODO

# Download prometheus

# Setup a prometheus instance
# ./prometheus --config.file=./prometheus.yml --web.listen-address=":2121"

# Configure Prometheus Datasource in Grafana dashboard
# URL - http://fedres.stack.com:2121
