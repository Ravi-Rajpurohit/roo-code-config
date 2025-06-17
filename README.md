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

## Usage

### Sync Official Configuration Files

Use `copy-official-roo-code-config-files-here.sh` to update your local config with official files:

```bash
./copy-official-roo-code-config-files-here.sh
```

**Features:**
- Copies `.roomodes` and `.roo` directories from `../roo-code`
- Verifies source directory exists
- Updates "Last Updated" timestamp in README.md
- Exits on error with status code

### Copy Local Configuration to Other Repositories

Use `copy-local-config-to-other-repo.sh` to share your local config:

```bash
# Basic usage
./copy-local-config-to-other-repo.sh -d /path/to/destination

# Disable auto-exclude from git
ADD_TO_GIT_EXCLUDE=false ./copy-local-config-to-other-repo.sh -d /path/to/destination
```

**Default Behaviors:**
- Copies `.roo` and `config` directories
- Automatically adds copied paths to `.git/info/exclude` (enabled by default)
- Supports zsh autocompletion for paths

**Common Use Cases:**
1. Initialize new project with standard config:
```bash
./copy-local-config-to-other-repo.sh -d ../new-project
```

2. Update existing project while keeping config local:
```bash
ADD_TO_GIT_EXCLUDE=false ./copy-local-config-to-other-repo.sh -d ../existing-project
```

## Configuration

Shared settings in `copy-config.env`:
- `SOURCE_DIR`: Path to official config source (default: `../roo-code`)
- `DIRECTORIES_TO_COPY`: Config dirs to sync (default: `.roo config`)
- `ADD_TO_GIT_EXCLUDE`: Control git exclusion (default: `true`)

## Recent Changes

Last Updated: Tue Jun 17 14:18:09 IST 2025