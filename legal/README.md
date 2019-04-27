# Legal

## Choose a license for project

Identify an appropriate license for your project and add it to the repo.

Following resources help in identifying a license:

- [choosealicense.com - Appendix](https://choosealicense.com/appendix)
- [opensource.google.com - Using](https://opensource.google.com/docs/using)

## License header for project code

Add license header to the project files.

Example:

```java
/*
 * Licensed to XXXXXXXX under one or more contributor
 * license agreements. See the NOTICE file distributed with
 * this work for additional information regarding copyright
 * ownership. XXXXXXXX licenses this file to you under
 * the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.example;

public static void main(String[] args) {
  System.out.println("This file has the source header");
}
```

Libraies that can be used to automate this task:

- Maven: https://github.com/mojohaus/license-maven-plugin

## License Reporting of third-party code

- <https://tldrlegal.com>
- <https://www.mojohaus.org/license-maven-plugin>

## Fail build if third-party code belongs to a blacklisted license
