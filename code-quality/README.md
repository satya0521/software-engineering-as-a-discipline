# Code Quality

## Static Analysis

Ref: <https://docs.sonarqube.org/latest/analysis/external-issues/>

Java:

- Checkstyle
- PMD
- SpotBugs

## Test execution

Ref: <https://docs.sonarqube.org/latest/analysis/coverage/>

Java:

- JUnit

## Test coverage

Ref: <https://docs.sonarqube.org/latest/analysis/coverage/>

Java:

- JaCoCo

## Quality Gates

### Build Tool Integration

Code quality tools can and are integrated into build tools.
Builds can be set to fail if the code doesn't pass the quality checks.
Code quality tools can be integrated with VCS and CI; these integrations should be secondary.

### Git Commit Hooks

### CI Build failure

### Merge Check for Pull Request

## Reporting

### Pull Request Decoration

Ref: <https://docs.sonarqube.org/latest/analysis/pull-request/>

### Code Quality Dashboard

Ref: <https://www.sonarqube.org/>
