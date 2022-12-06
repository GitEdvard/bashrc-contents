#!/bin/bash
# Intended to be piped from msbuild output, in order to convert windows file paths to
# wsl linux like file paths.
#
# example:
# Data\ResultPlateManagement\BulkRepository.cs(72,16): error CS1001: Identifier expected [C:\GitRoot\chiasma\Chiasma\Chiasma.csproj]
# is converted to
# /mnt/c/GitRoot/chiasma/Chiasma/Data/ResultPlateManagement/BulkRepository.cs(72,16): error CS1001: Identifier expected
#
# Usage: in Make file:
# msbuild arg1 arg2 | bash win2wsl.sh
# (it wont work without "bash")
sed -e 's/\\/\//g' -e 's/\(.*\)\[\(.*\)\/\(.*\)/ \2\/\1/g' -e 's/C\:\//\/mnt\/c\//g'
