#!/bin/bash

certs=$1
getcp=$2
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

		pemfile=$pems${file##*/}.pem
		resfile=$results${file##*/}.pfx
		
		echo Enter the password to ${file##*/} container:
		read pass

		cd $getcp
		./get-cpcert $certs $pass > $pemfile
		
		openssl pkcs12 -engine gost -export -in $pemfile -out $resfile -keypbe gost89 -certpbe gost89 -macalg md_gost12_512

	fi

done
