#!/bin/bash

certs=$1
pass=$2
getcp=$3
pems=$HOME/Desktop/pems/
results=$HOME/Desktop/results/

if ! [ -d $pems ]; then
	mkdir $pems
fi

if ! [ -d $results ]; then
	mkdir $results
fi

for file in $certs*.000
do

	if [ -d $file ]; then

		pemfile=$pems${file##*/}
		resfile=$results${file##*/}

		pemfile=${pemfile%.*}.pem
		resfile=${resfile%.*}.pfx

		cd $getcp
		./get-cpcert $file $pass > $pemfile
		
		openssl pkcs12 -engine gost -export -in $pemfile -out $resfile -keypbe gost89 -certpbe gost89 -macalg md_gost12_512

	fi

done
