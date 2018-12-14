#!bin/sh

#Full atom clean
apm clean

if [-f package-list.bcp]; then
    #Now you can install a new plugin configuration:
    apm install --packages-file package-list.bcp
else
    echo "Error: No such file package-list.bcp"
fi

