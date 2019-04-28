# Git

## Installation

### macOS

Git is installed along with Xcode.

Verify installation by running `git --version`.

## Configuration

### Levels of git configuration

`$GIT_DIR=$PROJDIR/.git`

| Level         | Config          | Git ignore                                                                                                                                                                                                                                                                                        | Hooks           |
| ------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| System        | /etc/gitconfig  |                                                                                                                                                                                                                                                                                                   |                 |
| Global        | ~/.gitconfig    | ~/.gitignore_global                                                                                                                                                                                                                                                                               |                 |
| Project       |                 | $PROJ_DIR/.gitignore :: Patterns which should be version-controlled and distributed to other repositories via clone (i.e., files that all developers will want to ignore) should go into a .gitignore file.                                                                                       |                 |
| Git Directory | $GIT_DIR/config | $GIT_DIR/info/exclude :: Patterns which are specific to a particular repository but which do not need to be shared with other related repositories (e.g., auxiliary files that live inside the repository but are specific to one user's workflow) should go into the $GIT_DIR/info/exclude file. | $GIT_DIR/hooks/ |
| Shell         |                 | Patterns read from the command line for those commands that support them.                                                                                                                                                                                                                         |                 |

Lower levels overrides the values in higher levels.

Git config and hooks cannot be included in the version control.

### Sample configuration

```bash
git config --global user.name "`id -F $whoami`"
git config --global user.email "`whoami`@example.com"

git config --global credential.helper osxkeychain

## Proxy
git config --global http.proxy http://proxy.example.com:80

## SSL
# configure http.sslCAPath for a site if you encounter an SSL error

touch ~/.gitignore_global # https://gist.github.com/octocat/9257657
git config --global core.excludesfile '~/.gitignore_global'
```

## Workflows

- [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/)
- [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Gitlab Flow](https://docs.gitlab.com/ee/workflow/gitlab_flow.html)
- Bitbucket
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
