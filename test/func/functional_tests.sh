#!/bin/bash

PLINK_SRC=~/src/plink2
GQT_PATH=~/src/gqt/bin
DATA_PATH=../data
MORE_DATA_PATH=~/data/genotq/sim/

#{{{
#$GQT_PATH/gqt convert vcf-plt -f 10 -r 43 -i $DATA_PATH/10.1e4.var.vcf -o tmp.var.plt
#$GQT_PATH/gqt convert plt-ubin -i $DATA_PATH/10.1e4.ind.txt -o tmp.ubin
#$GQT_PATH/gqt convert ubin-gqtbm -i tmp.ubin -o tmp.wahbm
#$GQT_PATH/gqt convert ubin-gqt -i tmp.ubin -o tmp.wah
#$GQT_PATH/gqt convert ubin-plt -i tmp.ubin -o tmp.ubin.to.plt
#
#$GQT_PATH/gqt view plt -i $DATA_PATH/10.1e4.ind.txt > tmp.plt.plt
#$GQT_PATH/gqt view ubin -i tmp.ubin > tmp.ubin.plt
#$GQT_PATH/gqt view gqtbm -i tmp.wahbm > tmp.wahbm.plt
#$GQT_PATH/gqt view gqt -i tmp.wah > tmp.wah.plt
#
#diff tmp.var.plt $DATA_PATH/10.1e4.var.txt
#diff tmp.plt.plt tmp.ubin.plt
#diff tmp.plt.plt tmp.gqtbm.plt
#diff tmp.plt.plt tmp.gqt.plt
#diff tmp.ubin.to.plt $DATA_PATH/10.1e4.ind.txt
#
#rm tmp.var.plt \
#    tmp.plt.plt \
#    tmp.ubin.plt \
#    tmp.gqtbm.plt \
#    tmp.gqt.plt \
#    tmp.ubin \
#    tmp.gqtbm \
#    tmp.gqt \
#    tmp.ubin.to.plt
#
#ARGS="-q 0 -n 5 -r 1,2,4,5,7"
#$GQT_PATH/gqt gt plt \
#    -i $DATA_PATH/10.1e4.ind.txt \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS \
#    > tmp.gt.plt
#$GQT_PATH/gqt gt ubin \
#    -i $DATA_PATH/10.1e4.ind.ubin \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS \
#    > tmp.gt.ubin
#$GQT_PATH/gqt gt gqtbm \
#    -i $DATA_PATH/10.1e4.ind.gqtbm \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS \
#    > tmp.gt.gqtbm
#$GQT_PATH/gqt gt ipgqtbm \
#    -i $DATA_PATH/10.1e4.ind.gqtbm \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS \
#    > tmp.gt.ipgqtbm
#$GQT_PATH/gqt gt cipgqtbm\
#    -i $DATA_PATH/10.1e4.ind.gqtbm \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS \
#    > tmp.gt.cipgqtbm
#diff tmp.gt.plt tmp.gt.ubin
#diff tmp.gt.plt tmp.gt.gqtbm
#diff tmp.gt.plt tmp.gt.ipgqtbm
#diff tmp.gt.plt tmp.gt.cipgqtbm
#rm tmp.gt.plt \
#    tmp.gt.ubin \
#    tmp.gt.gqtbm \
#    tmp.gt.ipgqtbm \
#    tmp.gt.cipgqtbm
#
#ARGS="-o gt -q 0 -n 5 -r 1,2,4,5,7"
#$GQT_PATH/gqt count plt \
#    -i $DATA_PATH/10.1e4.ind.txt \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS > tmp.count.plt
#
#$GQT_PATH/gqt count ubin \
#    -i $DATA_PATH/10.1e4.ind.ubin \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS > tmp.count.ubin
#
#$GQT_PATH/gqt count gqtbm \
#    -i $DATA_PATH/10.1e4.ind.gqtbm \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS > tmp.count.gqtbm
#
#$GQT_PATH/gqt count ipgqtbm \
#    -i $DATA_PATH/10.1e4.ind.gqtbm \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS > tmp.count.ipgqtbm
#
#$GQT_PATH/gqt count cipgqtbm \
#    -i $DATA_PATH/10.1e4.ind.gqtbm \
#    -b $DATA_PATH/10.1e4.ind.bim \
#    $ARGS > tmp.count.cipgqtbm
#
#diff tmp.count.plt tmp.count.gqtbm
##diff tmp.count.plt tmp.count.ubin
##diff tmp.count.plt tmp.count.ipgqtbm
##diff tmp.count.plt tmp.count.cipgqtbm
#
#rm -f tmp.count.plt \
#    tmp.count.ubin \
#    tmp.count.gqtbm \
#    tmp.count.ipgqtbm \
#    tmp.count.cipgqtbm
#
#plink --file ../data/10.1e4.ind --freq >/dev/null
#
#cat plink.frq \
#    | grep -v "CHR" \
#    | awk '{OFS="\t";
#            if ($3=="2") 
#                print $1,$2,$5*$6; 
#            else 
#                print $1,$2,(1-$5)*$6
#            }' \
#    > plink.frq.common
#
#echo -en "\n" >> plink.frq.common
#
#$GQT_PATH/gqt sum ipgqtbm \
#    -i ../data/10.1e4.ind.gqtbm \
#    -b ../data/10.1e4.ind.bim \
#    -n 10 \
#    -r 0,1,2,3,4,5,6,7,8,9 \
#    -u 2 \
#    -l 1 \
#    > gqt.out
#
#cat gqt.out | cut -f 1,2,7 > gqt.out.common
#
#$GQT_PATH/gqt sum ipgqtbm \
#    -a \
#    -i ../data/10.1e4.ind.gqtbm \
#    -b ../data/10.1e4.ind.bim \
#    -n 10 \
#    -r 0,1,2,3,4,5,6,7,8,9 \
#    -u 2 \
#    -l 1 \
#    > gqt.out.a
#
#cat gqt.out.a | cut -f 1,2,7 > gqt.out.a.common
#
#if [ -n "`diff -w gqt.out.common plink.frq.common`" ]
#then 
#    echo "ERROR($LINENO): gqt sum does not match plink"
#else
#    echo "SUCCESS($LINENO): gqt sum matches plink"
#    rm -f gqt.out.common plink.frq.common plink.frq
#fi
#
#if [ -n "`diff -w gqt.out gqt.out.a`" ]
#then 
#    echo "ERROR($LINENO): gqt sum does not match gqt sum -a"
#else
#    echo "SUCCESS($LINENO): gqt sum matches gqt sum -a"
#    rm -f gqt.out gqt.out.a
#fi
#
#$GQT_PATH/gqt convert vcf-plt \
#    -i ../data/10.1e4.var.vcf \
#    -o .tmp.var.plt \
#    -r 43 \
#    -f 10
#
#$GQT_PATH/gqt convert plt-invert-ubin \
#    -i .tmp.var.plt \
#    -o .tmp.ind.ubin
#
#$GQT_PATH/gqt convert ubin-plt \
#    -i .tmp.ind.ubin \
#    -o .tmp.ind.plt
#
#$GQT_PATH/gqt sort plt-field-freq \
#    -i .tmp.ind.plt \
#    -o .tmp.sort.ind.plt
#
#$GQT_PATH/gqt convert plt-ubin \
#    -i .tmp.sort.ind.plt \
#    -o .tmp.sort.ind.ubin
#
#$GQT_PATH/gqt convert ubin-gqtbm \
#    -i .tmp.sort.ind.ubin \
#    -o .tmp.sort.ind.gqtbm
#
#$GQT_PATH/gqt convert bcf-gqtbm \
#    -r 43 \
#    -f 10 \
#    -i ../data/10.1e4.var.bcf \
#    -b .tmp.bcf.sort.ind.bim \
#    -v .tmp.bcf.sort.ind.vid \
#    -o .tmp.bcf.sort.ind.gqtbm
#
#$GQT_PATH/gqt sum ipgqtbm \
#    -a \
#    -i .tmp.bcf.sort.ind.gqtbm \
#    -b .tmp.bcf.sort.ind.bim \
#    -n 10 \
#    -r 0,1,2,3,4,5,6,7,8,9 \
#    -u 2 \
#    -l 1  \
#    > .tmp.bcf.sort.ind.gqtbm.out
#
#
#$GQT_PATH/gqt sum ipgqtbm \
#    -a \
#    -i .tmp.sort.ind.gqtbm \
#    -b .tmp.bcf.sort.ind.bim \
#    -n 10 \
#    -r 0,1,2,3,4,5,6,7,8,9 \
#    -u 2 \
#    -l 1 \
#    > .tmp.bcf.sort.ind.bim.out
#
#if [ -n "`diff -w .tmp.bcf.sort.ind.gqtbm.out .tmp.bcf.sort.ind.bim.out`" ]
#then 
#    echo "ERROR($LINENO): gqt vcf...gqtbm does not match bcf-wahbm"
#else
#    echo "SUCCESS($LINENO): gqt vcf...gqtbm matches bcf-wahbm"
#    rm -f .tmp.var.plt \
#        .tmp.ind.ubin \
#        .tmp.ind.plt \
#        .tmp.sort.ind.plt \
#        .tmp.sort.ind.ubin \
#        .tmp.sort.ind.gqtbm \
#        .tmp.bcf.sort.ind.bim \
#        .tmp.bcf.sort.ind.gqtbm \
#        .tmp.bcf.sort.ind.gqtbm.out \
#        .tmp.bcf.sort.ind.bim.out
#fi
#}}}

