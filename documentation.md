# Usage

## cdr

```
Chronic Desease Recorder:
	target: cdr subcommand [one of 'record' 'init' 'new-day' 'archive' 'read' 'record']
Usage :
	cdr <target>
```

## cdr record

```
cdr sub command help
	
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

## cdr init

```
cdr sub command help
	
Init CDR:
	--config <config>: parent config folder, user .config by default
Usage :
	cdr init [--config <value>]
```

## cdr new-day

```
cdr sub command help
	
Create a new day record file:
	--config <config>: parent config folder, user .config by default
	--context <context>: more information on the day
Usage :
	cdr new-day [--config <value>] [--context <value>]
```

## cdr archive

```
cdr sub command help
	
Archive:
	--config <config>: parent config folder, user .config by default
	--path <path>: output path
	--file <file>: file to add, repeatable
	--directory|--no-directory: add whole record directory
	--override|--no-override: override file if it exists
Usage :
	cdr archive [--config <value>] [--path <value>] [--file <value>] [--[no-]directory] [--[no-]override]
```

## cdr read

```
cdr sub command help
	
read last file to stdout:
	--config <config>: parent config folder, user .config by default
	-f, --filter <filter>: yq expression to filter data, repeatable
	--from <from>: date from which to start
	--to <to>: date to go to, last by default
	--date <date>: read a specific date
Usage :
	cdr read [--config <value>] [--filter <value>] [--from <value>] [--to <value>] [--date <value>]
```
