#!/bin/bash

function printAndExecuteCommand {
  echo "$ $1"
  $1
}

function printEnvVar {
  envvar_key="$"
  envvar_key+="$1"
  envvar_value=$(eval echo $envvar_key)
  echo "$ ENV: $envvar_key=$envvar_value"
}

echo "--- OSX Information ---"
echo "-----------------------"
printAndExecuteCommand "sw_vers -productVersion"
printAndExecuteCommand "system_profiler SPSoftwareDataType"

echo
echo "-------------------------"
echo "--- Xcode Information ---"
printAndExecuteCommand "xcodebuild -version"

echo
echo "-------------------------"
echo "--- Tools Information ---"
printAndExecuteCommand "brew --version"
printAndExecuteCommand "which brew"
echo
printAndExecuteCommand "git --version"
printAndExecuteCommand "which git"
echo
printAndExecuteCommand "ruby --version"
printAndExecuteCommand "which ruby"
echo
printAndExecuteCommand "pod --version"
printAndExecuteCommand "which pod"
echo
printAndExecuteCommand "python --version"
printAndExecuteCommand "which python"

echo
echo "------------"
echo "--- User ---"
printEnvVar "HOME"
printAndExecuteCommand "whoami"

echo
echo "-------------------"
echo "--- Environment ---"
printAndExecuteCommand "env"

echo
echo "---------------"
echo "--- Network ---"
printAndExecuteCommand "ifconfig"
