import excel "/Users/aleqn/Downloads/nyts2017.xlsx", sheet("nyts2017") firstrow
browse SEX
tab1 CCIGT -CBIDIS
*tab consecutive variables with - 
*tab1 creates one way tables for a list of variables without merging them
tab1 RACE_M SEX hsms
summarize finwgt
tab stratum
bysort stratum: tab psu


foreach var of varlist CCIGT CCIGAR CSLT CELCIGT CHOOKAH CROLLCIGTS CPIPE CSNUS CDISSOLV CBIDIS {

recode `var' (2 = 0) (1 = 100), gen (`var'_2)

}

rename *, lower/*rename all lowercase*/
tab1 ccigt_2-cbidis_2

*egen rowtotal for the sum of all obsv in the row
egen csmokeless = rowtotal(csnus_2 cdissolv_2 cslt_2), missing
recode csmokeless (100/max = 100)
tab csmokeless

egen ctobany = rowtotal(ccigt_2 ccigar_2 chookah_2 cpipe_2 cbidis_2 celcigt_2 csmokeless), missing
recode ctobany (100/max = 100)
tab ctobany

egen ctobcomb = rowtotal(ccigt_2 ccigar_2 chookah_2 cpipe_2 cbidis_2), missing 
recode ctobcomb (100/max = 100)
tab ctobcomb

egen ctob2 = rowtotal(ccigt_2 ccigar_2 celcigt_2 chookah_2 cpipe_2 csmokeless cbidis_2), missing
recode ctob2 (0 100 = 0)(200/700 = 100) /*numbers are in the hundreds because we recoded as 0, 100*/
tab ctob2

label define sex 1 "female" 2 "male"
label values sex sex
tab sex

recode race_m (1=1 "white")(2=2 "black")(3=3 "hispanic")(4/7 = 4 "other"), gen(race4)
tab race4

svyset [pweight = finwgt], strata(stratum) psu(psu)






