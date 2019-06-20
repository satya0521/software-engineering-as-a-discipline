# Active Directory

- [Active Directory](#active-directory)
  - [Infrastructure](#infrastructure)
    - [Ports](#ports)
    - [Binding](#binding)
    - [Search Base](#search-base)
  - [Implementations](#implementations)
    - [Node.js](#nodejs)
    - [Java](#java)

## Infrastructure

### Ports

- TCP/UDP: 389
- SSL/TLS: 636

### Binding

<https://ldap.com/the-ldap-bind-operation/>

### Search Base

## Implementations

### Node.js

index.js

```js
const url = 'ldaps://ldap.example.com:636';
const dn = 'CN=service_account,OU=Special Accounts,OU=ISO,DC=example,DC=com';
const password = 'service_account_password';
const searchBase = 'dc=example,dc=com';

const ldap = require("ldapjs"); // npm i --save ldapjs

var client = ldap.createClient({
  url: url,
});

client.bind(dn, password, function(err, data) {
  console.log(err);
  console.log(data);
});

client.unbind(function(err) {
  console.log(err);
});
```

```bash
export NODE_EXTRA_CA_CERTS=/usr/local/etc/openssl/certs/ExampleRootCA.crt
node index.js
```

### Java

LDAPTest.java

```java
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

public class LDAPTest {
  public static void main(String[] args) {
    // properties
    final String ldapAdServer = "ldaps://visacorpadoce01.visa.com:636";
    final String ldapUsername = "CN=SVC_YOUR_TEAM,OU=Special Accounts,OU=ISO,DC=visa,DC=com";
    final String ldapPassword = "SVC_YOUR_TEAM_PASSWORD";
    final String searchBase = "dc=example,dc=com";

    // business logic
    Hashtable<String, Object> env = new Hashtable<String, Object>();
    env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    env.put(Context.PROVIDER_URL, ldapAdServer);
    env.put(Context.SECURITY_PRINCIPAL, ldapUsername);
    env.put(Context.SECURITY_CREDENTIALS, ldapPassword);

    try {
      LdapContext ctx = new InitialLdapContext(env, null);
    } catch (NamingException e) {
      e.printStackTrace();
    }
  }
}
```

```sh
keytool -importcert \
    -trustcacerts \
    -keystore "$(/usr/libexec/java_home)/lib/security/cacerts" \
    -storepass "changeit" \
    -alias "ExampleRootCA" \
    -file "/usr/local/etc/openssl/certs/ExampleRootCA.crt"
javac LDAPTest.java && java LDAPTest
```