rm -f \
    .tmp.bcf.sort.ind.bim \
    .tmp.bcf.sort.ind.vid \
    .tmp.bcf.sort.ind.gqtbm \
    .tmp.bcf.sort.ind.gqt

$GQT_PATH/gqt convert bcf \
    -r 43 \
    -f 10 \
    -i ../data/10.1e4.var.bcf \
    -b .tmp.bcf.sort.ind.bim \
    -v .tmp.bcf.sort.ind.vid \
    -o .tmp.bcf.sort.ind.gqt

rm -f \
    ../data/10.1e4.var.bcf.bim \
    ../data/10.1e4.var.bcf.vid \
    ../data/10.1e4.var.bcf.gqt

$GQT_PATH/gqt convert bcf \
    -r 43 \
    -f 10 \
    -i ../data/10.1e4.var.bcf 

if [ `md5 -q .tmp.bcf.sort.ind.bim` == `md5 -q ../data/10.1e4.var.bcf.bim` ]
then
    echo "SUCCESS($LINENO): Auto output BIM matches specified BIM"
else
    echo "ERROR($LINENO): Auto output BIM does not match specified BIM"
fi

if [ `md5 -q .tmp.bcf.sort.ind.vid` == `md5 -q ../data/10.1e4.var.bcf.vid` ]
then
    echo "SUCCESS($LINENO): Auto output VID matches specified VID"
