echo 0.31 NORMAL
./run-batch.pl '/opt/aspell-0.31/bin/aspell --sug-mode=normal' aspell-.31-normal

echo 0.33 NORMAL
./run-batch.pl '/opt/aspell-0.33/bin/aspell --sug-mode=normal' aspell-.33-normal

echo 0.50 NORMAL
./run-batch.pl '/opt/aspell-0.50/bin/aspell --sug-mode=normal' aspell-.50-normal

echo 0.60 NORMAL
./run-batch.pl 'aspell --sug-mode=normal' aspell-.60-normal
echo 0.60 SLOW
./run-batch.pl 'aspell --sug-mode=slow' aspell-.60-slow

ASPELL_FIX=/home/kevina/aspell-0.60-cvs/inst/bin/aspell

echo 0.60 CVS NORMAL 
./run-batch.pl "$ASPELL_FIX --sug-mode=normal" aspell-.60cvs-normal
echo 0.60 CVS SLOW
./run-batch.pl "$ASPELL_FIX --sug-mode=slow" aspell-.60cvs-slow

ASPELL_FIX2=/home/kevina/aspell-cvs/inst/bin/aspell

echo CVS NORMAL 
./run-batch.pl "$ASPELL_FIX2 --sug-mode=normal" aspell-cvs-normal
echo CVS SLOW
./run-batch.pl "$ASPELL_FIX2 --sug-mode=slow" aspell-cvs-slow

echo HUNSPELL
./run-batch.pl 'hunspell -d ~/en_US' hunspell

echo HUNSPELL
./run-batch.pl 'hunspell -0 -d ./en_US' hunspell-phonet

echo ISPELL
./run-batch.pl 'ispell' ispell
