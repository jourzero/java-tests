#!/bin/bash
export CLASSPATH="/usr/local/openjdk-8/jre/lib/:."
export CLASSPATH="$CLASSPATH:lib/commons-collections-4-4.4"
export CLASSPATH="$CLASSPATH:lib/commons-collections-3.2.2"
set -x
javac Employee.java
javac SerializeDemo.java  
javac DeserializeDemo.java 
java SerializeDemo data/demo.bin
set +x

for filename in data/*.bin;do
    echo "-- Deserializing $filename..."
    java -cp $CLASSPATH DeserializeDemo "$filename"
done
