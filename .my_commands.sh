#!/bin/bash

function create() {
    INSTALLATION_PATH="/mnt/f/Projects/automate-project-init/"
    cd "$INSTALLATION_PATH"
    python3 create.py $@ && {

        PROJECT_NAME=()
        HELP=false
        while [[ $# -gt 0 ]]
        do
            key="$1"
            
            case $key in
                -t|--type)  # type of project
                TYPE="$2"
                shift # past argument
                shift # past value
                ;;
                -h|--help)  # type of project
                HELP=true
                shift # past argument
                ;;
                *)    # positional name of project
                PROJECT_NAME+=("$1") # save it in an array for later
                shift # past argument
                ;;
            esac

        done
        
        GIT_URL="git@github.com:lionell-paquit/${PROJECT_NAME}.git"
        PROJECT_PATH="/mnt/f/Projects/${PROJECT_NAME}"
        if [ "$HELP" = false ]; then
            if [ -d "$PROJECT_PATH" ]; then
                cd "$PROJECT_PATH"
            else
                echo "Invalid Directory"
                exit 1
            fi

            git init
            git remote add origin $GIT_URL
            touch README.md
            git add .
            git commit -m "Initial commit"
            git push -u origin master
            code .
        fi

    }

}