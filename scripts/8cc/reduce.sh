for T in ./out/*.c 
do
    cp $T .
    T=`basename $T`
    timeout 10m creduce ./miscomp.sh ./$T
done