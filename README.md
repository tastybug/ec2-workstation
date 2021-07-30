# Toolbox VM

Sets up an EC2 instance with a number of tools preinstalled. See [provision.sh](./provision.sh) to see whats being installed.

Prerequisites: Have docker installed; run it on Darwin or Linux.

Everything is reachable via make:

```
make init
make apply
make destroy
```
