# Instructions for execution

ansible-playbook linux_setup_aws_client.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_aws_client.yml -i inventory/hosts --tags "linux_install_aws_client" -v
ansible-playbook linux_setup_aws_client.yml -i inventory/hosts --tags "linux_configure_aws_client" -v
ansible-playbook linux_setup_aws_client.yml -i inventory/hosts --tags "linux_update_aws_client" -v



