### Equivs

Equivs is a Fake *.deb creator to avoid dpkg and apt dependency issues.

**Example:** I had python build from source but NodeJS desperately needs python3-minimal. So with **Equivs** just created dummy package that provides python3-minimal, so NodeJS dependencies are satisfied.

### Commands
  * `equivs-control` :  Creates a file to edit which will be build at next step.

    * Ex: `equivs-control dummy-python`

  * `equivs-build` :    Builds your dummy package and creates *.deb file in same folder.
  
    * Ex: `equivs-build dummy-python`

### Install

```
docker run -d \
        --name Equivs \
        yanik39/equivs:latest
```

### Usage

```
docker exec -it Equivs /bin/bash

cd /tmp

equivs-control somedumypackagename

nano somedummypackagename

equivs-build somedummypackagename

dpkg -i somedummypackagename.deb
```

### Working Example

```
Section: misc
Priority: optional
Standards-Version: 3.9.2

Package: dummy-python
Version: 3.9.2
Provides: python3-minimal
Architecture: all
```    

### Default output file of `equivs-control`

```
### Commented entries have reasonable defaults.
### Uncomment to edit them.
# Source: <source package name; defaults to package name>
Section: misc
Priority: optional
# Homepage: <enter URL here; no default>
Standards-Version: 3.9.2

Package: <package name; defaults to equivs-dummy>
# Version: <enter version here; defaults to 1.0>
# Maintainer: Your Name <yourname@example.com>
# Pre-Depends: <comma-separated list of packages>
# Depends: <comma-separated list of packages>
# Recommends: <comma-separated list of packages>
# Suggests: <comma-separated list of packages>
# Provides: <comma-separated list of packages>
# Replaces: <comma-separated list of packages>
# Architecture: all
# Multi-Arch: <one of: foreign|same|allowed>
# Copyright: <copyright file; defaults to GPL2>
# Changelog: <changelog file; defaults to a generic changelog>
# Readme: <README.Debian file; defaults to a generic one>
# Extra-Files: <comma-separated list of additional files for the doc directory>
# Links: <pair of space-separated paths; First is path symlink points at, second is filename of link>
# Files: <pair of space-separated paths; First is file to include, second is destination>
#  <more pairs, if there's more than one file to include. Notice the starting space>
Description: <short description; defaults to some wise words>
 long description and info
 .
 second paragraph

```


