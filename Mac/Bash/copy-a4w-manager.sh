tomcat=/Users/kevin/Documents/Servers/apache-tomcat-8.5.34
tomcat_webapps=${tomcat}/webapps

stp=/Users/kevin/NetBeans-to-Maven-Output/Smart-Tech-Pack
binary_name=stp-manager-0.0.1-SNAPSHOT

manager=${stp}/stp-manager
manager_jar=${manager}/target/${binary_name}.war

read -p "Delete webapps/${binary_name} folder? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  rm -rf ${tomcat_webapps}/${binary_name}
  echo deleted folder ${tomcat_webapps}/${binary_name}
    # [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

if [ -f ${manager_jar} ]; then
    cp ${manager_jar} ${tomcat_webapps}
    echo copied ${manager_jar} to ${tomcat_webapps}
fi
