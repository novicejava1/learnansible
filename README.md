# learnansible
This github project repository is an attempt to provide you with a set of ansible roles for Building and Managing your Linux Infrastructure. It is an attempt to provide with a collection of roles configuring different types of server to build a CICD based infrastructure.

## Linux
This secion contains information related to Linux system management using ansible roles.

### systemlocalmgmt
| Role  | Description |
| ------------- | ------------- |
| linux_get_system_locale  | Get System Locale |
| linux_set_system_locale  | Set System Locale |
| linux_get_system_time  | Get System Time |
| linux_set_system_timezone  | Set System Timezone  |
| linux_sync_system_time  | Sync System Time  |
| linux_get_formatted_date  | Get Formatted Date |
| linux_get_hardware_clock  | Get Hardware Clock Time |
| linux_sync_hardware_clock  | Sync Hardware Clock  |

### systempackagemgmt
| Role  | Description |
| ------------- | ------------- |
| linux_installed_packages  | Get Installed Packages |
| linux_install_security_updates  | Install Security Updates |
| linux_install_all_updates  | Install All Updates |
| linux_package_update_history  | Get Package Update History |
| linux_dnf_transaction_undo  | Undo Package Update Transaction |
| linux_dnf_transaction_redo  | Redo Package Update Transaction |

### systemusermgmt
| Role  | Description |
| ------------- | ------------- |
| linux_system_user_details  | Get System User Details |
| linux_user_password_expirynotify  | Get User Password Expiry Notification |
| linux_system_user_add  | Add User |

### systemservicemgmt
| Role  | Description |
| ------------- | ------------- |
| linux_selinux_allow_port  | Allow Port SELinux |

### systemselinuxmgmt
| Role  | Description |
| ------------- | ------------- |
| linux_system_unit_list  | Get System Unit List |

### systemcronmgmt
| Role  | Description |
| ------------- | ------------- |
| linux_install_cron  | Install Cron and Dependent Packages |
| linux_create_cronjob_entry  | Create a Crontab Entry |

### systemtroubleshoot
| Role  | Description |
| ------------- | ------------- |
| linux_generate_sos_report  | Generate SOS Report |

## Apache
This secion contains information related to Apache HTTP Server installation, configuration and management using ansible roles.

## Nginx
This secion contains information related to Nginx Server installation, configuration and management using ansible roles.

