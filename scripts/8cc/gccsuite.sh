# Set GCCSRCROOT to a gcc checkout, will run $1 on all tests.
# Copying any successful runs into ./out/
mkdir -p out
for T in $GCCSRCROOT/gcc/testsuite/gcc.c-torture/execute/*.c
do
	if bash ./$1 $T  ; then
		echo "$T is interesting"
		cp $T ./out/
	fi
done