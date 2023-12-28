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

If the destination directory already contains a file with the specified name,the
script appends a numerical suffix to create a unique filename (e.g.,`filename1`, `filename2`, ...)
