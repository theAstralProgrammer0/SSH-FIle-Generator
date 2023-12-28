# SSH File Generator

## Overview
This simple script, `gen_ssh`, automates the process of generating SSH key pairs for a given email or credential and storing them in text files. It provides a convenient way to manage and organize SSH keys for secure connections.

## Usage
```bash
./gen_ssh [credential] [file_name] [/path/to/dir]
```

### Example:
```bash
./gen_ssh example1@email.com filename ~/.ssh
```

This command generates an SSH key pair for the email credential
`example1@email.com`, saves it in the text file filename located in the `~/.ssh` directory, and prints the content of filename.pub (the public key) to the screen.

If the destination directory already contains a file with the specified name, the script appends a numerical suffix to create a unique filename (e.g.,`filename1`, `filename2`, ...)

### Error Handling:
* If the script is run without providing all three required parameters, it will display an error message:
```bash
Usage: ./gen_ssh [credential] [file_name] [/path/to/dir]
```

* If the script encounters any other errors, an appropriate error message is displayed on the screen, the script exits and the error code causing the error is set.
```bash
echo $?
```

To see the error code of the latest error

## SSH Agent
The script sets up the SSH agent's environment variables to store the decrypted private key, ensuring persistent SSH connections. The private key is saved in the specified text file and must be kept private. Only the corresponding public key should be used for secure connections.

### Manual Export of `SSH_AUTH_SOCK`:
In situations where the script is run from within a subshell or a different
environment, the `SSH_AUTH_SOCK` variable should be exported manually to point to the correct agent socket:
```bash
export SSH_AUTH_SOCK=$(find /tmp/ssh-*/ $HOME/.ssh/* -type s -name agent.* 2>/dev/null | head -n 1)
```

This ensures that the SSH agent's environment variables are correctly set for persistent connections.

## Note
* Always keep your private keys secure and never share them.
* Use the corresponding public key for authentication on platforms like GitHub.

Enjoy secure and convenient SSH key management with `gen_ssh`!
