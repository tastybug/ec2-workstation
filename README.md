# EC2 Workstation

Sets up an EC2 instance with a number of tools preinstalled. 

Prerequisites: Have docker installed; run it on Darwin or Linux.

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

