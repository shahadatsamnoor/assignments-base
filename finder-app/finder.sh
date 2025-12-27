if [ $# -lt 2 ]
then
    echo "filesdir or searchstr was not specified."
    exit 1
fi

echo $1 | grep -qE "/$"
if [ $? -eq 0 ]
then
    filesdir=$1
else
    filesdir=$1/
fi

searchstr=$2

if ! [ -d $filesdir ]
then
    echo "$filesdir does not represent a directory on the filesystem"
    exit 1
fi

X=$(grep -rl $searchstr $filesdir | wc -l )

Y=$(grep -r $searchstr $filesdir | wc -l )

echo "The number of files are ${X} and the number of matching lines are ${Y}"