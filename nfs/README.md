Purpose - How to install and configure a secure NFS server

Test Environment
Fedora 37 workstation

What is NFS

The Network File System (NFS) was developed to allow machines to mount a disk partition on a remote machine as if it were a local disk. It allows for fast, seamless sharing of files across a network. NFS Versions 2, 3, and 4 are supported on 2.6 and later kernels

What are NFS Daemons

NFS service relies on several different service daemons for normal operation

nfsd		- This daemon handles other client file-system requests
mountd		- This daemon handles file-system mount requests from remote systems and provides access control.
automountd 	- This daemon handles the mounting and unmounting requests from the autofs service
lockd		- This daemon supports record-locking operations on NFS files
statd		- This daemon records information about each monitored NFS peer on persistent storage.
quotad		- This process provides user quota information for remote users

Procedure

Step1: Install NFS Utils

The nfs-utils package provides a daemon for the kernel NFS server and related tools, which provides a much higher level of performance than the traditional Linux NFS server used by most users. NFS server consist of launching serveral daemons. The basic NFS service is called nfs-server. The nfs-server service automatically starts the rpcbind service, if it is not already running.

The following ports TCP and UDP ports 2049 (nfs), 111 (rpcbind) and TCP and UDP ports 20048 for the showmount command must be open for an NFS server to function properly. 

$ cat ansible/roles/linux_nfs_install_server/tasks/main.yml 
---
- name: install nfs server
  dnf:
    name: nfs-utils
    state: present

- name: ensure nfs service is enabled and running
  service: 
    name: nfs-server
    state: started 
    enabled: yes

These are the list of installed packages.

Installed:
  gssproxy-0.9.1-5.fc38.x86_64        keyutils-1.6.1-6.fc38.x86_64 libev-4.33-7.fc38.x86_64       libnfsidmap-1:2.6.3-1.rc3.fc38.x86_64 libverto-libev-0.3.2-5.fc38.x86_64
  nfs-utils-1:2.6.3-1.rc3.fc38.x86_64 quota-1:4.09-2.fc38.x86_64   quota-nls-1:4.09-2.fc38.noarch rpcbind-1.2.6-4.rc2.fc38.x86_64       sssd-nfs-idmap-2.8.2-4.fc38.x86_64

These are the list of config files, utilities and services that are installed.

