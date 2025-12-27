if [ $# -lt 2 ]
then
    echo "writefile or writestr was not specified."
    exit 1
fi

writefile=$1
writestr=$2

echo $writefile | grep -qE "^/"
if ! [ $? -eq 0 ]
then
    echo "please enter absolute path.( the path must start with '/')"
    exit 1
fi

dirpath=$(dirname "$writefile")
filename=$(basename "$writefile")

if ! [ -d "$dirpath" ]
then
    mkdir -p "$dirpath"
fi

echo $2 > $1

if [ $? -ne 0 ]
then
    echo "the file could not be created."
    exit 1
fi