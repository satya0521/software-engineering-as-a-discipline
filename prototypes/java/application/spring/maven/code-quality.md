# Code Quality

## JaCoCo

License: <https://tldrlegal.com/license/eclipse-public-license-1.0-(epl-1.0)>

Usage example: <https://www.eclemma.org/jacoco/trunk/doc/examples/build/pom.xml>

Goals:

- `mvn clean verify`
- `mvn clean site`

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
