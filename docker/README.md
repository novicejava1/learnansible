# Instructions for execution
ansible-playbook linux_setup_docker.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_docker.yml -i inventory/hosts --tags "linux_install_docker" -v 
ansible-playbook linux_setup_docker.yml -i inventory/hosts --tags "linux_configure_docker" -v
ansible-playbook linux_setup_docker.yml -i inventory/hosts --tags "linux_stop_docker" -v
ansible-playbook linux_setup_docker.yml -i inventory/hosts --tags "linux_start_docker" -v
ansible-playbook linux_setup_docker.yml -i inventory/hosts --tags "linux_restart_docker" -v



# load specific config
TBD