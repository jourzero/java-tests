#!/bin/bash
export CLASSPATH=".:lib/commons-collections-3.2.2/commons-collections-3.2.2.jar"
set -x
javac Employee.java
javac SerializeDemo.java  
javac DeserializeDemo.java 
java SerializeDemo data/demo.bin
set +x

for filename in data/*.bin;do
    echo "-- Deserializing $filename..."
    java DeserializeDemo "$filename"
done
