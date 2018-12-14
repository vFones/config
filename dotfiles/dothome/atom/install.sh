#!bin/sh
#Use -c option for clean installation

#Before the installation will be create a backup file:
apm list --installed --bare > package-list.bcp
echo "Backup created!"


if [$1 == "-c"]; then
    #Full atom clean
    apm clean
fi

if [-f package-list]; then
    #Now you can install a new plugin configuration:
    apm install --packages-file package-list
else
    echo "Error: No such file package-list"
fi
