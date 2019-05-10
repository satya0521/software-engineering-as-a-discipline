# Spring Framework

## Documentation

- <https://docs.spring.io/spring/docs/current/spring-framework-reference/index.html>
- <https://docs.spring.io/spring-boot/docs/current/reference/html/>
- <https://spring.io/projects/spring-data-jdbc>
- <https://cloud.spring.io/spring-cloud-static/Greenwich.RELEASE/multi/multi_spring-cloud.html>
- <https://cloud.spring.io/spring-cloud-sleuth/multi/spring-cloud-sleuth.html>
- <https://docs.spring.io/spring-security/site/docs/current/reference/html5/>
- <https://spring.io/projects/spring-restdocs>

## Notes

### Java Objects

[POJO (plain old Java object)](https://spring.io/understanding/POJO) is an object that has both atrributes and behavior.

JavaBean is a simple POJO whose only behavior is getters and setters. Should have a nullable constructor.

DTO is a JavaBean that functions as a transport of data from one layer to another. Doesn't need to have a nullable constructor.

### Application Context

ApplicationContext is a wrapper around bean factory.

Serves Spring bean definitions via a factory pattern to the application at runtime.

### Spring Boot

Spring Boot adds auto configuration and component scanning.

Automatic servlet mappings.

### Common Webservices in Microservices

- Gateway
- Authentication and Authorization
- Communication Service with template registartion

### Start a Spring Boot Project

1. <https://start.spring.io>
2. Spring CLI init

Programming Languages:

- Java
- Kotlin
- Groovy

JVM Version: 12, 11, 8

Build Tool:

- Maven
- Gradle

Packaging type: JAR, WAR

Group, Artifact, Name, Package Name, Description and Dependencies (DevTools, Lombok, Web, Data, Actuator, Sleuth, Zipkin) are other fields.

<https://docs.spring.io/spring-boot/docs/current/reference/html/using-boot-build-systems.html#using-boot-maven>

- <https://docs.spring.io/spring-boot/docs/current/reference/html/using-boot-build-systems.html#using-boot-dependency-management>
- <https://docs.spring.io/spring-boot/docs/2.1.4.RELEASE/maven-plugin/repackage-mojo.html>
- <https://maven.apache.org/plugins/maven-shade-plugin/>
- <https://www.mojohaus.org/exec-maven-plugin/>
- <https://maven.apache.org/plugins/maven-resources-plugin/examples/filter.html>
- <https://github.com/git-commit-id/maven-git-commit-id-plugin>

### Embedded Server

```properties
server.tomcat.accesslog.enabled=true
server.tomcat.basedir=.
```

### Spring Framework API

- [Spring Framework](https://docs.spring.io/spring/docs/current/javadoc-api/overview-summary.html)
  - [org.springframework.beans.factory.annotation](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/annotation/package-summary.html)
    - [org.springframework.beans.factory.annotation.Autowired](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Autowired.html)
  - [org.springframework.stereotype](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/stereotype/package-summary.html)
    - [org.springframework.stereotype.Service](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/stereotype/Service.html)
    - [org.springframework.stereotype.Controller](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/stereotype/Controller.html)
  - [org.springframework.web.bind.annotation](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/package-summary.html)
    - org.springframework.web.bind.annotation.RestController
    - [org.springframework.web.bind.annotation.RequestMapping](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestMapping.html)
    - [org.springframework.web.bind.annotation.RequestMethod](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestMethod.html)
    - org.springframework.web.bind.annotation.PathVariable
    - org.springframework.web.bind.annotation.RequestParam
  - [org.springframework.ui](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/ui/package-summary.html)
    - [org.springframework.ui.Model](https://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/ui/Model.html)

### Data

- Java EE
  - javax.persistence
    - javax.persistence.Entity
    - javax.persistence.Table
    - javax.persistence.Column
    - javax.persistence.Id
    - javax.persistence.GeneratedValue
    - javax.persistence.GenerationType
- Spring Data Core
  - org.springframework.data.repository
    - org.springframework.data.repository.Repository
    - org.springframework.data.repository.CrudRepository
    - org.springframework.data.repository.PagingAndSortingRepository

Resources:

resources/schema.sql and resources/data.sql

```properties
# JOOQ (JooqProperties)
spring.jooq.sql-dialect= # SQL dialect to use. Auto-detected by default.

# JDBC (JdbcProperties)
spring.jdbc.template.fetch-size=-1 # Number of rows that should be fetched from the database when more rows are needed.
spring.jdbc.template.max-rows=-1 # Maximum number of rows.
spring.jdbc.template.query-timeout= # Query timeout. Default is to use the JDBC driver's default configuration. If a duration suffix is not specified, seconds will be used.

# JPA (JpaBaseConfiguration, HibernateJpaAutoConfiguration)
spring.data.jpa.repositories.bootstrap-mode=default # Bootstrap mode for JPA repositories.
spring.data.jpa.repositories.enabled=true # Whether to enable JPA repositories.
spring.jpa.database= # Target database to operate on, auto-detected by default. Can be alternatively set using the "databasePlatform" property.
spring.jpa.database-platform= # Name of the target database to operate on, auto-detected by default. Can be alternatively set using the "Database" enum.
spring.jpa.generate-ddl=false # Whether to initialize the schema on startup.
spring.jpa.hibernate.ddl-auto= # DDL mode. This is actually a shortcut for the "hibernate.hbm2ddl.auto" property. Defaults to "create-drop" when using an embedded database and no schema manager was detected. Otherwise, defaults to "none".
spring.jpa.hibernate.naming.implicit-strategy= # Fully qualified name of the implicit naming strategy.
spring.jpa.hibernate.naming.physical-strategy= # Fully qualified name of the physical naming strategy.
spring.jpa.hibernate.use-new-id-generator-mappings= # Whether to use Hibernate's newer IdentifierGenerator for AUTO, TABLE and SEQUENCE.
spring.jpa.mapping-resources= # Mapping resources (equivalent to "mapping-file" entries in persistence.xml).
spring.jpa.open-in-view=true # Register OpenEntityManagerInViewInterceptor. Binds a JPA EntityManager to the thread for the entire processing of the request.
spring.jpa.properties.*= # Additional native properties to set on the JPA provider.
spring.jpa.show-sql=false # Whether to enable logging of SQL statements.

# DATASOURCE (DataSourceAutoConfiguration & DataSourceProperties)
spring.datasource.continue-on-error=false # Whether to stop if an error occurs while initializing the database.

spring.datasource.driver-class-name= # Fully qualified name of the JDBC driver. Auto-detected based on the URL by default.
spring.datasource.jmx-enabled=false # Whether to enable JMX support (if provided by the underlying pool).
spring.datasource.url= # JDBC URL of the database.
spring.datasource.username= # Login username of the database.
spring.datasource.password= # Login password of the database.
spring.datasource.jndi-name= # JNDI location of the datasource. Class, url, username & password are ignored when set.
spring.datasource.name= # Name of the datasource. Default to "testdb" when using an embedded database.
spring.datasource.generate-unique-name=false # Whether to generate a random datasource name.

spring.datasource.type= # Fully qualified name of the connection pool implementation to use. By default, it is auto-detected from the classpath.
spring.datasource.hikari.*= # Hikari specific settings
spring.datasource.tomcat.*= # Tomcat datasource specific settings
spring.datasource.dbcp2.*= # Commons DBCP2 specific settings

spring.datasource.platform=all # Platform to use in the DDL or DML scripts (such as schema-${platform}.sql or data-${platform}.sql).
spring.datasource.initialization-mode=embedded # Initialize the datasource with available DDL and DML scripts.
spring.datasource.sql-script-encoding= # SQL scripts encoding.
spring.datasource.separator=; # Statement separator in SQL initialization scripts.
spring.datasource.schema= # Schema (DDL) script resource references.
spring.datasource.schema-username= # Username of the database to execute DDL scripts (if different).
spring.datasource.schema-password= # Password of the database to execute DDL scripts (if different).
spring.datasource.data= # Data (DML) script resource references.
spring.datasource.data-username= # Username of the database to execute DML scripts (if different).
spring.datasource.data-password= # Password of the database to execute DML scripts (if different).
```

### Testing

#### Guides

- <https://spring.io/guides/gs/testing-web/>

#### Testing Libraries and Frameworks

- [JUnit](https://junit.org/): The de-facto standard for unit testing Java applications.
- [TestNG](https://testng.org): TestNG is a testing framework inspired from JUnit and NUnit but introducing some new functionalities that make it more powerful and easier to use.

- [Spring Test](https://docs.spring.io/spring/docs/5.1.6.RELEASE/spring-framework-reference/testing.html#integration-testing): Utilities and integration test support for Spring Boot applications.
- [Spring Boot Test](https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-testing.html): Utilities and integration test support for Spring Boot applications.

- [AssertJ](https://joel-costigliola.github.io/assertj/): A fluent assertion library.

- [Hamcrest](https://github.com/hamcrest/JavaHamcrest): A library of matcher objects (also known as constraints or predicates).

- [Mockito](https://mockito.github.io/): A Java mocking framework.
- [EasyMock](http://easymock.org/): Easy mocking. Better testing.
- [PowerMock](https://github.com/powermock/powermock): PowerMock is a framework that extends other mock libraries such as EasyMock with more powerful capabilities.

- [MockServer](http://www.mock-server.com/): MockServer can be used for mocking any system you integrate with via HTTP or HTTPS (i.e. services, web sites, etc).
- [WireMock](http://wiremock.org/): WireMock is a simulator for HTTP-based APIs. Some might consider it a service virtualization tool or a mock server.

- [JSONassert](https://github.com/skyscreamer/JSONassert): An assertion library for JSON.
- [JsonPath](https://github.com/jayway/JsonPath): XPath for JSON.

### Project Layout

```txt
next-gen-app
└── src
    └── main
        └── java
            └── com
                └── example
                    └── nextgenapp
                        ├── Application.java
                        ├── data
                        │   ├── entity
                        │   │   └── UserEntity.java
                        │   └── repository
                        │       └── UserRepository.java
                        ├── business
                        │   ├── domain
                        │   │   └── ActiveUserDomain.java
                        │   └── service
                        │       └── ActiveUserService.java
                        └── web
                            ├── application
                            │   └── UserController.java
                            └── service
                                └── UserRestController.java
```
