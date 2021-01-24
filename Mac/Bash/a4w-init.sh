#!/usr/bin/env bash

tomcat=/Users/kevin/Documents/Servers/apache-tomcat-8.5.34
tomcat_lib=${tomcat}/lib

stp=/Users/kevin/NetBeans-to-Maven-Output/Smart-Tech-Pack

api=${stp}/co.a4w.api
api_jar=${api}/target/co.a4w.api-0.0.1-SNAPSHOT.jar

registry=${stp}/co.a4w.registry
registry_jar=${registry}/target/co.a4w.registry-0.0.1-SNAPSHOT.jar

store_manager=${stp}/store.a4w.manager
store_manager_jar=${store_manager}/target/store.a4w.manager-0.0.1-SNAPSHOT.jar

store_registry=${stp}/store.a4w.registry
store_registry_jar=${store_registry}/target/store.a4w.registry-0.0.1-SNAPSHOT.jar

if [ -f ${api_jar} ]; then
    cp ${api_jar} ${tomcat_lib}
    echo copied ${api_jar} to ${tomcat_lib}
fi

if [ -f ${registry_jar} ]; then
    cp ${registry_jar} ${tomcat_lib}
    echo copied ${registry_jar} to ${tomcat_lib}
fi

if [ -f ${store_manager_jar} ]; then
    cp ${store_manager_jar} ${tomcat_lib}
    echo copied ${store_manager_jar} to ${tomcat_lib}
fi

if [ -f ${store_registry_jar} ]; then
    cp ${store_registry_jar} ${tomcat_lib}
    echo copied ${store_registry_jar} to ${tomcat_lib}
fi
