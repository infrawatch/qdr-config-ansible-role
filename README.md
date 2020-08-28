Role Name
=========

Config templates for deploying a QDR to OSP

Requirements
------------

None

Role Variables
--------------

See defaults/*

Dependencies
------------

None

Example Playbook
----------------

``` yaml
  - hosts: localhost
    remote_user: root
    roles:
      - '../../qdr-config-ansible-role'
    vars:
        qdr_some: thing
```

License
-------

Apache V2.0

Author Information
------------------

https://github.com/infrawatch/