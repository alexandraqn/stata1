*DUMMY TABLES*

*Created by alexandra quiñones*
**25-09-17**
***NEC FINAL DATA 7/SEP/2017***

*STEP 1 GLOBALS
clear all

global base "/Users/alexandraqn/Desktop/LISGIS"

global data_source	"$base/NEC_FINAL"
global new_data		"$base/Created Data" 
global tables		"$base/Tables"

/* the data file has 18,125 observations
and 96 variables, at this stage missing dates is the main
problem*/
***************************************************
* label and encode (preliminary)
***************************************************

use "$base/NEC_FINAL/NEC_2017_YES_LATEST.dta", replace


*TABLE 2.3 DISTRIBUTION OF ESTABLISHMENTS (NUMBER AND %) BY COUNTY
*RUN FROM HERE UNTIL END
*BEGIN
tab q1_1n , matcell(freq) matrow(names)
putexcel A1=("County Name") B1=("Number of Businesses") C1=("Percent") using "$base/NEC_FINAL/NECTABLES", sheet("2.3") replace
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q1_1n) `val'
 
        local freq_val = freq[`i',1]
 
        local percent_val = `freq_val'/`r(N)'*100
        local percent_val : display %9.2f `percent_val'
 
        local cum_percent : display %9.2f (`cum_percent' + `percent_val')
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`percent_val') ///
                using "$base/NEC_FINAL/NECTABLES", sheet("2.3") modify
        local row = `row' + 1
}
 
putexcel A`row'=("Total") B`row'=(r(N)) C`row'=(100.00) using "$base/NEC_FINAL/NECTABLES", sheet ("2.3") modify
*END

*TABLE 2.1 DISTRIBUTION (PERCENT AND NUMBER) OF ESTABLISHMENTS BY INSTITUTIONAL SECTOR
*RUN FROM HERE UNTIL END
*BEGIN
tab q7 , matcell(freq) matrow(names)
putexcel A1=("Ownership Status") B1=("Number of Businesses") C1=("Percent") using "$base/NEC_FINAL/NECTABLES", sheet("2.1") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q7) `val'
 
        local freq_val = freq[`i',1]
 
        local percent_val = `freq_val'/`r(N)'*100
        local percent_val : display %9.2f `percent_val'
 
        local cum_percent : display %9.2f (`cum_percent' + `percent_val')
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`percent_val') ///
                using "$base/NEC_FINAL/NECTABLES", sheet("2.1") modify
        local row = `row' + 1
}
 
putexcel A`row'=("Total") B`row'=(r(N)) C`row'=(100.00) using "$base/NEC_FINAL/NECTABLES", sheet ("2.1") modify
*END

*TABLE 2.2 DISTRIBUTION ESTABLISHMENTS (NUMBER AND PERCENT) BY ECONOMIC ACTIVITY
*RUN FROM HERE UNTIL END
*BEGIN
tab q6_0 , matcell(freq) matrow(names)
putexcel A1=("Economic Activity") B1=("Number of Businesses") C1=("Percent") using "$base/NEC_FINAL/NECTABLES", sheet("2.2") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q6_0) `val'
 
        local freq_val = freq[`i',1]
 
        local percent_val = `freq_val'/`r(N)'*100
        local percent_val : display %9.2f `percent_val'
 
        local cum_percent : display %9.2f (`cum_percent' + `percent_val')
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`percent_val') ///
                using "$base/NEC_FINAL/NECTABLES", sheet("2.2") modify
        local row = `row' + 1
}
 
putexcel A`row'=("Total") B`row'=(r(N)) C`row'=(100.00) using "$base/NEC_FINAL/NECTABLES", sheet ("2.2") modify
*END

*TABLE 2.4 DISTRIBUTION ESTABLISHMENTS (NUMBER AND PERCENT) BY SIZE BASED ON EMPLOYEES
*RUN FROM HERE UNTIL END
*BEGIN
tab size , matcell(freq) matrow(names)
putexcel A1=("Size of Business") B1=("Number of Businesses") C1=("Percent") using "$base/NEC_FINAL/NECTABLES", sheet("2.4") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (size) `val'
 
        local freq_val = freq[`i',1]
 
        local percent_val = `freq_val'/`r(N)'*100
        local percent_val : display %9.2f `percent_val'
 
        local cum_percent : display %9.2f (`cum_percent' + `percent_val')
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`percent_val') ///
                using "$base/NEC_FINAL/NECTABLES", sheet("2.4") modify
        local row = `row' + 1
}
 