[vagrant@fednfs ~]$ rpm -ql nfs-utils | grep -v "/usr/share" | grep -v "/usr/lib/.build-id"
/etc/exports.d
/etc/gssproxy/24-nfs-server.conf		- gssproxy provides a daemon to manage access to GSSAPI credentials
/etc/modprobe.d/lockd.conf			- nfs lock daemon config 
/etc/nfs.conf					- generic config file for nfs daemons and tools
/etc/nfsmount.conf				- nfs mount configuration file
/etc/request-key.d/id_resolver.conf		- nfs idmapper to map user id to names and vice-versa
/sbin/mount.nfs
/sbin/mount.nfs4
/sbin/nfsdcltrack
/sbin/rpc.statd
/sbin/umount.nfs
/sbin/umount.nfs4
/usr/lib/systemd/system-generators/nfs-server-generator
/usr/lib/systemd/system-generators/rpc-pipefs-generator
/usr/lib/systemd/system/auth-rpcgss-module.service
/usr/lib/systemd/system/fsidd.service
/usr/lib/systemd/system/nfs-blkmap.service
/usr/lib/systemd/system/nfs-client.target
/usr/lib/systemd/system/nfs-idmapd.service
/usr/lib/systemd/system/nfs-mountd.service
/usr/lib/systemd/system/nfs-server.service
/usr/lib/systemd/system/nfs-utils.service
/usr/lib/systemd/system/nfsdcld.service
/usr/lib/systemd/system/proc-fs-nfsd.mount
/usr/lib/systemd/system/rpc-gssd.service
/usr/lib/systemd/system/rpc-statd-notify.service
/usr/lib/systemd/system/rpc-statd.service
/usr/lib/systemd/system/rpc_pipefs.target
/usr/lib/systemd/system/var-lib-nfs-rpc_pipefs.mount
/usr/lib/udev/rules.d/60-nfs.rules
/usr/lib/udev/rules.d/99-nfs.rules
/usr/libexec/nfs-utils
/usr/libexec/nfsrahead
/usr/sbin/blkmapd		- The blkmapd daemon performs device discovery and mapping for the parallel NFS (pNFS) block layout client
/usr/sbin/exportfs		- The exportfs command makes local directories available for Network File System (NFS) clients to mount
/usr/sbin/fsidd
/usr/sbin/mountstats		- The mountstats command displays various NFS client statisitics for each given mountpoint
/usr/sbin/nfsconf		- The nfsconf command can be used to test for and retrieve configuration settings from a range of nfs-utils configuration files
/usr/sbin/nfsdcld		- nfsdcld is the NFSv4 client tracking daemon.
/usr/sbin/nfsdclddb		- The nfsdclddb command is provided to perform some manipulation of the nfsdcld sqlite database schema and to print the contents of the database
/usr/sbin/nfsdclnts
/usr/sbin/nfsidmap
/usr/sbin/nfsiostat
/usr/sbin/nfsref
/usr/sbin/nfsstat
/usr/sbin/rpc.gssd
/usr/sbin/rpc.idmapd
/usr/sbin/rpc.mountd
/usr/sbin/rpc.nfsd
/usr/sbin/rpcctl
/usr/sbin/rpcdebug
/usr/sbin/showmount
/usr/sbin/sm-notify
/usr/sbin/start-statd
/var/lib/nfs
/var/lib/nfs/etab
/var/lib/nfs/rmtab
/var/lib/nfs/rpc_pipefs
/var/lib/nfs/statd
/var/lib/nfs/statd/sm
/var/lib/nfs/statd/sm.bak
/var/lib/nfs/statd/state
/var/lib/nfs/v4recovery

Step2: Stop NFS Service

Let us now stop the default NFS service and try to configure it in our next steps after taking the backup of the NFS File share configruation.

$ cat ansible/roles/linux_nfs_stop_server/tasks/main.yml 
- name: ensure nfs service is stopped
  service:
    name: nfs-server
    state: stopped

Step3: Config Backup

Network filesystems are shared by exporting them from the NFS server. Exporting is done in Linux by adding entries into the /etc/exports file. Let's try to take a backup of this configuration file before making any changes.

$ cat ansible/roles/linux_nfs_config_backup/vars/main.yml 
---
nfs_config: "/etc/exports"
nfs_config_backup: "/mnt/backups"

$ cat ansible/roles/linux_nfs_config_backup/tasks/main.yml 
- name: ensure backup directory present
  file: 
    path: "{{ nfs_config_backup }}"
    state: directory
    mode: '0755'

- name: ensure nfs config backup
  shell: cp -pr "{{ nfs_config }}" "{{ nfs_config_backup }}"/exports_$(date +%F_%H_%M_%Z)

Step4: Sharing NFS Filesystem

Here in this step we are going to create a new user and group. The ownership of the NFS share directory which we want to export is configured with the new user that we just created. We are also creating a dummy file on our NFS share directory and configuring the "/etc/exports" as shown below.

$ cat ansible/roles/linux_nfs_config_update/vars/main.yml 
---
nfs_share_directory: "/share/stack"
nfs_other_directory: "/share/other"

$ cat ansible/roles/linux_nfs_config_update/templates/exports.j2 
{{ nfs_share_directory }} 192.168.121.0/24(ro)
{{ nfs_other_directory }} 192.168.121.0/24(rw)


$ cat ansible/roles/linux_nfs_config_update/tasks/main.yml 
- name: add group
  group:
    name: admin
    gid: 1001
    state: present

- name: add user
  user:
    name: admin
    uid: 1001
    comment: admin
    group: admin

- name: ensure share directory present
  file: 
    path: "{{ nfs_share_directory }}"
    state: directory
    mode: '0744'
    owner: admin
    group: admin

