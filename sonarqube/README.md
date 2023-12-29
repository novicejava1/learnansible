# SonarQube Scan

$ ./gradlew -Dsonar.host.url=http://fedsonar.stack.com -Dsonar.login=admin -Dsonar.password="changeed_password" -Dsonar.qualitygate.wait=true sonar --stacktrace --info