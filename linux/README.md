# Instructions for execution


## package management
ansible-playbook linux_setup_vm.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_vm.yml -i inventory/hosts --tags "linux_install_packages" -v
ansible-playbook linux_setup_vm.yml -i inventory/hosts --tags "linux_list_installed_packages" -v
ansible-playbook linux_setup_vm.yml -i inventory/hosts --tags "linux_list_transactions" -v
ansible-playbook linux_setup_vm.yml -i inventory/hosts --tags "linux_manage_transactions" -v



## Fedora Build VM setup
ansible-playbook linux_setup_fedora_build_vm.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_fedora_build_vm.yml -i inventory/hosts --tags "linux_install_packaging_tools" -v
ansible-playbook linux_setup_fedora_build_vm.yml -i inventory/hosts --tags "linux_kerberos_authetication" -v
ansible-playbook linux_setup_fedora_build_vm.yml -i inventory/hosts --tags "linux_package_gnuhello" -v
