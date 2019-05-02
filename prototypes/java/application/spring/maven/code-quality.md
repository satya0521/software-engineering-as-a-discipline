# Code Quality

- [Code Quality](#code-quality)
  - [Spotless](#spotless)
  - [JaCoCo](#jacoco)
  - [SonarQube](#sonarqube)

## Spotless

License: <https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)>

Usage example: <https://github.com/diffplug/spotless/tree/master/plugin-maven>

Goals:

```sh
mvn spotless:apply # applies the formatting
mvn spotless:check # bound to verify phase; checks for formatting errors
```

pom.xml:

```xml
<project>
    <properties>
        <spotless.version>0.8.3</spotless.version>
    </properties>
    <build>
        <plugins>
            <plugin>
                <groupId>com.diffplug.spotless</groupId>
                <artifactId>spotless-maven-plugin</artifactId>
                <version>${spotless.version}</version>
                <configuration>
                    <java>
                        <licenseHeader>
                            <!-- Specify either content or file, but not both -->
                            <content>/* Licensed under Apache-2.0 */</content>
                            <file>${basedir}/license-header</file>
                        </licenseHeader>
                        <!-- Specify either eclipse or googleJavaFormat, doesn't make sense to include both -->
                        <eclipse>
                            <file>${basedir}/eclipse-fmt.xml</file>
                            <!-- Optional, available versions: https://github.com/diffplug/spotless/tree/master/lib-extra/src/main/resources/com/diffplug/spotless/extra/config/eclipse_jdt_formatter -->
                            <version>4.7.1</version>
                        </eclipse>
                        <googleJavaFormat>
                            <!-- Optional, available versions: https://search.maven.org/artifact/com.google.googlejavaformat/google-java-format -->
                            <version>1.7</version>
                        </googleJavaFormat>
                        <removeUnusedImports/>
                        <importOrder>
                            <!-- Specify either order or file, but not both -->
                            <order>java,javax,org,com,</order>
                            <file>${basedir}/importOrder</file>
                        </importOrder>
                    </java>
                    <formats>
                        <!-- Define first formatter that operates on properties files -->
                        <format>
                            <includes>
                                <!-- Include all property files in "resource" folders under "src" -->
                                <include>src/**/resources/**/*.properties</include>
                            </includes>
                            <licenseHeader>
                                <!-- Specify either content or file, but not both -->
                                <content>/* Licensed under Apache-2.0 */</content>
                                <file>${basedir}/license-header</file>
                                <!-- conent until first occurrence of the delimiter regex will be interpreted as header section -->
                                <delimiter>#</delimiter>
                            </licenseHeader>
                            <!-- Files must end with a newline -->
                            <endWithNewline />
                            <!-- Specify whether to use tabs or spaces for indentation -->
                            <indent>
                                <!-- Specify either spaces or tabs -->
                                <spaces>true</spaces>
                                <tabs>true</tabs>
                                <!-- Specify how many spaces are used to convert one tab and vice versa. Defaults to 4 -->
                                <spacesPerTab>4</spacesPerTab>
                            </indent>
                            <!-- Trim trailing whitespaces -->
                            <trimTrailingWhitespace />
                            <!-- Specify replacements using search and replace -->
                            <replace>
                                <name>Say Hello to Mars</name>
                                <search>World</search>
                                <replacement>Mars</replacement>
                            </replace>
                            <!-- Specify replacements using regex match and replace -->
                            <replaceRegex>
                                <name>Say Hello to Mars from Regex</name>
                                <searchRegex>(Hello) W[a-z]{3}d</searchRegex>
                                <replacement>$1 Mars</replacement>
                            </replaceRegex>
                        </format>
                        <!-- Other formats can be defined here, they will be applied in the order specified -->
                    </formats>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```

## JaCoCo

License: <https://tldrlegal.com/license/eclipse-public-license-1.0-(epl-1.0)>

Usage example: <https://www.eclemma.org/jacoco/trunk/doc/examples/build/pom.xml>

Goals:

```sh
mvn clean verify
mvn clean site
```

pom.xml:

```xml
<project>
    <properties>
        <!-- https://search.maven.org/artifact/org.jacoco/jacoco-maven-plugin -->
        <jacoco.version>0.8.3</jacoco.version>
        <jacoco.skip>false</jacoco.skip>
        <jacoco.haltOnFailure>true</jacoco.haltOnFailure>
        <jacoco.classRatio>1.00</jacoco.classRatio>
        <jacoco.instructionRatio>0.90</jacoco.instructionRatio>
        <jacoco.methodRatio>0.95</jacoco.methodRatio>
        <jacoco.branchRatio>0.85</jacoco.branchRatio>
        <jacoco.complexityRatio>0.85</jacoco.complexityRatio>
        <jacoco.lineRatio>0.90</jacoco.lineRatio>
    </properties>
    <build>
        <plugins>
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>${jacoco.version}</version>
                <executions>
                    <execution>
                        <id>default-prepare-agent</id>
                        <goals>
                            <goal>prepare-agent</goal>
                        </goals>
                    </execution>
                    <execution>
                        <id>default-report</id>
                        <goals>
                            <goal>report</goal>
                        </goals>
                    </execution>
                    <execution>
                        <id>default-check</id>
                        <goals>
                            <goal>check</goal>
                        </goals>
                        <configuration>
                            <haltOnFailure>${jacoco.haltOnFailure}</haltOnFailure>
                            <!-- https://www.eclemma.org/jacoco/trunk/doc/check-mojo.html#rules -->
                            <rules>
                                <rule>
                                    <!-- Element types: BUNDLE, PACKAGE, CLASS, SOURCEFILE or METHOD -->
                                    <element>BUNDLE</element>
                                    <limits>
                                        <limit>
                                            <!-- Counters: INSTRUCTION, LINE, BRANCH, COMPLEXITY, METHOD, CLASS -->
                                            <counter>CLASS</counter>
                                            <!-- Limit value types: TOTALCOUNT, COVEREDCOUNT, MISSEDCOUNT, COVEREDRATIO, MISSEDRATIO -->
                                            <value>COVEREDRATIO</value>
                                            <minimum>${jacoco.classRatio}</minimum>
                                        </limit>
                                        <limit>
                                            <counter>INSTRUCTION</counter>
                                            <value>COVEREDRATIO</value>
                                            <minimum>${jacoco.instructionRatio}</minimum>
                                        </limit>
                                        <limit>
                                            <counter>METHOD</counter>
                                            <value>COVEREDRATIO</value>
                                            <minimum>${jacoco.methodRatio}</minimum>
                                        </limit>
                                        <limit>
                                            <counter>BRANCH</counter>
                                            <value>COVEREDRATIO</value>
                                            <minimum>${jacoco.branchRatio}</minimum>
                                        </limit>
                                        <limit>
                                            <counter>LINE</counter>
                                            <value>COVEREDRATIO</value>
                                            <minimum>${jacoco.lineRatio}</minimum>
                                        </limit>
                                        <limit>
                                            <counter>COMPLEXITY</counter>
                                            <value>COVEREDRATIO</value>
                                            <minimum>${jacoco.complexityRatio}</minimum>
                                        </limit>
                                    </limits>
                                </rule>
                            </rules>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
    <reporting>
        <plugins>
            <plugin>
                <groupId>org.jacoco</groupId>
                <artifactId>jacoco-maven-plugin</artifactId>
                <version>${jacoco.version}</version>
                <reportSets>
                    <reportSet>
                        <reports>
                            <!-- https://www.eclemma.org/jacoco/trunk/doc/report-mojo.html -->
                            <report>report</report>
                            <!-- https://www.eclemma.org/jacoco/trunk/doc/report-integration-mojo.html -->
                            <!-- <report>report-integration</report> -->
                            <!-- https://www.eclemma.org/jacoco/trunk/doc/report-aggregate-mojo.html -->
                            <!-- <report>report-aggregate</report> -->
                        </reports>
                    </reportSet>
                </reportSets>
            </plugin>
        </plugins>
    </reporting>
</project>
```

## SonarQube

License: <https://tldrlegal.com/license/gnu-lesser-general-public-license-v3-(lgpl-3)>

Sample project: <https://github.com/SonarSource/sonar-scanning-examples/tree/master/sonarqube-scanner-maven>

Goals:

```sh
mvn clean verify sonar:sonar -Dsonar.login=<token>
```

pom.xml:

```xml
<project>
    <properties>
        <sonar.version>3.6.0.1398</sonar.version>        <!-- https://search.maven.org/artifact/org.sonarsource.scanner.maven/sonar-maven-plugin -->
        <!-- <sonar.host.url></sonar.host.url> -->        <!-- defaults to http://localhost:9000 -->
        <!-- <sonar.login>mysecrettoken</sonar.login> -->        <!-- DO NOT CONFIGURE IT HERE -->
        <!-- <sonar.projectKey></sonar.projectKey> -->        <!-- defaults to <groupId>:<artifactId> -->
        <!-- <sonar.projectVersion></sonar.projectVersion> -->        <!-- defaults to <version> of project -->
        <!-- <sonar.projectBaseDir></sonar.projectBaseDir> -->        <!-- defaults to root of the project directory -->
        <sonar.skip>false</sonar.skip>        <!-- define in modules to be skipped -->
    </properties>
    <build>
        <build>
            <pluginManagement>
                <plugins>
                    <plugin>
                        <groupId>org.sonarsource.scanner.maven</groupId>
                        <artifactId>sonar-maven-plugin</artifactId>
                        <version>${sonar.version}</version>
                    </plugin>
                </plugins>
            </pluginManagement>
        </build>
    </build>
</project>
```
