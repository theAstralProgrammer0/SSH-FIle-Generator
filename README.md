# Some of my **astral** scripts

## 0. run_install.sh
   * This script checks if a command exists in the Linux filesystem.
   * If it exists, it runs the command
   * Else it installs the command's executable, and runs it with arguments
   * This script also stores result, failure, and diagnoses logs in separate files

### Usage:
   ```bash
   chmod +x run_install.sh
   ```
   ```bash
   ./run_install.sh [command] [...]
   ```
