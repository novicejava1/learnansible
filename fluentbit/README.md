# Instructions for execution

ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_ping" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_install_fluentbit" -v 
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_configure_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_stop_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_start_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_restart_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --tags "linux_expose_fluentbit" -v



# load specific config

ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --extra-vars "fluentbit_config_template=collectd_stdout.conf" --tags "linux_configure_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --extra-vars "fluentbit_config_template=cpu-mem-disk-netio_stdout.conf" --tags "linux_configure_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --extra-vars "fluentbit_config_template=node-exporter_prometheus.conf" --tags "linux_configure_fluentbit" -v
ansible-playbook linux_setup_fluentbit.yml -i inventory/hosts --extra-vars "fluentbit_config_template=docker_stdout.conf" --tags "linux_configure_fluentbit" -v




