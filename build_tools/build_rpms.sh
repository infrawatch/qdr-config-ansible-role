#! /bin/sh -l

ls
pwd

dnf install -y rpmdevtools git-core

rpmdev-setuptree

VERSION=${VERSION:-0}
RELEASE=${RELEASE:-0}
UPSTREAM_VERSION=${UPSTREAM_VERSION:-master}

# TODO: make upstream_version, release and specfile configurable
spectool -g --define "upstream_version ${UPSTREAM_VERSION}" --define "version 0" --define "release 0" --directory $HOME/rpmbuild/SOURCES/ qdr-config-ansible-role.spec

rpmbuild -bb --define "upstream_version ${UPSTREAM_VERSION}" --define "version ${VERSION}" --define "release ${RELEASE}" qdr-config-ansible-role.spec


if [ -d "/usr/share/ansible/roles/qdr_config" ]
then
	echo "Removing existing ansible-qdr-config package..."
	dnf -y remove ansible-qdr-config
fi

if [ -d "/usr/share/ansible/roles/qdr_config" ]
then
	echo "Forcibly removing ansible role qdr_config..."
	rm -rf /usr/share/ansible/roles/qdr_config	
fi

ls -R $HOME/rpmbuild

ls $HOME/rpmbuild/RPMS/noarch/

echo "Installing RPM..."
dnf install -y $HOME/rpmbuild/RPMS/noarch/ansible-qdr-config-${VERSION}-${RELEASE}.noarch.rpm

if [ ! -d "/usr/share/ansible/roles/qdr_config" ]
then
	echo "Directory /usr/share/ansible/roles/qdr_config does not exist"
	exit 1
else
	echo "qdr_config was successfully installed!"
fi

cp $HOME/rpmbuild/RPMS/noarch/ansible-qdr-config-${VERSION}-${RELEASE}.noarch.rpm /opt/
