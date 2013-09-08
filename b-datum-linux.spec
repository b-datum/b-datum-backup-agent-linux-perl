Name: b-datum-linux		
Version: 0.23	
Release:	1%{?dist}
Summary: bdatum-linux	

Group:	Applications/Archiving
License: GPLv3
URL:	http://www.b-datum.com/	
Source: b-datum-linux-0.23.tar.gz
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires: perl-IO-Socket-SSL, perl-Net-SSLeay
Requires: perl-IO-Socket-SSL, perl-Net-SSLeay

%description
bdatum-linux backup and restore

%prep
%setup -q


%build


%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
/usr/local/bin/bdatum-backup
/usr/local/bin/bdatum-config
/usr/local/bin/bdatum-restore
/usr/

%doc



%changelog