- name: ensure other directory present
  file: 
    path: "{{ nfs_other_directory }}"
    state: directory
    mode: '0744'
    owner: admin
    group: admin

- name: ensure share directory present
  shell: echo "Hello NFS Server Test!!" > "{{ nfs_share_directory }}"/hellonfs.txt; chown -R admin:admin "{{ nfs_share_directory }}"

- name: ensure other directory present
  shell: echo "Hello NFS Server Test in other!!" > "{{ nfs_other_directory }}"/hellonfsother.txt; chown -R admin:admin "{{ nfs_other_directory }}"

- name: configure nfs server
  template: 
    src: exports.j2
    dest: /etc/exports
    mode: '0644'

Step5: Start NFS Service

Now its time to start our NFS service. By rebooting the system or restarting the NFS service we essentially run exportfs commands which basically exports the NFS filesystem from the server that we want to share.

$ cat ansible/roles/linux_nfs_start_server/tasks/main.yml 
- name: ensure nfs service is started
  service:
    name: nfs-server
    state: started

Running the exportfs command after you change the exports file is a good idea. If any errors are in the file, exportfs identifies them for you.

# /usr/sbin/exportfs -a -r -v

Here is my complete project directory structure of the Vagrant and Ansible based NFS server that we will now launch using the vagrant utility as shown below.

$ tree .
.
├── ansible
│   ├── linux_nfs_provision_server.yml
│   └── roles
│       ├── linux_nfs_config_backup
│       │   ├── tasks
│       │   │   └── main.yml
│       │   └── vars
│       │       └── main.yml
│       ├── linux_nfs_config_update
│       │   ├── tasks
│       │   │   └── main.yml
│       │   ├── templates
│       │   │   └── exports.j2
│       │   └── vars
│       │       └── main.yml
│       ├── linux_nfs_install_server
│       │   └── tasks
│       │       └── main.yml
│       ├── linux_nfs_start_server
│       │   └── tasks
│       │       └── main.yml
│       └── linux_nfs_stop_server
│           └── tasks
│               └── main.yml
└── Vagrantfile

16 directories, 10 files

$ vagrant up

Step6: Mount the NFS Share (Client Machine)

Here in this step we will first try to list the NFS shares that are available on the FNS server using the showmount command as shown below.

$ sudo showmount -e fednfs.stack.com
Export list for fednfs.stack.com:
/share/other 192.168.121.0/24
/share/stack 192.168.121.0/24

Now here we will try to mount the NFS share "/share/stack" onto /var/tmp/sud local filesystem directory as shown below.

$ mkdir -p /var/tmp/stack
$ mkdir -p /var/tmp/other

$ sudo mount -t nfs fednfs.stack.com:/share/stack /var/tmp/stack/
$ sudo mount -t nfs fednfs.stack.com:/share/other /var/tmp/other/

$ sudo mount -t nfs4
fednfs.stack.com:/share/stack on /var/tmp/stack type nfs4 (rw,relatime,vers=4.2,rsize=262144,wsize=262144,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.121.1,local_lock=none,addr=192.168.121.13)
fednfs.stack.com:/share/other on /var/tmp/other type nfs4 (rw,relatime,vers=4.2,rsize=262144,wsize=262144,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=192.168.121.1,local_lock=none,addr=192.168.121.13)

If the mount is successful, you should be able to see the NFS share dummy file that we create available for us to read as shown below.

$ cat /var/tmp/stack/hellonfs.txt 
Hello NFS Server Test!!

$ cat /var/tmp/other/hellonfsother.txt 
Hello NFS Server Test in other!!

$ echo "Try to write to me" > /var/tmp/stack/hellonfs.txt
bash: /var/tmp/stack/hellonfs.txt: Read-only file system

$ echo "Try to write to me" > /var/tmp/other/hellonfsother.txt 
$ cat /var/tmp/other/hellonfsother.txt 
Try to write to me

Once we are done with our task we can just unmount the fileshare from our local filesystem as shown below.

$ sudo umount /var/tmp/stack 
$ sudo umount /var/tmp/other

Hope you enjoyed reading this article. Thank you..
