# Automate Project Initialisation

> This project is created using the following technologies

| Technologies     |
|------------------|
| Bash Script      |
| Python           |
| Github API       |

## Prerequisite
* Python installed to run the code
* VS Code

## Usage & Installation
### Installation
The project can be installed using either of the following mechanisms;
* Copy the project in to your local machine  
  Use the "Clone or download" button and select "Download ZIP" to copy the entire project, and copy those into your project.
* Using git to clone
    ```bash
    git clone https://github.com/lionell-paquit/automate-project-init.git
    ```
Go to the project directory:
```bash
cd automate-project-init
```

Install required packages:
```bash
pip install -r requirements.txt
```

**NOTE:** Github will no longer support username and password authentication. It is recommended to use personal access token. https://developer.github.com/changes/2020-02-14-deprecating-password-auth/

To generate an access token: https://github.com/settings/tokens

Create *.env* file and add token:
```
PERSONAL_ACCESS_TOKEN=<your_personal_token>
```
Navigate to *create.py*.
* Change the destPath variable to which directory you want your new project e.g. destPath = /Users/lionellp/path/to/your/project/

Navigate to *.my_commands.sh* and make sure to change the INSTALLATION_PATH, PROJECT_PATH AND GIT_URL variables.
* INSTALLATION_PATH is where you cloned the repository to.
* PROJECT_PATH is the desired location to store your new project folder in, e.g. "/Users/lionellp/path/to/your/project/${PROJECT_NAME}". Should be the same path with the destPath in create.py file.
* GIT_URL is your Github Repository. You can use either HTTPS or SSH e.g. "https://github.com:lionell-paquit/${PROJECT_NAME}.git"
* Make sure to keep the bash variable ${PROJECT_NAME} at the end of the string

>**Note:** If you use alias on your Python command, change the line:
>   ```
>   python3 create.py
>   ```

Copy *.my_commands.sh* to home directory. Then, source or alias the bash script for ease of use. Add this line to your *.bashrc* or *.zshrc*;
```bash
source ~/.my_commands.sh
```
 And reload the terminal;

### Usage:
To run the script open terminal and type in 'create <Project_Name>'

![Demo](demo.gif)

## To-do
* Add -t | --type [type] to specify what type of project to create.