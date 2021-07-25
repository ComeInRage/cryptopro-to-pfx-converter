# cryptopro-to-pfx-converter

## I. Description

This script introduces automation into process of conversion CryptoPRO CSP 5.0 containers into .pfx and .pem files.

## II. Dependencies

Before you download script you have to download and install:
- [OpenSSL](https://www.openssl.org/)
- [get-cpcert](https://github.com/kov-serg/get-cpcert)

Also you have to install GOST engine support to your openssl:
```shell
sudo apt install libengine-gost-openssl1.0
```

### Notice:

Its preferable to download get-cpcert and start prepare.sh script, it will download and update all dependencies.

Script tested on Ubuntu 14.04 LTS, OpenSSL 1.1.1

## III. Usage

Before you start realize what passwords in container do you use. If you use one same password in all of your containers, you should download and use script.sh. Otherwise you shauld use script_pwd.sh.
script.sh applies one entered password to all of your containers. script_pwd.sh asks you to enter passwords to any container.

You have to download the script.sh file and set permissions to execute to this script. Right-click on the script.sh file, enter the Properties, Permissions and check the box "Allow executing file as program".
After that open the Terminal by Ctrl+Alt+T and use the command below to enter the directory, where is downloaded script.sh

```shell
cd Example/Path
```

Example:

```shell
cd /home/user/Desktop/test/
```

As soon as you finish, use the command below to start the script.

```shell
# script.sh example
./script.sh [PATH-TO-CERTIFICATES] [PASSWORD] [PATH TO GET-CPCERT]

# script_pwd.sh example
./script_pwd.sh [PATH-TO-CERTIFICATES] [PATH TO GET-CPCERT]
```