else
    echo "ERROR($LINENO): Auto output VID does not match specified VID"
fi

if [ `md5 -q .tmp.bcf.sort.ind.gqt` == `md5 -q ../data/10.1e4.var.bcf.gqt` ]
then
    echo "SUCCESS($LINENO): Auto output GQT matches specified GQT"
else
    echo "ERROR($LINENO): Auto output GQT does not match specified GQT"
fi

rm -f ../data/10.1e4.var.ped.db
$GQT_PATH/gqt convert ped \
    -i ../data/10.1e4.var.ped 

if [ -e "../data/10.1e4.var.ped.db" ]
then
    echo "SUCCESS($LINENO): Auto output file on ped convert correct"
else
    echo "ERRROR: Auto output file on ped convert not correct"
fi

rm -f .tmp.10.1e4.var.db
$GQT_PATH/gqt convert ped \
    -i ../data/10.1e4.var.ped \
    -o .tmp.10.1e4.var.db

if [ -e ".tmp.10.1e4.var.db" ]
then
    echo "SUCCESS($LINENO): Specified output file on ped convert correct"
else
    echo "ERRROR: Specified output file on ped convert not correct"
fi

ROWS=`sqlite3 .tmp.10.1e4.var.db "select * from ped;" | wc -l`

if [ $ROWS -eq 10 ]
then
    echo "SUCCESS($LINENO): Correct number of rows in PED db"