putexcel A`row'=("Total") B`row'=(r(N)) C`row'=(100.00) using "$base/NEC_FINAL/NECTABLES", sheet ("2.4") modify
*END


*TABLE 2.5 DISTRIBUTION ESTABLISHMENTS BY NATIONALITY OF OWNER
*RUN FROM HERE UNTIL END
*BEGIN
tab nat_owner , matcell(freq) matrow(names)
putexcel A1=("Nationality") B1=("Number of Businesses") C1=("Percent") using "$base/NEC_FINAL/NECTABLES", sheet("2.5") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (nat_owner) `val'
 
        local freq_val = freq[`i',1]
 
        local percent_val = `freq_val'/`r(N)'*100
        local percent_val : display %9.2f `percent_val'
 
        local cum_percent : display %9.2f (`cum_percent' + `percent_val')
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`percent_val') ///
                using "$base/NEC_FINAL/NECTABLES", sheet("2.5") modify
        local row = `row' + 1
}
 
putexcel A`row'=("Total") B`row'=(r(N)) C`row'=(100.00) using "$base/NEC_FINAL/NECTABLES", sheet ("2.5") modify
*END


*TABLE 2.7 NUMBER OF WORKERS AND GENDER STRUCTURE BY COUNTY
*RUN FROM HERE UNTIL END
*BEGIN
/*gen gen_worker=.
replace gen_worker=1 if q10_6m==*/

*WORKER RELATED THINGS NEED TO CHANGE 0 TO 1 AND GET DUMMYS*

*TABLE 4.1 DISTRIBUTION ESTABLISHMENTS BY LEGAL STATUS AND STRATUM
*RUN FROM HERE UNTIL END
*BEGIN
tab q7 q1_5, matcell(freq) matrow(names)
putexcel A1=("ownership status") B1=("urban") C1=("rural") ///
using "$base/NEC_FINAL/NECTABLES", sheet("4.1") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.1") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q7) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
               using "$base/NEC_FINAL/NECTABLES", sheet("4.1") modify
        local row = `row' + 1
}
 
*END

*table 4.2 sector and legal status
tab q6_0 q7, matcell(freq) matrow(names)
putexcel A1=("sector") B1=("sole proprietorship") C1=(" partnerships ") ///
 D1=("limited liability companies-private") E1=(" limited liability companies-public") ///
 F1=("non-government organizations/non-profit") G1=("others") ///
 using "$base/NEC_FINAL/NECTABLES", sheet("4.2") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.2") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q6_0) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
		local freq_val5 = freq[`i',5]
		local freq_val6 = freq[`i',6]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4') F`row'=(`freq_val5') /// 
				G`row'=(`freq_val6')using "$base/NEC_FINAL/NECTABLES", sheet("4.2") modify
        local row = `row' + 1
}
 
*END

*table 4.3 county and legal status
tab q1_1n q7, matcell(freq) matrow(names)
putexcel A1=("county") B1=("sole proprietorship") C1=(" partnerships ") ///
 D1=("limited liability companies-private") E1=(" limited liability companies-public") ///
 F1=("non-government organizations/non-profit") G1=("others") ///
 using "$base/NEC_FINAL/NECTABLES", sheet("4.3") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.3") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q1_1n) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
		local freq_val5 = freq[`i',5]
		local freq_val6 = freq[`i',6]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4') F`row'=(`freq_val5') /// 
				G`row'=(`freq_val6')using "$base/NEC_FINAL/NECTABLES", sheet("4.3") modify
        local row = `row' + 1
}
 
*END

*table 4.4 legal status and size
tab q7 size, matcell(freq) matrow(names)
putexcel A1=("ownership status") B1=("micro") C1=("small") D1=("medium") E1=("large") using "$base/NEC_FINAL/NECTABLES", sheet("4.4") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.4") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q7) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4')using "$base/NEC_FINAL/NECTABLES", sheet("4.4") modify
        local row = `row' + 1
}
 
*END

*table 4.5 legal status and turnover
tab q7 q11, matcell(freq) matrow(names)
putexcel A1=("ownership status") B1=("less than or equal to ld$70,000 ") C1=(" ld$70,001 - 200,000") ///
D1=("ld$200,001 - 800,000") E1=("ld$800,001 and above") using "$base/NEC_FINAL/NECTABLES", sheet("4.5") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.5") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q7) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4')  using "$base/NEC_FINAL/NECTABLES", sheet("4.5") modify
        local row = `row' + 1
}
 
*END

*table 4.6 manager gender and business legal status
tab q7 manager, matcell(freq) matrow(names)
putexcel A1=("ownership status") B1=("male") C1=("female") using "$base/NEC_FINAL/NECTABLES", sheet("4.6") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.6") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q7) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
               using "$base/NEC_FINAL/NECTABLES", sheet("4.6") modify
        local row = `row' + 1
}
 
