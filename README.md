# EC2 Workstation

Sets up an EC2 instance with a number of tools preinstalled. 

Prerequisites: 
* terraform needs to be installed
* the user running this needs `~/.aws/credentials` to be present
* the user running this needs `~/.ssh/id_rsa.pub` to be present - it's the key that will be deployed as an authorized key; when in doubt, create a fresh key using `ssh-keygen`.
* supports Darwin and Linux.

## Running it

Everything is reachable via make:

```
make plan
make init
make apply
make destroy
make connect
```

After `apply`, you'll be presented with the IP. Connect with `make connect` for convenience.

## What gets installed to the workbench?

Check and adapt [provision.sh](./provision.sh).
