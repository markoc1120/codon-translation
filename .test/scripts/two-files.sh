out=$(mktemp /tmp/ctib.XXXXXX)
function cleanup { rm $out ; }
trap cleanup EXIT

python3 src/main.py data/seqs.in $out
.test/scripts/cmp.sh $out data/seqs.out || exit 1
