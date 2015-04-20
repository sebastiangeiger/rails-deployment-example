# Chef

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