else
    echo "ERROR($LINENO): 10 rows expect in PED db. $ROWS found."
fi 

ROWS=`sqlite3 .tmp.10.1e4.var.db "select * from ped where Population='ESN';"| wc -l`

if [ $ROWS -eq 2 ]
then
    echo "SUCCESS($LINENO): Correct number of rows from ESN populaiton in PED db"
else
    echo "ERROR($LINENO): 2 rows expect in PED db. $ROWS found."
fi 

# count the number of homo_ref rows
GQT_BOTH_NUM=`$GQT_PATH/gqt query \
    -i ../data/10.1e4.var.bcf.gqt \
    -d ../data/10.1e4.var.ped.db \
    -p "Population ='ESN'" \
    -g "HOMO_REF" \
    | grep -v "#" \
    | wc -l`

VCF_BOTH_NUM=`cat ../data/10.1e4.var.vcf  | cut -f 10- | tail -n+6 | cut -f2,10 | awk '$1=="0|0" && $2=="0|0"' | wc -l`


if [ $GQT_BOTH_NUM -eq $VCF_BOTH_NUM ]
then
    echo "SUCCESS($LINENO): Number of HOMO_REF in both ESN match in VCF and GQT"
else
    echo "ERROR($LINENO): Number of HOMO_REF in both ESN do not match in VCF($VCF_BOTH_NUM)  and GQT($GQT_BOTH_NUM)"
fi 

#$GQT_PATH/gqt query \
#        -i ../data/10.1e4.ind.gqtbm \
#        -b ../data/10.1e4.var.bim \
#        -d .tmp.10.1e4.var.db \
#        -p "Population ='ITU'" \
#        -g "HOMO_REF" \
#        -p "Population ='ESN'" \
#        -g "count(HOMO_REF) >= 1" \
#        -p "Population ='ITU'" \
#        -g "count(HOMO_REF) > 1"
#

$GQT_PATH/gqt query \
        -i ../data/10.1e4.var.bcf.gqt \
        -d ../data/10.1e4.var.ped.db \
        -p "Population ='ITU'" \
        -g "pct(HOMO_REF) >= 0.5" \
        | grep -v "#" \
        | cut -d "=" -f3 \
        > .tmp.query.pct.out

$GQT_PATH/gqt query \
        -i ../data/10.1e4.var.bcf.gqt \
        -d ../data/10.1e4.var.ped.db \
        -p "Population ='ITU'" \
        -g "count(HOMO_REF) >= 1" \
        | grep -v "#" \
        | cut -d "=" -f3 \
        > .tmp.query.count.out


if [ -n "`paste .tmp.query.pct.out .tmp.query.count.out | awk '$1*2 != $2'`" ]
then 
    echo "ERROR($LINENO): gqt query pct does not match gqt query count"
else
    echo "SUCCESS($LINENO): gqt query pct matches gqt query count"
    rm .tmp.query.pct.out .tmp.query.count.out 
fi

$GQT_PATH/gqt query \
        -i ../data/10.1e4.var.bcf.gqt \
        -d ../data/10.1e4.var.ped.db \
        -d .tmp.10.1e4.var.db \
        -p "Population ='ITU'" \
        -g "pct(HOMO_REF) >= 0.5" \
        -p "Population ='ITU'" \
        -g "count(HOMO_REF) >= 1" \
        > .tmp.query.out

cat .tmp.query.out \
        | grep -v "#" \
        | cut -f 8 | cut -d ";" -f2 | cut -d "=" -f2 \
        > .tmp.query.pct.out

cat .tmp.query.out \
        | grep -v "#" \
        | cut -f 8 | cut -d ";" -f3 | cut -d "=" -f2 \
        > .tmp.query.count.out

if [ -n "`paste .tmp.query.pct.out .tmp.query.count.out | awk '$1*2 != $2'`" ]
then 
    echo "ERROR($LINENO): gqt multi query pct and count do not match"
else
    echo "SUCCESS($LINENO): gqt multi query pct and count match" 
    rm .tmp.query.out .tmp.query.pct.out .tmp.query.count.out
fi

