# Some of my **astral** scripts

## 0. run_install.sh
   * This script checks if a command exists in the Linux filesystem.
   * If it exists, it runs the command with arguments
   * Else it installs the command's executable, and runs it with arguments
   * This script also stores results, failures, and diagnoses logs in associated files

### Usage:
   ```bash
   chmod +x run_install.sh
   ```
   ```bash
   ./run_install.sh [command] [arguments ...]
   ```