*END

*table 4.7 q9 but problems with that variable in the data set
*tab q7 

*table 4.8 year of start and legal status
tab q4 q7, matcell(freq) matrow(names)
putexcel A1=("year") B1=("sole proprietorship") C1=(" partnerships ") ///
 D1=("limited liability companies-private") E1=(" limited liability companies-public") ///
 F1=("non-government organizations/non-profit") G1=("others") ///
 using "$base/NEC_FINAL/NECTABLES", sheet("4.8") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.8") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q4) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
		local freq_val5 = freq[`i',5]
		local freq_val6 = freq[`i',6]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4') F`row'=(`freq_val5') /// 
				G`row'=(`freq_val6')using "$base/NEC_FINAL/NECTABLES", sheet("4.8") modify
        local row = `row' + 1
}
 
*END


*table 4.9
tab q7 nat_owner, matcell(freq) matrow(names)
putexcel A1=("ownership status") B1=("liberian") C1=("ecowas national") D1=("other foreign national") using "$base/NEC_FINAL/NECTABLES", sheet("4.9") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.9") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q7) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') using "$base/NEC_FINAL/NECTABLES", sheet("4.9") modify
        local row = `row' + 1
}
 
*END

*table 4.10
tab q6_0 size, matcell(freq) matrow(names)
putexcel A1=("sector") B1=("micro") C1=("small") D1=("medium") E1=("large") using "$base/NEC_FINAL/NECTABLES", sheet("4.10") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.10") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (q6_0) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4')using "$base/NEC_FINAL/NECTABLES", sheet("4.10") modify
        local row = `row' + 1
}
 
*END

*table 4.11 Size of business and nationality of owner - it is confusing to use both nationalities because of the multiple owners
tab size nat_owner, matcell(freq) matrow(names)
putexcel A1=("size of business") B1=("liberian") C1=("ecowas") D1=("other foreign") using "$base/NEC_FINAL/NECTABLES", sheet("4.11") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.11") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (size) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') using "$base/NEC_FINAL/NECTABLES", sheet("4.11") modify
        local row = `row' + 1
}
 
*END

