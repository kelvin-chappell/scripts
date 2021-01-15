# from https://apple.stackexchange.com/a/206474
#!/bin/bash

brew=/usr/local/bin/brew
logger=/usr/bin/logger

$brew update 2>&1  | $logger -t brewup.update
$brew upgrade 2>&1 | $logger -t brewup.upgrade
$brew cleanup 2>&1 | $logger -t brewup.cleanup

