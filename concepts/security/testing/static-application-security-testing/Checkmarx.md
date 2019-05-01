# Checkmarx

Ref: [Checkmarx Knowledge Center](https://checkmarx.atlassian.net/wiki/spaces/KC/pages)

CxSAST takes source code to analyze and hence no compilation or build is necessary.

CxSAST supports Opens Source Analysis (OSA) enabling license and compliance management, vulnerabilites alerts, policy enforcement and reporting.

## User Interface

- CLI, API, CxAudit
- Eclipse, Visual Studio, IntelliJ
- Web Interface

## Integrations

Ref: <https://checkmarx.atlassian.net/wiki/spaces/KC/pages/3637264/Continuous+Integrating+with+CxSAST>

| Integration Type                               | Tools             |
| ---------------------------------------------- | ----------------- |
| Build Tools                                    | Apache Ant, Maven |
| Version Control System                         | Git, GitHub, TFS  |
| Continuous Integration Platform                | Jenkins, Bamboo   |
| Continuous Code Quality Inspection Platform    | SonarQube         |
| Issue Tracking and Project Management Software | JIRA              |
| Application Vulnerability Management Platform  | ThreadFix         |

## Monitoring

## General

- Project Name: Provide an appropriate Project Name for the project.
- Preset: The Preset will determine the scan rules for the project. Select the appropriate scanning Preset from the drop-down list.
- Configuration: Select the Configuration for the new project. For the trial version, it is advised to perform the default selection.
- Team: Select the Team for the new project. For the trial version, it is advised to perform the default selection.

## Location

- Source Control: project code that is maintained in either TFS , SVN , GIT or PerForce source control systems.
- Local: upload code as zip
- Shared: project code that is maintained on a network server accessible from the CxSAST Server.
- Source Pulling: an extension to "Shared" option above, "Source Pulling" activates a configurable script to pull source code from a source control system into the Shared location specified.

Files and folders can be excluded.

## Scheduling

Scans can be manually activated, periodically scheduled, or initiated by build by one of the integrated build system.

- None - defines no scheduling
- Now - defines an immediate scan
- By Schedule - define an automatic weekly scan according to the specified time
- Run on Weekdays - define which day to run the periodic scan
- Run Time - define what time to run the periodic scan.

## Advanced

- Send pre-scan email to - define to which e-mail to send a pre-scan notification
- Send post-scan e-mail to - define to which e-mail to send a post-scan notification
- Send scan failure e-mail to - define to which e-mail to send a scan failure notification
- Run post scan action - define which post scan action to run (see Configuring an Executable Action)
- Issue Tracking Settings - define to which issue tracking system to integrate (see Setting Up JIRA Integration).

## Custom Fields

## Data Retention
