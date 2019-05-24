# Logging in a Spring Application

## Logging Infrastructure Architecture

| Product | Collector                  | Aggregator             | Indexer        | Storage | Frontend           |
| ------- | -------------------------- | ---------------------- | -------------- | ------- | ------------------ |
| Splunk  | Splunk Universal Forwarder | Splunk Heavy Forwarder | Splunk Indexer |         | Splunk Search Head |
| ELK     | Beats                      | LogStash               |                | Elastic | Kibana             |
| EFK     | Fluent Bit                 | Fluentd                |                | Elatic  | Kibana             |

## Data Exclusion

- <https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Logging_Cheat_Sheet.md#data-to-exclude>

### Delete from logging backends

- <https://docs.splunk.com/Documentation/Splunk/7.2.6/SearchReference/Delete>

## Log Injection-Tampering-Forging

## References

- <https://www.owasp.org/images/e/e0/OWASP_Logging_Guide.pdf>
- <https://www.owasp.org/index.php/Log_Injection>
- <https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Logging_Cheat_Sheet.md>
- <https://github.com/javabeanz/owasp-security-logging>

- <https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-logging.html>
- <https://docs.spring.io/spring-boot/docs/current/reference/html/howto-logging.html>
- <https://docs.spring.io/spring-boot/docs/current/reference/html/howto-embedded-web-servers.html#howto-configure-accesslogs>
- <https://cloud.spring.io/spring-cloud-sleuth/single/spring-cloud-sleuth.html#_log_correlation>

- <https://www.google.com/search?q=spring+log+masking>
