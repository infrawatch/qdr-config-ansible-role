%global srcname qdr_config_ansible_role
%global rolename qdr-config

%{!?version: %global version 0.1}
%{!?release: %global release 1}

%{!?upstream_version: %global upstream_version %{version}%{?milestone}}

Name:           ansible-role-%{rolename}
Version:        %{version}
Release:        %{release}
Summary:        Ansible role for creating qdr configs

Group:          TODO
License:        ASL 2.0
URL:            https://github.com/infrawatch/qdr-config-ansible-role
Source0:        https://github.com/infrawatch/qdr-config-ansible-role/archive/%{upstream_version}/qdr-config-ansible-role-%{upstream_version}.tar.gz

BuildArch:      noarch
BuildRequires:  git-core

Requires:       python3dist(ansible)

%description

Ansible role for creating qdr configs

%prep
%autosetup -n qdr-config-ansible-role-%{upstream_version} -S git


%build


%install
mkdir -p  %{buildroot}%{_datadir}/ansible/roles/qdr_config
cp -r ./* %{buildroot}%{_datadir}/ansible/roles/qdr_config


%files
%doc README*
%license LICENSE
%{_datadir}/ansible/roles/qdr_config
%exclude %{_datadir}/ansible/role/qdr_config/tests/*

%changelog

