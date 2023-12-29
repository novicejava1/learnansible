#!/bin/bash

adminuser="admin"
defaultpassword="admin"
adminpassword="admin@1234"
baseurl="http://fedsonar.stack.com"
enabled=true
gitlaburl="http://fedgitlab.stack.com"
appid="11faa63fd46921f90dae1652920cd510a812a99dd36dbc11b90bda4d9d1a28f9"
secret="gloas-ce20a0e6686073f7f7773d2493ed2fc8b763a3673dc2cfe35c497fe993d63979"
allowsignup=true

# Reset admin password
resetpassword()
{
	echo "Reset admin password"
	curl -u $adminuser:$defaultpassword -X POST "$baseurl/api/users/change_password?login=$adminuser&previousPassword=$defaultpassword&password=$adminpassword"
}

# Configure gitlab oauth client
configureoauth()
{
	echo "Configure oauth client settings"
	curl -u $adminuser:$adminpassword -X POST "$baseurl/api/settings/set?key=sonar.core.serverBaseURL&value=$baseurl"
	curl -u $adminuser:$adminpassword -X POST "$baseurl/api/settings/set?key=sonar.auth.gitlab.enabled&value=$enabled"
	curl -u $adminuser:$adminpassword -X POST "$baseurl/api/settings/set?key=sonar.auth.gitlab.url&value=$gitlaburl"
	curl -u $adminuser:$adminpassword -X POST "$baseurl/api/settings/set?key=sonar.auth.gitlab.applicationId.secured&value=$appid"
	curl -u $adminuser:$adminpassword -X POST "$baseurl/api/settings/set?key=sonar.auth.gitlab.secret.secured&value=$secret"
	curl -u $adminuser:$adminpassword -X POST "$baseurl/api/settings/set?key=sonar.auth.gitlab.allowUsersToSignUp&value=$allowsignup"
}



### To be carried out by admin user
#resetpassword
configureoauth