#BCF_R=`$GQT_PATH/gqt query \
#        -i ../data/10.1e4.var.bcf.gqt \
#        -s ../data/10.1e4.var.bcf \
#        -v ../data/10.1e4.var.bcf.vid \
#        -d ../data/10.1e4.var.ped.db \
#        -p "Population ='ITU'" \
#        -g "pct(HOMO_REF) >= 0.5" \
#        -p "Population ='ITU'" \
#        -g "count(HOMO_REF) >= 1" \
#        | grep -v "^#" \
#        | cut -f3 | sort |md5 -q`
#        #| cut -f3 | sort |md5sum-lite`
#
#MD_R=`$GQT_PATH/gqt query \
#        -i ../data/10.1e4.ind.gqtbm \
#        -d .tmp.10.1e4.var.db \
#        -b ../data/10.1e4.var.bim \
#        -p "Population ='ITU'" \
#        -g "pct(HOMO_REF) >= 0.5" \
#        -p "Population ='ITU'" \
#        -g "count(HOMO_REF) >= 1" \
#        | cut -f3 | sort |md5 -q`
#        #| cut -f3 | sort |md5sum-lite`
#        
#if [ "$BCF_R" == "$MD_R" ]
#then
#    echo "SUCCESS($LINENO): BCF output and BIM merge output match"
#else
#    echo "ERROR($LINENO): BCF output and BIM merge output do not match"
#fi 

$GQT_PATH/gqt convert bcf \
    -r 43 \
    -f 10 \
    -i ../data/10.1e4.var.bcf 

$GQT_PATH/gqt convert bcf \
    -r 43 \
    -f 10 \
    -i ../data/10.1e4.var.vcf 

$GQT_PATH/gqt convert bcf \
    -r 43 \
    -f 10 \
    -i ../data/10.1e4.var.vcf.gz


if [ `md5 -q ../data/10.1e4.var.vcf.gqt` == `md5 -q ../data/10.1e4.var.bcf.gqt` ]
then
    echo "SUCCESS($LINENO): VCF-source GQT matches BCF-source GQT"
    rm ../data/10.1e4.var.vcf.gqt
else
    echo "ERROR($LINENO): VCF-source GQT does not match BCF-source GQT"
fi 

if [ `md5 -q ../data/10.1e4.var.vcf.gz.gqt` == `md5 -q ../data/10.1e4.var.bcf.gqt` ]
then
    echo "SUCCESS($LINENO): VCF.GZ-source GQT matches BCF-source GQT"
    rm ../data/10.1e4.var.vcf.gz.gqt
else
    echo "ERROR($LINENO): VCF.GZ-source GQT does not match BCF-source GQT"
fi 

if [ `md5 -q ../data/10.1e4.var.vcf.vid` == `md5 -q ../data/10.1e4.var.bcf.vid` ]
then
    echo "SUCCESS($LINENO): VCF-source VID matches BCF-source GQT"
    rm ../data/10.1e4.var.vcf.vid
else
    echo "ERROR($LINENO): VCF-source VID does not match BCF-source GQT"
fi 

if [ `md5 -q ../data/10.1e4.var.vcf.gz.vid` == `md5 -q ../data/10.1e4.var.bcf.vid` ]
then
    echo "SUCCESS($LINENO): VCF.GZ-source VID matches BCF-source GQT"
    rm ../data/10.1e4.var.vcf.gz.vid
else
    echo "ERROR($LINENO): VCF.GZ-source VID does not match BCF-source GQT"
fi 

rm -f .tmp.test.ped
echo -ne "Family ID\tIndividual ID\tPaternal ID\tMaternal ID\tGender\tPhenotyp\n" > .tmp.test.ped
echo -ne "Y025\tNA18907\t0\t0\t2\t0\n" >> .tmp.test.ped
echo -ne "NG108\tHG03519\tHG03518\tHG03517\t1\t0\n" >> .tmp.test.ped
echo -ne "m027\tNA19758\t0\t0\t2\t0\n" >> .tmp.test.ped
echo -ne "IT060\tHG04015\t0\t0\t1\t0\n" >> .tmp.test.ped
echo -ne "test space here\tand here\there too\tone more\t1\t0\n" >> .tmp.test.ped

