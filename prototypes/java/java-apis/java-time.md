# Java Time APIs

java.time is available from Java SE 8, Android (>= 26) and JDBC 4.2.

These APIs are immutable and thread-safe.

- [java.base](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/module-summary.html) module defines the foundational APIs of the Java SE Platform.
  - [java.time](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/time/package-summary.html) is the main API for dates, times, instants, and durations.
  - [java.time.format](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/time/format/package-summary.html) provides classes to print and parse dates and times.
  - [java.time.zone](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/time/zone/package-summary.html) adds support for time-zones and their rules.
  - [java.time.chrono](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/time/chrono/package-summary.html) is a Generic API for calendar systems other than the default ISO.
  - [java.time.temporal](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/time/temporal/package-summary.html) provides access to date and time using fields and units, and date time adjusters.

Java Specification Request: <https://jcp.org/en/jsr/detail?id=310>

Good reads:

- <https://stackoverflow.com/a/32443004>

## Examples

```java
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZonedDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Set;

// *Moment* => Instant, OffsetDateTime, ZonedDateTime

// instant generation

Instant instant = Instant.now(); // Get current UTC timestamp
Instant.now().truncatedTo(ChronoUnit.MILLIS); // Truncate to millis

Instant epochInstant = Instant.ofEpochMilli(1557067472000L); // get instant from epoch seconds
long epoch = epochInstant.toEpochMilli();

Instant parsedInstant = Instant.parse("2019-05-05T14:44:32.00Z"); // parse CharSequence
parsedInstant.toString();

// time math

Instant futureInstant = Instant.now().plusSeconds(120); // add time to current time
Instant pastInstant = Instant.now().minusSeconds(120); // minus time to current time

// comparisons

boolean isEqualInstant = epochInstant.equals(parsedInstant);
int instantCompared = futureInstant.compareTo(pastInstant);
boolean isAfterInstant = futureInstant.isAfter(pastInstant);
boolean isBeforeInstant = pastInstant.isBefore(futureInstant);

// offset and zone

OffsetDateTime offsetDateTime = instant.atOffset(ZoneOffset.ofHours(1)); // offset time

Set<String> availableZoneIds = ZoneId.getAvailableZoneIds(); // list of available zone ids
ZonedDateTime zonedDateTime = instant.atZone(ZoneId.of("US/Pacific")); // zone time account day light saving information

// formatting

DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy MM dd");
String text = instant.format(formatter);

// *LocalDateTime* date and time of the day without any offset or zone information

LocalDateTime.now();
LocalDateTime.ofInstant(Instant.now(), ZoneId.of("UTC"))
LocalDateTime.ofInstant(Instant.now().truncatedTo(ChronoUnit.MILLIS), ZoneId.of("UTC"));
```
