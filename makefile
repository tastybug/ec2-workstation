# variables
AWS_ACCESS_KEY_ID := $(shell cat ~/.aws/credentials | grep "^aws_access.*" | sed 's/[\na-z_ =]*//')
AWS_SECRET_ACCESS_KEY := $(shell cat ~/.aws/credentials | grep "^aws_secret.*" | sed 's/[\na-z_ =]*//')
AWS_DEFAULT_REGION = us-east-1
ifeq ($(shell uname -s), Darwin)
	USER_HOME := /Users/$(shell whoami)
else
	USER_HOME := /home/$(shell whoami)
endif
ifeq ($(shell ! test -d $(USER_HOME)/.aws && echo missing), missing)
	$(error folder ~/.aws folder required)
endif
ifeq ($(shell ! test -f $(USER_HOME)/.ssh/id_rsa.pub && echo missing), missing)
	$(error file ~/.ssh/id_rsa.pub required)
endif
SSH_DIR := $(USER_HOME)/.ssh

# commands
SSH_ARG=-var="pubkey=${USER_HOME}/.ssh/id_rsa.pub"
TF=env AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) terraform
TF_INIT=$(TF) init
TF_PLAN=$(TF) plan $(SSH_ARG)
TF_APPLY=$(TF) apply $(SSH_ARG)
TF_DESTROY=$(TF) destroy $(SSH_ARG)

plan:
	$(TF_PLAN)
init:
	$(TF_INIT)
apply:
	$(TF_APPLY)
destroy:
	$(TF_DESTROY)
connect:
	ssh ubuntu@$(shell terraform output -raw instance_public_ip)
