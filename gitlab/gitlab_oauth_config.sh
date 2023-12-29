#!/bin/bash

oauthapp="sonarqube"
gitlaburl="http://fedgitlab.stack.com"
sonarurl="http://fedsonar.stack.com"
oauthscope="api read_user email"

# Create Oauth2 Client
echo "Create Oauth2 client application"
curl --request POST --header "PRIVATE-TOKEN: glpat-Wp1Jf3XRW91j9BX5E_6E" \
     --data "name=$oauthapp&redirect_uri=$sonarurl/oauth2/callback/gitlab&scopes=$oauthscope" \
     "$gitlaburl/api/v4/applications"

