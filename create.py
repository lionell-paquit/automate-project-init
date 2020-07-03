import sys
import os
import argparse
from decouple import config
from github import Github

# Set environment
token = config('PERSONAL_ACCESS_TOKEN')

# Set destPath folder you'd like to create the project in.
destPath = '/mnt/f/Projects/'

# Initialise the parser
parser = argparse.ArgumentParser(prog='create',
    description='This program will automate the initialisation of a project.')
parser.add_argument('PROJECT_NAME', help='Name of the project')
parser.add_argument('-t', '--type', help='''Default type is "app" if not set. 
                                        Specify what type of project: "app", "web", "data-sci", etc.''',
    choices=['app', 'data-sci', 'docs'], default='app')
args = parser.parse_args()

# Proceed creating project
def create():
    folderName = str(args.PROJECT_NAME)
    if (os.path.exists(destPath + folderName)):
         print(f'Cannot create "{destPath + folderName}".\033[1;31;40m Directory already exists!\033[0;37;40m')
         exit(1)
    else:
        user = Github(token).get_user()
        repo = user.create_repo(folderName)    
        os.makedirs(destPath + folderName)
        print(f'\033[1;32;40mSuccesfully created repository\033[0;37;40m "{folderName}"')

if __name__ == "__main__":
    create()
