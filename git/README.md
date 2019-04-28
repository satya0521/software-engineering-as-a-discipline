# Git

## Workflows

- [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/)
- [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Gitlab Flow](https://docs.gitlab.com/ee/workflow/gitlab_flow.html)
- BitBucket
  - [Centralized Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows#centralized-workflow)
  - [Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)
  - [Gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
  - [Forking Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow)
- [Git at Microsoft](https://docs.microsoft.com/en-us/azure/devops/repos/git/git-branching-guidance)

## Branching Strategy

There is no one-size-fits-all branching strategy.

### Branch types

- Continuous integration branch (master or develop)
- Feature branches: for development purposes
- Release branches: for release, maintenance and hotfix purposes
  - Bugfix branches: bug fixes in release branches
  - Hotfix branches: quick fix for production release

### Dimensions to choose a branching strategy

- Team size:
  - One-pizza team
  - Two-pizza team
  - Unbounded team
- Change frequency: Back-end code changes are slow compared to front-end code changes (everyone has their own favorite colors).
- Versioning
  - Library: Versioning is derived from the binary version
  - Back-end application: Versioning is derived from the API endpoint
- Testing
  - Automated testing
  - Manual testing
    - Dev testing
    - QA testing

### Common concerns to address in a branching strategy

- Take a feature out from a release.
  Following are some of the options ranging from easy to hard
  - Version Compatibility: Maintain version compatibility using automated tests
  - Feature toggles: Disable a feature using toggles (<https://martinfowler.com/articles/feature-toggles.html>)
  - Cherry-picking: Repo manager has to cherry-pick commits that will go into a release
- Testing a feature in staging environment before merging
  Following are some of practices that the development team should invest in
  - Containers make the binary portable and should keep it environment-agnostic
  - Embedded database should be used for staged testing before merging
  - Use database automation tools like Flyway, Liquibase
