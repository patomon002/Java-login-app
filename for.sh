#!/bin/bash

for log in ~/devops/project1/java-login-app/*.log

do

   tar -czvf $log.tar.gz $log

done