$GQT_PATH/gqt convert ped \
    -i .tmp.test.ped

SPACE_R0=`sqlite3 .tmp.test.ped.db "select Ind_ID from ped where Family_ID = 'test space here';"`
SPACE_R1=`sqlite3 .tmp.test.ped.db "select Ind_ID from ped where Individual_ID = 'and here';"`
SPACE_R2=`sqlite3 .tmp.test.ped.db "select Ind_ID from ped where Paternal_ID = 'here too';"`
SPACE_R3=`sqlite3 .tmp.test.ped.db "select Ind_ID from ped where Maternal_ID = 'one more';"`

if [ $SPACE_R0 -eq $SPACE_R1 ]
then
    if [ $SPACE_R0 -eq $SPACE_R2 ]
    then
        if [ $SPACE_R0 -eq $SPACE_R3 ]
        then
            echo "SUCCESS($LINENO): Spaces acceped in cell values"
            rm .tmp.test.ped .tmp.test.ped.db
        else
            echo "ERROR($LINENO): Spaces not acceped in cell values"
        fi
    else
        echo "ERROR($LINENO): Spaces not acceped in cell values"
    fi
else
    echo "ERROR($LINENO): Spaces not acceped in cell values"
fi

NUM_REC=43
NUM_FLD=10
TARGET_BCF=$DATA_PATH/10.1e4.var.bcf
TARGET_PED=$DATA_PATH/10.1e4.var.ped

$PLINK_SRC/plink \
    --make-bed \
    --bcf $TARGET_BCF \
    --out $TARGET_BCF.plink \
    --allow-extra-chr \
     2> /dev/null 1> /dev/null

~/src/plink2/plink \
     --bfile $TARGET_BCF.plink \
     --freq \
     --allow-extra-chr \
     --out plink.out \
     2> /dev/null 1> /dev/null

PLINK_COUNT=`cat plink.out.frq \
    | grep -v "CHR" \
    | awk '{if ($4 == "A") print $5*$6; else print (1-$5)*$6;}' \
    | awk '{s+=$1} END {print s}'`

export BCFTOOLS_PLUGINS="/Users/rl6sf/src/bcftools/plugins/"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/Users/rl6sf/src/htslib"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/Users/rl6sf/src/htslib"

BCFTOOLS_COUNT=`bcftools view $TARGET_BCF\
    | bcftools plugin fill-AN-AC \
    | grep -v "#" \
    | cut -f 8 | cut -d ";" -f3 | cut -d "=" -f2 \
    | awk '{s+=$1} END {print s}'`


$GQT_PATH/gqt convert bcf -i $TARGET_BCF -f $NUM_FLD -r $NUM_REC
$GQT_PATH/gqt convert ped -i $TARGET_PED

HET_COUNT=`$GQT_PATH/gqt query \
    -i $TARGET_BCF.gqt \
    -d $TARGET_PED.db \
    -p "" \
    -g "count(HET)" \
    | grep -v "#" \
    | cut -d "=" -f3 \
    | awk '{s+=$1} END {print s}'`

ALT_COUNT=`$GQT_PATH/gqt query \
    -i $TARGET_BCF.gqt \
    -d $TARGET_PED.db \
    -p "" \
    -g "count(HOMO_ALT)" \
    | grep -v "#" \
    | cut -d "=" -f3 \
    | awk '{s+=$1*2} END {print s}'`

GQT_COUNT=`echo $HET_COUNT $ALT_COUNT | awk '{print $1+$2;}'`

if [ $GQT_COUNT -eq $BCFTOOLS_COUNT ]
then
    echo "SUCCESS($LINENO): GQT count matches BCFTOOLS count"
else
    echo "ERROR($LINENO): GQT count does not matche BCFTOOLS count. $GQT_COUNT vs $BCFTOOLS_COUNT"
fi

if [ $GQT_COUNT -eq $PLINK_COUNT ]
then
    echo "SUCCESS($LINENO): GQT count matches PLINK count"
else
    echo "ERROR($LINENO): GQT count does not matche PLINK count. $GQT_COUNT vs $PLINK_COUNT"
fi

rm plink.out.frq    plink.out.log   plink.out.nosex
rm .tmp.*
