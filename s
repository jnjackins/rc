#!/usr/bin/env rc

if(test -n $SEGMENT)
	dir=$SEGMENT
if not
	dir=$GOPATH/src/github.com/segmentio/

prog='$dir + "/" + ( .Results[] | ((.repository.name | split("/")[-1]) +"/"+ (.file.path)) + ":" + (.lineMatches[] | (.lineNumber+1 | tostring) + " " + .preview) )'
query=(case:yes count:1000 $*)
src search -json $"query | jq --arg dir $dir -r $prog 
