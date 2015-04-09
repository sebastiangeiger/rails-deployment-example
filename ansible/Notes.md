# Getting setup

  * Generate a droplet using `tugboat create rails-server --image 9801951 --region 8`
  * Add an entry to `~/.ssh/config`

```
Host rails-server
  HostName xxx.xxx.xxx.xxx
  User root
  ForwardAgent yes
  IdentityFile ~/.ssh/id_rsa
```

  * Make sure you can `ssh rails-server` with publickey

  * `ansible -i hosts -m ping rails-server` should be a success

# Requirements

  * Ruby 2.1.3 from source
  * Running Redis server


# Ansible
  * Push to servers: `ansible-playbook playbook.yml -i hosts`


## Jargon

  * A `playbook` determines what should be installed
  * A `task` allows you to take a part from a `playbook` and break it out into
    it's own component. Playbooks include tasks to get their functionality.
  * A `handler` is a specialized `task`
## Questions

  * task vs. role in ansible?
  * Can I use test-kitchen to TDD the infrastructure?
