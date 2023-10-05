# Chronic Disease Recorder

A simple(istic) app to track my chronic desease related symptoms.

It is mainly a CLI but a web interface is provided.

Data is stored locally in Yaml files, one a day, for simple retreival and post processing (if needed).

It is written in bash for CLI and server and a bit of html/javascript for the web interface, nothing fancy.

Also, nothing ever leaves your computer if you do not want to !

## TLDR

```bash
curl -s https://raw.githubusercontent.com/DimitriGilbert/cdr/main/utils/get_cdr -O;
chmod +x get_cdr;
./get_cdr --install;
# reload terminal or source bashrc
# start a new day
cdr new-day --context "it's a new dawn, it's a new day, and I'm feeling..."
# record stuff
cdr pain --loc "left knee" --intensity 4 [...]
cdr itching --loc "left knee" --loc "right hand" --intensity 2 --context "something happened, probably !"
# view what you recorded
cdr read
```

## Installation

An installation script is provided

```bash
# download the script
curl -s https://raw.githubusercontent.com/DimitriGilbert/cdr/main/utils/get_cdr -O;
# make it executable
chmod +x get_cdr;
# display the help
./get_cdr --help;
#	-b, --branch|--tag|--install-version <branch>: version to install
#	--install-directory <install-directory>: where to install
#	--install-file <install-file>: rc files to install to, forces install, repeatable
#	-i|--install|--no-install: install in bashrc
#	--remove-installer|--no-remove-installer: remove install script itself
#	aliases: --rm,
#	--ssh|--no-ssh: clone using ssh
#	--zip|--no-zip: install using zip archive, not recommended

# generic install
./get_cdr --install;
```

### CLI documentation

#### cdr record

```
cdr record command:
	what: what to record (eg: pain, nausea,med intakes ...)
	-l, --loc|--localisation|--localization|--location|--where <loc>: where is it ?, repeatable
	-i, --intensity|--level <intensity>: record intensity/level from 1 to 10
	-c, --more-context|--info|--information|--description <more-context>: more information
	-d, --date|--when <date>: when did it happen ?
	--config <config>: parent config folder, user .config by default
Usage :
	cdr record <what> [--loc <value>] [--intensity <value>] [--more-context <value>] [--date <value>] [--config <value>]
```

#### cdr init

```
Init CDR:
	--config <config>: parent config folder, user .config by default
Usage :
	cdr init [--config <value>]
```

#### cdr new-day

```
Create a new day record file:
	--config <config>: parent config folder, user .config by default
	--context <context>: more information on the day
Usage :
	cdr new-day [--config <value>] [--context <value>]
```

#### cdr archive

```
Archive:
	--config <config>: parent config folder, user .config by default
	--path <path>: output path
	--file <file>: file to add, repeatable
	--directory|--no-directory: add whole record directory
	--override|--no-override: override file if it exists
Usage :
	cdr archive [--config <value>] [--path <value>] [--file <value>] [--[no-]directory] [--[no-]override]
```

#### cdr read

```
read last file to stdout:
	--config <config>: parent config folder, user .config by default
	-f, --filter <filter>: yq expression to filter data, repeatable
	--from <from>: date from which to start
	--to <to>: date to go to, last by default
	--date <date>: read a specific date
Usage :
	cdr read [--config <value>] [--filter <value>] [--from <value>] [--to <value>] [--date <value>]
```

#### cdr server

```
cdr web server:
	--port <port>: tcp port [default: ' 42069 ']
	--response-file <response-file>: which file to use for the response FIFO, mktemp if empty
Usage :
	cdr server [--port <value>] [--response-file <value>]
```
