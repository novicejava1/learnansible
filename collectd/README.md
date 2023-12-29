# Instructions for execution

ansible-playbook linux_setup_collectd.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_collectd.yml -i inventory/hosts --tags "linux_install_collectd" -v 
ansible-playbook linux_setup_collectd.yml -i inventory/hosts --tags "linux_configure_collectd" -v
ansible-playbook linux_setup_collectd.yml -i inventory/hosts --tags "linux_stop_collectd" -v
ansible-playbook linux_setup_collectd.yml -i inventory/hosts --tags "linux_start_collectd" -v
ansible-playbook linux_setup_collectd.yml -i inventory/hosts --tags "linux_restart_collectd" -v

