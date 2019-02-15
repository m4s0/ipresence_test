#!/bin/bash

# Replace variables $ENV{<environment varname>}
function ReplaceEnvironmentVariable() {
    grep -rl "\$ENV{\"$1\"}" $3|xargs -r \
        sed -i "s|\\\$ENV{\"$1\"}|$2|g"
}

if [ -n "$DEBUG" ]; then
    echo "Environment variables:"
    env
    echo "..."
fi

# Replace all variables
for _curVar in `env | grep -v "_=" | awk -F = '{print $1}'`;do
    # awk has split them by the equals sign
    # Pass the name and value to our function
    if [[ $_curVar == *"SYMFONY"* ]] || [[ $_curVar == *"APP"* ]] || [[ $_curVar == *"XDEBUG"* ]]; then
        _curValue=$(env | grep -w "$_curVar" | awk -F= {'print$2'})
        echo "fastcgi_param $_curVar $_curValue;" >> /etc/nginx/fastcgi_params
    else
        ReplaceEnvironmentVariable ${_curVar} ${!_curVar} /etc/nginx/conf.d/*
    fi
done

# Run nginx
exec /usr/sbin/nginx