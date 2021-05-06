replace crop_l = subinstr(crop_l, " ", "", .)

split crop_l, parse(" ") generate(crop_l)

foreach var of varlist crop_l4-crop_l7 {

	replace `var'= "" if `var' =="-111"
	
	}

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
