:;while [ $? -eq 0 ];do nc -vlp 8080 -c'(r=read;e=echo;$r a b c;z=$r;while [
${#z} -gt 2 ];do $r z;done;
f=`$e $b|sed 's/[^a-z0-9_.-]//gi'`;h="HTTP/1.0";o="$h 200
OK\r\n";c="Content";if [ -z $f ];then($e $o;ls|(while $r n; do if [ -f "$n" ];
then $e "<a href=\"/$n\">`ls -gh $n`</a><br>";fi;done););elif [ -f $f ];
then $e -e "$o$c-Type: `file -ib $f`\n$c-Length: `stat -c%s $f`\n";cat $f;
else $e -e "$h 404 Not Found\n\n404\n";fi)';done