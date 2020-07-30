# _topdir is defined when rpmbuild is called by packageRPM script
%define name           gemini
%define release        1
%define version        %(git symbolic-ref --short HEAD)
%define buildroot      %{_topdir}/%{name}-%{version}-root
%define _unpackaged_files_terminate_build 0

BuildRoot:             %{buildroot}

Summary:               GEMINI application makes some stuff easier!
License:               DoD - UNCLASS, Distribution D, FOUO
Name:                  %{name}
Version:               %{version}
Release:               %{release}
Source:                %{name}_%{version}.tar.gz
Group:                 Development/Tools

%description
GEMINI application developed by Brian Dillon, V53

%prep

%build

%install
scp -r ../SOURCES/* %{buildroot}

%files
/opt/GEMINI/*

%postun
rm -rf /opt/GEMINI
