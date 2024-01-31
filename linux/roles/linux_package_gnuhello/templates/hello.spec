Name:           {{gnu_hello_package_name}}
Version:        {{gnu_hello_package_version}}
Release:        %autorelease
Summary:        Produces a familiar, friendly greeting

License:        GPL-3.0-or-later
URL:            http://ftp.gnu.org/gnu/%{name}
Source:         http://ftp.gnu.org/gnu/%{name}/%{name}-%{version}.tar.gz

BuildRequires:  bash
BuildRequires:  coreutils
BuildRequires:  gcc
BuildRequires:  gettext
BuildRequires:  glibc-common
BuildRequires:  make
BuildRequires:  sed

%description
The GNU Hello program produces a familiar, friendly greeting. Yes, this is
another implementation of the classic program that prints "Hello, world!" when
you run it.

%prep
%autosetup
mv THANKS THANKS.old
iconv --from-code=ISO-8859-1 --to-code=UTF-8 --output=THANKS THANKS.old

%build
%configure \
    --enable-nls \
    --disable-rpath
%make_build

%install
%make_install
test -f %{buildroot}/%{_infodir}/dir && rm %{buildroot}/%{_infodir}/dir
%find_lang %{name}

%check
make check

%files -f %{name}.lang
%{_mandir}/man1/hello.1.*
%{_infodir}/hello.info.*
%{_bindir}/hello
%doc AUTHORS ChangeLog NEWS README THANKS TODO
%license COPYING

%changelog
%autochangelog