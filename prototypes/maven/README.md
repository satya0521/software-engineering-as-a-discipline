<!-- markdownlint-disable MD033 -->
# Apache Maven

Apache Maven is a software project management and comprehension tool.
Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.

- [Apache Maven](#apache-maven)
  - [Installation](#installation)
    - [System Requirements](#system-requirements)
    - [macOS](#macos)
  - [Understanding pom.xml and settings.xml](#understanding-pomxml-and-settingsxml)
    - [Remote Repository Configuration](#remote-repository-configuration)
  - [References](#references)

## Installation

### System Requirements

Maven 3.3+ require JDK 1.7 or above to execute - they still allow you to build against 1.3 and other JDK versions [by Using Toolchains](https://maven.apache.org/guides/mini/guide-using-toolchains.html).

Make sure you added the CA certificate to Java TrustStore if you are using a Maven repository that is using **self-signed certificate**.

### macOS

```sh
export http_proxy=$http_proxy https_proxy=$https_proxy
brew install maven
mvn -X | grep 'Maven home'
```

## Understanding pom.xml and settings.xml

pom.xml is project specific configuration that resides in your project directory.

settings.xml is user specific configuration that is read in order:

- global settings (required): `$M2_HOME/conf/settings.xml`
- user settings: `~/.m2/settings.xml`

global settings and user settings file location can be overridden with

```sh
mvn --global-settings $custom_global_settings_path --settings $custom_user_settings_path clean
## or
mvn -gs $custom_global_settings_path -s $custom_user_settings_path clean
```

### Remote Repository Configuration

It is not recommended to use `<repositories>`, `<pluginRepositories>` in pom.xml.
But, a project should be configured to run with zero configuration with providing the ability for the user to add external configuration.
Add a settings.xml (should not contain any sensitive info) to the project directory if your organization has a hosted Maven repository (Sonatype Nexus, JFrog Artifactory).

```txt
next-gen-maven-app
├── .gitignore
├── pom.xml
├── settings.xml
├── settings-local.xml
```

.gitignore

```.gitignore
settings-local.xml
```

[pom.xml](https://maven.apache.org/xsd/maven-4.0.0.xsd)

Do not use `distributionManagement` section if you are building an application.

Do not use `repositories` and `pluginRepositories` in pom.xml.

```xml
<project>
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>com.example</groupId>
        <artifactId>nextgenapp-parent</artifactId>
        <version>0.0.1</version>
    </parent>

    <groupId>com.example</groupId>
    <artifactId>nextgenapp</artifactId>
    <version>0.0.1-SNAPSHOT</version>

    <packaging>jar</packaging> <!-- war, ear, pom -->

    <name></name> <!-- The full name of the project -->
    <description></description> <!-- A detailed description of the project -->
    <url></url> <!-- The URL to the project's homepage -->
    <inceptionYear></inceptionYear> <!-- The year of the project's inception, specified with 4 digits. -->
    <organization>
        <name></name>
        <url></url>
    </organization>
    <licenses>
        <license>
            <name></name> <!-- The full legal name of the license -->
            <url></url> <!-- The official url for the license text -->
            <distribution></distribution> <!-- The primary method by which this project may be distributed -->
            <comments></comments> <!-- Addendum information pertaining to this license -->
        </license>
    </licenses>
    <developers>
        <developer><developer>
    </developers>
    <contributors>
        <contributor><contributor>
    </contributors>
    <mailingLists>
        <mailingList></mailingList>
    </mailingLists>

    <modules>
        <module></module>
    </modules>

    <scm> <!-- contains informations required to the SCM (Source Control Management) of the project -->
        <connection></connection> <!-- The source control management system URL that describes the repository and how to connect to the repository -->
        <developerConnection></developerConnection> <!-- Just like connection but for developers -->
        <tag></tag> <!-- The tag of current code. By default, it's set to HEAD during development -->
        <url></url> <!-- The URL to the project's browsable SCM repository, such as GitHub -->
    </scm>
    <issueManagement> <!-- Information about the issue tracking (or bug tracking) system used to manage this project. -->
        <system></system> <!-- The name of the issue management system, e.g. Bugzilla -->
        <url></url> <!-- URL for the issue management system used by the project. -->
    </issueManagement>
    <ciManagement>
        <system></system> <!-- The name of the continuous integration system -->
        <url></url> <!-- URL for the continuous integration system used by the project if it has a web interface -->
        <notifiers> <!-- Configuration for notifying developers/users when a build is unsuccessful, including user information and notification mode -->
            <notifier>
                <type>mail</type> <!-- The mechanism used to deliver notifications -->
                <sendOnError>true</sendOnError> <!-- Whether to send notifications on error -->
                <sendOnFailure>true</sendOnFailure> <!-- Whether to send notifications on failure -->
                <sendOnSuccess>true</sendOnSuccess> <!-- Whether to send notifications on success -->
                <sendOnWarning>true</sendOnWarning> <!-- Whether to send notifications on warning -->
                <address></address> <!-- Where to send the notification to - eg email address -->
                <configuration></configuration> <!-- Extended configuration specific to this notifier goes here -->
            </notifier>
        </notifiers>
    </ciManagement>
    <distributionManagement></distributionManagement> <!-- NOT RECOMMENDED FOR APPLICATIONS -->

    <properties></properties>
    <dependencyManagement> <!-- Section for management of default dependency information for use in a group of POMs. -->
        <dependencies> <!-- The dependencies specified here are not used until they are referenced in a POM within the group. This allows the specification of a 'standard' version for a particular dependency. -->
            <dependency>
            </dependency>
        </dependencies>
    </dependencyManagement>
    <dependencies></dependencies>

    <repositories></repositories> <!-- NOT RECOMMEDED IN pom.xml -->
    <pluginRepositories></pluginRepositories> <!-- NOT RECOMMEDED IN pom.xml -->

    <build></build>
    <reporting></reporting>

    <profiles></profiles>
</project>
```

[settings.xml](https://maven.apache.org/xsd/settings-1.1.0.xsd)

settings-local.xml

## References

- <https://maven.apache.org/>
