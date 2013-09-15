
%define pkgversion 1
%define maketest 1
%define rpmversion %(grep 'VERSION =' src/bdatum-backup | perl -nle '/([0-9.]+)/ && print $1')

Name:		b-datum
Version:	%{rpmversion}	
Release:	1%{?dist}
Summary:	Provides tools for backup and restore files with b-datum.com	
Group:		Applications/Archiving
License:	GPLv3
URL:		http://www.b-datum.com/	
Vendor:		Thiago Rondon <thiago@b-datum.com>
Packager:	Thiago Rondon <thiago@b-datum.com>

Source:		b-datum-%{version}.tar.gz
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires:	perl-IO-Socket-SSL, perl-Net-SSLeay
Requires:	dialog, perl-IO-Socket-SSL, perl-Net-SSLeay
AutoReqProv:	no
BuildArch:	noarch

%description
Provides tools for backup and restore files with b-datum.com

%prep
%setup -q


%build
%{__perl} Makefile.PL PREFIX=/usr

%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
/usr/bin/bdatum-backup
/usr/bin/bdatum-config
/usr/bin/bdatum-restore

%doc Changes README.md


%changelog

