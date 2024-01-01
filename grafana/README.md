# Instructions for execution

ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_install_grafana" -v 
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_configure_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_stop_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_start_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_restart_grafana" -v
ansible-playbook linux_setup_grafana.yml -i inventory/hosts --tags "linux_expose_grafana" -v


# load datasource configuration

ansible-playbook linux_setup_grafana.yml -i inventory/hosts --extra-vars "grafana_datasource_template=prometheus.yml" --tags "linux_configure_grafana" -v

