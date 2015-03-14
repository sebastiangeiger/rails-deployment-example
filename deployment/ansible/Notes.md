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

  * `ansible -i hosts -m ping` should be a success

# Requirements

  * Ruby 2.1.3 from source


# Ansible
  * Push to servers: `ansible-playbook playbook.yml -i hosts`
