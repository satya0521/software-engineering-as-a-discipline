# JSON

Read:

- <https://dzone.com/articles/jsonb-java-api-for-json-binding>

Table of Contents

- [JSON](#json)
  - [JSON Processing](#json-processing)
    - [JSON-P JSRs](#json-p-jsrs)
    - [Packages](#packages)
  - [JSON Binding](#json-binding)
    - [JSON-B JSRs](#json-b-jsrs)
  - [JSON in Spring Framework](#json-in-spring-framework)

## JSON Processing

### JSON-P JSRs

- [JSR 353](https://jcp.org/en/jsr/detail?id=353): [Java API for JSON Processing](https://javaee.github.io/json-processing-spec/)
  
  - Produce and consume JSON text in a streaming fashion (similar to StAX API for XML)
  
  - Build a Java object model for JSON text using API classes (similar to DOM API for XML)

- [JSR 374](https://www.jcp.org/en/jsr/detail?id=374): [Java API for JSON Processing 1.1](https://javaee.github.io/jsonp/)

  - Support for JSON Pointer and JSON Patch

    After the release of JSR 353, the specifications for [JSON Pointer](http://tools.ietf.org/html/rfc6901), [JSON Patch](http://tools.ietf.org/html/rfc6902) and [JSON Merge Patch](https://tools.ietf.org/html/rfc7396) have been released. This JSR will update JSON-P to provide support for these specifications.

  - Add editing/transformation operations to JSON object model

    The current JSON object model provides immutable JSON objects and arrays. It is useful to provide editing or transformation functionalities to the basic JSON processing.

    For a JSON object, an operation will be added to remove a name/value pair from the object. For a JSON array, operations will be added to insert, replace, or remove an entry of the array.

    The builder pattern will be used to handle these operations: a builder is created with the initial JSON object or array, the operations are carried out by the builder, and the edited object or array is finally converted to an immutable JSON object or array.

  - Update the API to work with Java SE 8

    Queries on JSON object model are currently possible, using Java SE 8's stream operations and lambda expressions. However, to make them truly useful and convenient, there is a need for Collectors that return JSON objects or arrays instead of Maps or Lists. This JSR will define some common and useful Collectors.

    It may also be useful to turn JSON parser events into a stream of events, so that SE 8's stream operations can be used.

### Packages

- <https://javaee.github.io/javaee-spec/javadocs/javax/json/package-summary.html>
- <https://javaee.github.io/javaee-spec/javadocs/javax/json/spi/package-summary.html>
- <https://javaee.github.io/javaee-spec/javadocs/javax/json/stream/package-summary.html>

## JSON Binding

Read:

- <https://developer.ibm.com/articles/j-javaee8-json-binding-4/>
- <https://www.eclipsecon.org/na2016/sites/default/files/slides/JSONB%20-%20EclipseCon%202016.pdf>

### JSON-B JSRs

- [JSR 367](https://www.jcp.org/en/jsr/detail?id=367): [Java API for JSON Binding (JSON-B)](https://javaee.github.io/jsonb-spec/)
  - <https://github.com/eclipse-ee4j/yasson> (reference implementation)
  - <https://github.com/apache/johnzon>
- <https://github.com/FasterXML/jackson>
- <https://github.com/google/gson>

## JSON in Spring Framework

<https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-json.html>

Jackson is the preferred and default library.