*4.12 size and legal status
tab size q7, matcell(freq) matrow(names)
putexcel A1=("size of business") B1=("sole proprietorship") C1=(" partnerships ") ///
 D1=("limited liability companies-private") E1=(" limited liability companies-public") ///
 F1=("non-government organizations/non-profit") G1=("others") ///
 using "$base/NEC_FINAL/NECTABLES", sheet("4.12") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.12") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (size) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
		local freq_val5 = freq[`i',5]
		local freq_val6 = freq[`i',6]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4') F`row'=(`freq_val5') /// 
				G`row'=(`freq_val6')using "$base/NEC_FINAL/NECTABLES", sheet("4.12") modify
        local row = `row' + 1
}
 
*END

*4.13 size and turnover
tab size q11, matcell(freq) matrow(names)
putexcel A1=("size of business") B1=("less than or equal to ld$70,000 ") C1=(" ld$70,001 - 200,000") ///
D1=("ld$200,001 - 800,000") E1=("ld$800,001 and above") using "$base/NEC_FINAL/NECTABLES", sheet("4.13") modify
putexcel A2=matrix((r(c)),names) using "$base/NEC_FINAL/NECTABLES", sheet("4.13") modify
local rows = rowsof(names)
local row = 2
local cum_percent = 0 

forvalues i = 1/`rows' {
 
        local val = names[`i',1]
        local val_lab : label (size) `val'
 
        local freq_val = freq[`i',1]
		local freq_val2 = freq[`i',2]
		local freq_val3 = freq[`i',3]
		local freq_val4 = freq[`i',4]
 
        putexcel A`row'=("`val_lab'") B`row'=(`freq_val') C`row'=(`freq_val2') ///
                D`row'=(`freq_val3') E`row'=(`freq_val4')  using "$base/NEC_FINAL/NECTABLES", sheet("4.13") modify
        local row = `row' + 1
}
 
*END of all the ends 

/* there is a problem with the variables related to workers in the way it is displayed example ///
tab q10_1m (do the same for the rest) 

employees-p |
 aid worker |
(in cash or |
    in kind |
    worker) |
       male |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |     11,069       63.07       63.07
          1 |      1,786       10.18       73.25
          2 |      1,295        7.38       80.63
          3 |        730        4.16       84.79
          4 |        495        2.82       87.61
          5 |        336        1.91       89.53
          6 |        273        1.56       91.08
          7 |        196        1.12       92.20
          8 |        153        0.87       93.07
          9 |        136        0.77       93.85
         10 |        129        0.74       94.58
         11 |         82        0.47       95.05
         12 |         81        0.46       95.51
         13 |         69        0.39       95.90
         14 |         64        0.36       96.27
         15 |         80        0.46       96.72
         16 |         34        0.19       96.92
         17 |         29        0.17       97.08
         18 |         39        0.22       97.30
         19 |         28        0.16       97.46
         20 |         52        0.30       97.76
         21 |         32        0.18       97.94
         22 |         19        0.11       98.05
         23 |         20        0.11       98.17
         24 |         22        0.13       98.29
         25 |         35        0.20       98.49
         26 |         21        0.12       98.61
         27 |         17        0.10       98.71
         28 |         15        0.09       98.79
         29 |         16        0.09       98.88
         30 |         17        0.10       98.98
         31 |          7        0.04       99.02
         32 |         13        0.07       99.09
         33 |         13        0.07       99.17
         34 |          6        0.03       99.20
         35 |          9        0.05       99.25
         36 |          3        0.02       99.27
         37 |          5        0.03       99.30
         38 |          9        0.05       99.35
         39 |          4        0.02       99.37
         40 |         12        0.07       99.44
         41 |          1        0.01       99.45
         42 |          3        0.02       99.46
         43 |          5        0.03       99.49
         44 |          3        0.02       99.51
         45 |          5        0.03       99.54
         46 |          4        0.02       99.56
         47 |          3        0.02       99.58
         48 |          3        0.02       99.60
         49 |          4        0.02       99.62
         50 |          5        0.03       99.65
         51 |          2        0.01       99.66
         52 |          3        0.02       99.68
         53 |          2        0.01       99.69
         54 |          2        0.01       99.70
         58 |          2        0.01       99.71
         59 |          1        0.01       99.72
         60 |          2        0.01       99.73
         62 |          1        0.01       99.73
         63 |          2        0.01       99.74
         64 |          1        0.01       99.75
         68 |          1        0.01       99.75
         69 |          1        0.01       99.76
         70 |          1        0.01       99.77
         71 |          1        0.01       99.77
         72 |          1        0.01       99.78
         74 |          1        0.01       99.78
         75 |          1        0.01       99.79
         76 |          1        0.01       99.79
         77 |          2        0.01       99.81
         78 |          1        0.01       99.81
         80 |          2        0.01       99.82
         83 |          1        0.01       99.83
         93 |          1        0.01       99.83
        100 |          6        0.03       99.87
        123 |          1        0.01       99.87
        133 |          1        0.01       99.88
        143 |          1        0.01       99.89
        144 |          1        0.01       99.89
        161 |          1        0.01       99.90
        165 |          2        0.01       99.91
        173 |          1        0.01       99.91
        175 |          1        0.01       99.92
        180 |          1        0.01       99.93
        190 |          1        0.01       99.93
        200 |          1        0.01       99.94
        239 |          1        0.01       99.94
        260 |          1        0.01       99.95
        316 |          1        0.01       99.95
        500 |          1        0.01       99.96
       1349 |          1        0.01       99.97
       1605 |          1        0.01       99.97
       1981 |          1        0.01       99.98
       2017 |          1        0.01       99.98
       2269 |          1        0.01       99.99
       2500 |          1        0.01       99.99
       6186 |          1        0.01      100.00
------------+-----------------------------------
      Total |     17,549      100.00
here the issue is that the LABEL IS IN REALITY THE NUMBER OF WORKERS AND THE
FRQUENCY COLUMN IS THE BUSINESSESS THE REPORTED TO HAVE SAY 6186 WORKERS , 
THEN THE QUESTIONS DOES NOT GIVE THE NUMBER OF WORKERS BUT RATHER THE NUMBER OF
BUSINESSES THAT REPORTED HAVING THAT AMOUNT OF WORKERS THEN WE NEED THE INVERSE.

what needs to be done is to multiply:
6186*1 = 6186 this is the amount of workers and the sum of all the previous list
is the amount of workers paid and male. */

