# Chef

## Dependency Graph

  - Running Rails App
    - Database connection
      - Managed secrects
      - PostgreSQL installed
      - PostgreSQL process running
    - Running App server
      - Correct version of ruby
      - Source files in the right place
        - git
      - Correct gems installed
        - bundle install
          - bundler
        - PG development headers
      - App server process

## TDDing infrastructure with test-kitchen
  - `chef generate cookbook` already creates a `.kitchen.yml` and a `Berksfile`
  - Create a cookbook that:
    - installs ruby 2.1.6
    - installs postgres 9.1
    - runs postgres as postgres user
    - deploy code from github repository

### Speed up tests
  - https://github.com/sebastiangeiger/fast-kitchen-box
  - Install more of the serverspec gems into the box?

### Misc
  - `sudo su` then `su deploy`

### Sources

  - http://chr4.org/blog/2013/07/31/chef-deploy-revision-and-capistrano-git-style/
  - https://gist.github.com/finack/2055725
  - https://docs.chef.io/resource_gem_package.html
  - http://railscasts.com/episodes/335-deploying-to-a-vps
  - https://docs.chef.io/resource_deploy.html
  - http://serverspec.org/resource_types.html
  - https://github.com/3ofcoins/chef-cookbook-ruby-ng
