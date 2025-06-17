# roo-code-config

Configuration files and sync utilities for the Roo-Code project.

## Project Purpose

This repository maintains the configuration files and synchronization scripts for the Roo-Code development environment. It ensures consistent setup across installations by providing:

- Standardized configuration presets
- Automated sync scripts
- Version-controlled environment settings

## Setup Instructions

### Prerequisites
- Bash shell
- rsync utility
- Sibling directory `../roo-code` containing source files

## Script Functionality

The `copy-official-roo-code-config-files.sh` script:

1. Verifies existence of source directory (`../roo-code`)
2. Uses rsync to copy:
   - `.roomodes` file
   - `.roo` directory (recursive)
3. Updates "Last Updated" timestamp in README.md
4. Exits with error code if any operation fails

```bash
./copy-official-roo-code-config-files.sh
```

## Recent Changes

Last Updated: Tue Jun 17 13:31:52 IST 2025