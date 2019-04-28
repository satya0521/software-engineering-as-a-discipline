<!-- markdownlint-disable MD033 -->

# Java

## Java Build Selection

| Dimension        | OpenJDK Java Development Kit                                                                         | Oracle Java Standard Edition Development Kit                                                                                                                           |
| ---------------- | ---------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| URL              | <https://jdk.java.net/>                                                                              | <https://www.oracle.com/technetwork/java/javase/overview/index.html>                                                                                                   |
| License          | <http://openjdk.java.net/legal/gplv2+ce.html>                                                        | <https://www.oracle.com/technetwork/java/javase/terms/license/javase-license.html> <br> <https://www.oracle.com/technetwork/java/javase/overview/oracle-jdk-faqs.html> |
| Decoding License | Free to use for development and commercial use.                                                      | Permitted to use at free of cost for Development Use.                                                                                                                  |
| Support Roadmap  | <https://blogs.oracle.com/java-platform-group/update-and-faq-on-the-java-se-release-cadence>         | <https://www.oracle.com/technetwork/java/java-se-support-roadmap.html> <br> <https://www.oracle.com/support/lifetime-support/>                                         |
| Differences      | <https://blogs.oracle.com/java-platform-group/oracle-jdk-releases-for-java-11-and-later>             |
| Recommendation   | Start your new projects with version >= 11 and upgrade to new releases to reduce the feature parity. | Start your development with version >= 11 and stick to LTS for production support.                                                                                     |

## Installation

### Patch-in-Place Installation

| OS    | OpenJDK                                                                                            | Oracle JDK                                                                                               |
| ----- | -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| macOS | `brew cask install java` <br> `echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> $HOME/.bashrc` | `brew cask install oracle-jdk` <br> `echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> $HOME/.bashrc` |

### Static installation

<https://docs.oracle.com/javase/7/docs/webnotes/install/mac/mac-jdk.html>

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home

To run a different version of Java, either specify the full path, or use the java_home tool:

`/usr/libexec/java_home -v 1.7.0_06 --exec javac -version`

### IDE

### Docker Images

- OpenJDK
  - v12: <https://hub.docker.com/_/openjdk>
  - v8: <https://hub.docker.com/_/java>
- Oracle Java SE
  - v8: <https://hub.docker.com/_/oracle-serverjre-8>

## TrustStore

Ref: <https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html>

```bash
## take a backup of the original cacerts that comes with Java installation.
sudo cp $(/usr/libexec/java_home)/jre/lib/security/cacerts $(/usr/libexec/java_home)/jre/lib/security/cacerts_bkp_$(date +%F)

# download Certificate Authority (CA) certificate; assuming the location to be ca_certificate_location
root_certificate_location='add ca certificate location here'
root_certificate_alias='add an alias for ca certificate here'

## import the root certificate
sudo keytool -importcert -trustcacerts -keystore "$(/usr/libexec/java_home)/jre/lib/security/cacerts" -storepass "changeit" -alias "$root_certificate_alias" -file "$root_certificate_location"
```

## Proxy

Ref: <https://docs.oracle.com/javase/8/docs/technotes/guides/net/proxies.html>

| Protocol | Example                                                                                                                         |
| -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| HTTP     | java **-Dhttp.proxyHost=webcache.example.com -Dhttp.proxyPort=8080 -Dhttp.nonProxyHosts="localhost\|host.example.com"** GetURL  |
| HTTPS    | java **-Dhttps.proxyHost=webcache.example.com -Dhttps.proxyPort=443 -Dhttp.nonProxyHosts="localhost\|host.example.com"** GetURL |
| FTP      | java **-Dftp.proxyHost=webcache.example.com -Dftp.proxyPort=8080 -Dftp.nonProxyHosts="localhost\|host.example.com"** GetURL     |
