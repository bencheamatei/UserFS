# ITBI Project - UserFS

## Authors

[Benchea Matei](https://github.com/bencheamatei) - gr. 152

[Mitoceanu Ciprian](https://github.com/ciprian-mx) - gr. 152

## Overview

UserFS is a shell-based utility designed to dynamically monitor system users and their active processes.

The script represents each active user on the system through a dedicated directory containing a **procs** file, which lists their currently running processes. All these individual user directories are grouped under a single centralized "root directory".

The system automatically updates this information periodically (every 30 seconds) in the background. If a user logs out or disappears from the system, their corresponding directory is kept, but the **procs** file is emptied. Additionally, a **lastLogin** file is generated to display the exact date and time of the user's last session on the system.

## Structure 

- **`main.sh`** - he main, feature-complete script. It automatically launches the background directory update process and simultaneously opens an interactive CLI menu, waiting for user commands to query the gathered data.

- **`proiect.sh`** - a minimal, base version of the script. This version only implements the background periodic update loop without providing the interactive CLI menu.

## Running 

Before running the scripts, you must grant them execution permissions using the following command:

```bash

chmod +x main.sh
```

Then, run the main script (which will give you access to the interactive menu):

```bash

./main.sh
```

Immediately upon startup, the script will initialize the root directory (**userfsRoot**) and begin monitoring users in the background.

You can type the **`man`** command and press **`Enter`** to see the list of all available commands.

## Documentation 

For a comprehensive technical overview, including architecture, implementation details, and design choices, please refer to the project documentation:

- [Documentation (ro)](./documentatie.pdf)