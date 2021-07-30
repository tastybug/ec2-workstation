# EC2 Workstation

Sets up an EC2 instance with a number of tools preinstalled. 

Prerequisites: 
* have docker installed (w/o having to run it as root)
* the user running this needs `~/.aws/credentials` to be present
* the user running this needs `~/.ssh/id_rsa.pub` to be present - it's the key that will be deployed as an authorized key
* supports Darwin and Linux.

## Running it

Everything is reachable via make:

```
make init
make apply
make destroy
```

After `apply`, you'll be presented with the IP. Connect with `ssh ubuntu@1.2.3.4`.

## What gets installed to the workbench?

Check and adapt [provision.sh](./provision.sh).

## Gotchas

* if docker is to be executed with root privileges, don't run `sudo make X`, otherwise the script expects `/root/.aws` to be present
