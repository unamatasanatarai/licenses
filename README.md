# licenses

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux-000000?style=for-the-badge&logo=apple&logoColor=white)
![License](https://img.shields.io/badge/License-GPL--2.0-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge)
![XDG](https://img.shields.io/badge/Standard-XDG--Compliant-orange?style=for-the-badge)
![Dependencies](https://img.shields.io/badge/Dependencies-curl-red?style=for-the-badge)

A high-performance, Pure Bash CLI utility for managing and applying software licenses to local projects. It provides a streamlined interface for fetching, caching, and deploying common license templates like MIT, GPL, and Apache.

## Features

- **Local Caching**: Stores license templates locally in compliance with XDG standards for offline use.
- **Shorthand Syntax**: Quickly apply licenses using the `licenses <id>` command.
- **Sync Mechanism**: Keep license templates up to date with the remote repository.
- **Pure Bash**: Optimized for performance with minimal external dependencies.
- **Zero Configuration**: Works out of the box with sensible defaults.

## Tech Stack

- **Bash**: Core logic implemented with pure Bash built-ins.
- **curl**: Used for reliable synchronization with remote sources.
- **XDG Base Directory Spec**: Follows modern Linux/macOS directory standards for data storage.

## Project Structure

```text
.
├── licenses          # Main entry point and command router
├── licenses-get      # Logic for retrieving and applying licenses
├── licenses-list     # Utility to list cached license templates
├── licenses-update   # Synchronization script for remote updates
├── install.sh        # Installation script
├── license-templates # Source directory for license templates
└── metadata          # Project metadata and indexing
```

## Installation

To install the utility to your local system:

1. Clone the repository.
2. Run the installation script:
   ```bash
   ./install.sh
   ```

The script will handle setting up the necessary directories and adding the utilities to your path.

## Usage

### Sync Licenses
Before first use, or to get the latest templates, run:
```bash
licenses update
```

### List Available Licenses
View all licenses currently available in your local cache:
```bash
licenses list
```

### Apply a License
To apply a license (e.g., MIT) to your current directory as a `LICENSE` file:
```bash
# Shorthand usage
licenses mit

# Explicit usage
licenses get mit
```

## License

This project is distributed under the GNU General Public License v2.0. See the [LICENSE](LICENSE) file for details.
