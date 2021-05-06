*Version stata 14
** Task 2 **

/* The survey data for the Northern region of the survey area used a different 
variable format in the agriculture module. 
All respondents in both areas were asked 
if they grew the following crops, or if they grew any other crop:
1.	Rice
2.	Cassava
3.	Millet
4.	Groundnut
5.	Sweet Potato
6.	Wheat
7.	Sorghum
Please combine these datasets in a consistent manner. 
The affected variables are crop_l1 through crop_l9 in 
the hh_round1.dta file and crop_l in hh_nr_round1.dta file.
Note: The hh_nr_round1.dta has been cleaned by another RA 
and may not be fully clean. In addition, please provide 
justifications for any decisions you need to make about the data to perform the task. */

*0 set environment

************************************************************************
************************************************************************
* start log 
clear all
capture log close
set more off 

if c(username) == "user1" {
cd "/Users/user1/Downloads/Task 2/"
}
else if c(username) == "user2" {
cd "/Users/user2/Downloads/Task 2/"
}

cd "/Users/`c(username)'/Downloads/Task 2/"

*Setting do-file and log file
  
log using "task_2_1.log",replace

use hh_round1.dta
br 

format hhid
tab cropl_1
tab cropl_9
codebook cropl_1

clear

use hh_nr_round1.dta
br

format hhid
*inconsistent format with master so I need to adjust this
 gen hhid_1= substr(hhid,3,13) // I want to keep the 13 values but delete one 0 , I chose 0 from position 3
 gen hhid_2=1 // I want to gen an string with only 1
 tostring hhid_2, replace // I want it to be string 
 gen hhid_u= hhid_2+ hhid_1 // concatenate 
 format hhid_u // I verify that has the same format as the master dataset
 drop hhid hhid_2 hhid_1 // bye to the others
 rename hhid_u hhid
 duplicates report hhid
 return list
 
	codebook crop_l
* here the variable is coded strangely, so I will assume that wherever 
*I see a number means the person replied yes (1) 
*and no number means 0, I will split variable into the different crop qs and adjust the dataset.

split crop_l, parse(" ") generate(crop_l)

foreach var of varlist crop_l4-crop_l7 {

	replace `var'= "" if `var' =="-111"
	
	}
*replace crop_l7="" if crop_l7=="-111"
*replace crop_l6="" if crop_l6=="-111"
*replace crop_l5="" if crop_l5=="-111"
*replace crop_l4="" if crop_l4=="-111"
drop crop_l7

*generate dummies 7
tab crop_l1, gen(dum_)

*dum 1
foreach var of varlist dum_1 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="1"
	}
}

/*replace dum1=1 if crop_l1=="1"
replace dum1=1 if crop_l2=="1"
replace dum1=1 if crop_l3=="1"
replace dum1=1 if crop_l4=="1"
replace dum1=1 if crop_l5=="1"
replace dum1=1 if crop_l6=="1"*/
*replace dum_1=0 if dum_1==.
foreach var of varlist dum_2 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="2"
	}
}

*dum2
/*replace dum2=1 if crop_l1=="2"
replace dum2=1 if crop_l2=="2"
replace dum2=1 if crop_l3=="2"
replace dum2=1 if crop_l4=="2"
replace dum2=1 if crop_l5=="2"
replace dum2=1 if crop_l6=="2"
replace dum2=0 if dum2==.*/

foreach var of varlist dum_3 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="3"
	}
}


*dum3=
/*replace dum3=1 if crop_l1=="3"
replace dum3=1 if crop_l2=="3"
replace dum3=1 if crop_l3=="3"
replace dum3=1 if crop_l4=="3"
replace dum3=1 if crop_l5=="3"
replace dum3=1 if crop_l6=="3"
replace dum3=0 if dum3==.*/

foreach var of varlist dum_4 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="4"
	}
}

*dum4=
/*replace dum4=1 if crop_l1=="4"
replace dum4=1 if crop_l2=="4"
replace dum4=1 if crop_l3=="4"
replace dum4=1 if crop_l4=="4"
replace dum4=1 if crop_l5=="4"
replace dum4=1 if crop_l6=="4"
replace dum4=0 if dum4==.*/
foreach var of varlist dum_5 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="5"
	}
}

*dum5
/*replace dum5=1 if crop_l1=="5"
replace dum5=1 if crop_l2=="5"
replace dum5=1 if crop_l3=="5"
replace dum5=1 if crop_l4=="5"
replace dum5=1 if crop_l5=="5"
replace dum5=1 if crop_l6=="5"
replace dum5=0 if dum5==.*/

foreach var of varlist dum_6 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="6"
	}
}

*dum6
/*replace dum6=1 if crop_l1=="6"
replace dum6=1 if crop_l2=="6"
replace dum6=1 if crop_l3=="6"
replace dum6=1 if crop_l4=="6"
replace dum6=1 if crop_l5=="6"
replace dum6=1 if crop_l6=="6"
replace dum6=0 if dum6==.*/

foreach var of varlist dum_7 {
 forvalues i = 1/6 {
	replace `var'= 1 if crop_l`i'=="7"
	}
}


*dum7
/*replace dum7=1 if crop_l1=="7"
replace dum7=1 if crop_l2=="7"
replace dum7=1 if crop_l3=="7"
replace dum7=1 if crop_l4=="7"
replace dum7=1 if crop_l5=="7"
replace dum7=1 if crop_l6=="7"
replace dum7=0 if dum7==.*/


drop crop_l crop_l1 crop_l2 crop_l3 crop_l4 crop_l5 crop_l6

local num 1 2 3 4 5 6 7
local mcode 0

foreach dum of local num {
    local mcode = `dum'
    rename dum_`mcode' crop_l`dum'
	}
*rename dum1 cropl_1
*rename dum2 cropl_2
*rename dum3 cropl_3
*rename dum4 cropl_4
*rename dum5 cropl_5
*rename dum6 cropl_6
rename crop_l7 cropl_9

save "hh_nr_round1_1.dta",replace

use hh_round1.dta
br 

*combine
 merge 1:m hhid using "hh_nr_round1_1.dta"
 sort hhid
 drop crop_l1 crop_l2 crop_l3 crop_l4 crop_l5 crop_l6
 save "hh_nr_combined.dta",replace
 log close
 

