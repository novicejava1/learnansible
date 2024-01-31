# Instructions for controlplane execution

ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_configure_kernel" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_configure_firewall" --extra-vars "server_type=master" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_install_container_runtime" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_install_kubernetes_tools" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_initialize_kubernetes_cluster" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_export_config" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_configure_flannel" -v
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_configure_cni_plugins" -v          # for flannel cni plugin fix
ansible-playbook linux_setup_controller.yml -i inventory/hosts --tags "linux_configure_cilium" -v


# Instructions for worker node execution

ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_configure_kernel" -v
ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_configure_firewall" --extra-vars "server_type=node" -v
ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_install_container_runtime" -v
ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_install_kubernetes_tools" -v
ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_add_worker_node" -v
ansible-playbook linux_setup_worker.yml -i inventory/hosts --tags "linux_configure_cni_plugins" -v              # for flannel cni plugin fix


