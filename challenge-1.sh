#!/bin/bash

# Print welcome menu and display menu options
welcome () {
    printf "Welcome to Aziah's Realm!\nPlease select from the following options:\n"

    echo "1) Register"
    echo "2) Login"
    echo "3) Exit"
}

# Get user menu selection and determine which option is selected
read selection

register () {
    # Prompt user for registration data and print it out to data.csv
    echo 'Provide your basic information to complete your registration!'
    read -p "First name: " fname
    read -p "Last name: " lname
    read -p "Email address: " email
    read -p "Username: " username
    read -p "Password: " password
    echo "$fname,$lname,$email,$username,$password" >> data.csv
    echo "Your information has been completed and stored!"
}

login() {
    # Prompt user for credentials
    echo "Please provide you username and password to login to your account"
    read -p "Username: " un
    read -p "Password: " pw
    # Read each line of data.csv and see if there are matching credentials
    exec < data.csv
    read header
    while IFS="," read -r f l e u p; do
        if [ $u = $un ] && [ $p = $pw ]; then
            echo "Record found: $f,$l,$e,$u,$p"
            echo "Welcome to Aziah's World~! Huzzah!"
            exit 0
        fi
    done
    echo "Record not found. You're not allowed in."
    exit 1
}

######################################

trueSel=1
while [ $trueSel -eq 1 ]; do
    
    welcome
    read selection
    if [ $selection = "1" ]; then
        trueSel=0
        register
        elif [ $selection = "2" ]; then
        trueSel=0
        login
        elif [ $selection = "3" ]; then
        echo "Now leaving Aziah's World..."
        echo "Goodbye~!"
        trueSel=0
        exit 0
        else
            echo "That's not a valid selection!"
            trueSel=1
    fi
done

