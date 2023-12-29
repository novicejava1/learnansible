# learnansible
This github project repository is an attempt to provide you with a set of ansible roles for Building and Managing your Linux Infrastructure. It is an attempt to provide with a collection of roles configuring different types of server to build a CICD based infrastructure.

## Linux
This secion contains information related to Linux system management using ansible roles.

### SystemLocaleManagement
This secion contains information related to OpenSCAP vulnerability scanning tool with ansible roles.

| Role  | Description |
| ------------- | ------------- |
| linux_get_system_locale  | Get System Locale |
| linux_set_system_locale  | Set System Locale |
| linux_get_system_time  | Get System Time |
| linux_set_system_timezone  | Set System Timezone |
| linux_sync_system_time  | Sync System Time |
| linux_get_formatted_date  | Get Formatted Date |
| linux_get_hardware_clock  | Get Hardware Clock Time |
| linux_sync_hardware_clock  | Sync Hardware Clock |

### SystemPackageManagement

| Role  | Description |
| ------------- | ------------- |
| linux_installed_packages  | Get Installed Packages |
| linux_install_security_updates  | Install Security Updates |
| linux_install_all_updates  | Install All Updates |
| linux_package_update_history  | Get Package Update History |
| linux_dnf_transaction_undo  | Undo Package Update Transaction |
| linux_dnf_transaction_redo  | Redo Package Update Transaction |

### SystemUserManaement

| Role  | Description |
| ------------- | ------------- |
| linux_system_user_details  | Get System User Details |
| linux_user_password_expirynotify  | Get User Password Expiry Notification |
| linux_system_user_add  | Add User |

### SystemSELinuxManagement

| Role  | Description |
| ------------- | ------------- |
| linux_selinux_allow_port  | Allow Port SELinux |

### SystemServiceManagement

| Role  | Description |
| ------------- | ------------- |
| linux_system_unit_list  | Get System Unit List |

### SystemCronManagement

| Role  | Description |
| ------------- | ------------- |
| linux_install_cron  | Install Cron and Dependent Packages |
| linux_create_cronjob_entry  | Create a Crontab Entry |

### SystemTroubleshoot

| Role  | Description |
| ------------- | ------------- |
| linux_generate_sos_report  | Generate SOS Report |

### SystemSecurityManagement

| Role  | Description |
| ------------- | ------------- |
| linux_post_installation_check  | Post Installation Check |
| linux_get_system_crypto_policy  | Get System Crypto Policy Set |
| linux_set_system_crypto_policy  | Set System Crypto Policy |
| linux_file_integrity_scan  | File integrity Scan using AIDE |

## Apache
This secion contains information related to Apache HTTP Server installation, configuration and management using ansible roles.

| Role  | Description |
| ------------- | ------------- |
| linux_install_http_server  | Install Apache HTTP Server |
| linux_apache_server_status  | Check Apache HTTP Server Status |
| linux_apache_restart_server  | Restart Apache HTTP Server |
| linux_apache_config_backup  | Backup Apache HTTP Server Configuration |
| linux_apache_start_server  | Start Apache HTTP Server |
| linux_apache_stop_server  | Stop Apache HTTP Server |
| linux_apache_config_update  | Update Apache HTTP Server Configuration |

## Nginx
This secion contains information related to Nginx Server installation, configuration and management using ansible roles.

| Role  | Description |
| ------------- | ------------- |
| linux_install_nginx_server  | Install Nginx Server |
| linux_nginx_service_status  | Check Nginx Server Status |
| linux_nginx_restart_server  | Restart Nginx Server |
| linux_nginx_config_backup  | Backup Nginx Server Configuration |
| linux_nginx_start_server  | Start Nginx Server |
| linux_nginx_stop_server  | Stop Nginx Server |
| linux_nginx_config_update  | Update Nginx Server Configuration |

## Elasticstack
This secion contains information related to Elasticstack installation, configuration and management using ansible roles.

| Role  | Description |
| ------------- | ------------- |
| linux_install_elasticsearch_server  | Install Elasticsearch Server |
| linux_elasticsearch_reset_password  | Reset Elastic user password |
| linux_elasticsearch_stop_server  | Stop Elasticsearch server |
| linux_elasticsearch_start_server  | Start Elasticsearch server |
| linux_elasticsearch_service_status  | Check Elasticsearch service status |
| linux_elasticsearch_config_backup  | Elasticsearch config backup |
| linux_elasticsearch_config_update  | Elasticsearch config update |
|  |  |
| linux_install_kibana_server  | Install Kibana Server |
| linux_kibana_start_server  | Start Kibana Server |
| linux_kibana_stop_server  | Stop Kibana Server |
| linux_kibana_service_status  | Check Kibana Service status |
| linux_kibana_config_backup | Kibana config backup |
| linux_kibana_config_update | Kibana config update |
|  |  |
| linux_install_logstash_server | Install Logstash Server |
| linux_logstash_start_server | Start Logstash Server |
| linux_logstash_stop_server | Stop Logstash Server |
| linux_logstash_config_backup | Logstash config backup |
|  |  |
| linux_install_metric_beat | Install Metricbeat Server |
| linux_metricbeat_start_server | Start Metricbeat Server |
| linux_metricbeat_config_backup | Metricbeat config backup |
| linux_metricbeat_config_update | Metricbeat config update |

## OpenSCAP
This secion contains information related to OpenSCAP vulnerability scanning tool with ansible roles.

| Role  | Description |
| ------------- | ------------- |
| linux_system_scan_openscap  | System scan using OpenSCAP |
| linux_system_update_securityfix  | System update for security fixes |

## Fluent-bit
This secion contains information related to Fluent-bit telemetry agent.

| Role  | Description |
| ------------- | ------------- |
| linux_install_fluentbit  | Install Fluent-bit Server |
| linux_configure_fluentbit  | Configure Fluent-bit Server |
| linux_restart_fluentbit  | Restart Fluent-bit Server |
| linux_stop_fluentbit  | Stop Fluent-bit Server |
| linux_start_fluentbit  | Start Fluent-bit Server |
| linux_expose_fluentbit  | Expose Fluent-bit Prometheus Port |

## Collectd
This secion contains information related to Collectd telemetry agent.

| Role  | Description |
| ------------- | ------------- |
| linux_install_collectd  | Install Collectd Server |
| linux_configure_collectd  | Configure Collectd Server |
| linux_restart_collectd  | Restart Collectd Server |
| linux_stop_collectd  | Stop Collectd Server |
| linux_start_collectd  | Start Collectd Server |

## Docker
This secion contains information related to Docker runtime.

| Role  | Description |
| ------------- | ------------- |
| linux_install_docker  | Install Docker Runtime |
| linux_configure_docker  | Configure Docker Runtime |
| linux_restart_docker  | Restart Docker Runtime |
| linux_stop_docker  | Stop Docker Runtime |
| linux_start_docker  | Start Docker Runtime |
