# Given a self contained C program, return 0 if that file miscompiles
# with 8cc.

T=$1

if ! timeout 1s gcc $T ; then
	exit 1
fi
if ! timeout 1s ./a.out  ; then
	exit 1
fi
if ! timeout 1s tcc $T  ; then
	exit 1
fi
if ! timeout 1s ./a.out  ; then
	exit 1
fi
# Try and find miscompiles.
if ! timeout 1s 8cc -S -o out.s $T  ; then
	exit 1
fi
if ! timeout 1s gcc ./out.s -c -o ./out.o ; then
	exit 1
fi
if ! timeout 1s gcc ./out.o -o ./a.out ; then
	exit 1
fi
if ! timeout 1s ./a.out  ; then
	exit 0
fi

exit 1