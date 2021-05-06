clear all
*Created by alexandra quiñones*
**13-09-17**
***NEC FINAL DATA 7/SEP/2017***

*STEP 1 GLOBALS

global base "/Users/alexandraqn/Desktop/LISGIS"

global data_source	"$base/NEC_FINAL"
global new_data		"$base/Created Data" 
global tables		"$base/Tables"

/* the data file has 17,559 observations
and 98 variables, at this stage missing dates is the main
problem*/
***************************************************
* label and encode (preliminary)
***************************************************

use "$base/NEC_FINAL/nec_260917.dta"

*Keep only businesses that said YES

tab coi
keep if coi==1
*coi is whether they refused or not to the census
*check rfr to see if there is still people that refused
tab rfr
*15 appear to be refused still

*create and ID for all the businesses
*we will use the LIN as decided the 14-09-2017

gen b_id=substr(lin, 1,1)
gen id_num=_n
tostring id_num, replace 
gen B_id=b_id+ id_num
drop b_id id_num
order B_id, first

*conclusion : refused to provide certain info but provided relevant data on
*q5 and tot10 so keep */ 

label var rfr "reason to refuse some information"
label  var B_id "unique id of response"

*workers size of business
generate size=.
replace size=1 if tot10_6<=3
replace size=2 if tot10_6>3 & tot10_6<=9
replace size=3 if tot10_6>9 & tot10_6<=19
replace size=4 if tot10_6>19
tab size
label var size "size of business"
label def size 1 "micro" 2 "small" 3"medium" 4"large"
label values size size

saveold "$base/NEC_FINAL/NEC_2017_YES_LATEST.dta",replace

*tabulation to check all are 17559 
tab q1_4 
*there is a 1,705 classified as 999 , is this an error?
tab q2_3
*assert !missing(q2_3)
*false 2 missing values 

*create dummy 
*1 if liberian 
*2 if ecowas national
*3 if other foreign national
gen nat_owner=.
replace nat_owner=1 if q2_9_1==1
replace nat_owner=2 if q2_9_2==1
replace nat_owner=3 if q2_9_3==1
label def nat_owner 1 "liberian" 2"ecowas national" 3"other foreign national"
label values nat_owner nat_owner
tab nat_owner
*consider dropping q2_9_1 , 2 and 3

gen gen_owner=.
*replace for male equal to 1
replace gen_owner=1 if q2_11_l==1 
replace gen_owner=1 if q2_11_en==1  
replace gen_owner=1 if q2_11_fn==1  
replace gen_owner=2 if q2_11_l==2 
replace gen_owner=2 if q2_11_en==2  
replace gen_owner=2 if q2_11_fn==2 
replace gen_owner=3 if q2_11_l==3 
replace gen_owner=3 if q2_11_en==3  
replace gen_owner=3 if q2_11_fn==3 
tab gen_owner
*there are 8 missing  why?
label def gen_owner 1 "male" 2"female" 3"both male and female"
label values gen_owner gen_owner

tab q3 
*shows 6 observations missing

*create variable manager for gender of manager
gen manager=.
replace manager=1 if q2_3==2 & q2_4==1
replace manager=2 if q2_3==2 & q2_4==2
tab manager
label def manager 1 "male" 2 "female" 
label values manager manager

/*situation with the workers , all 0 to 1 because 0 workers means the owner is the worker
drop q10_1m=1 if q10_1m==0
replace q10_1f=1 if q10_1f==0
replace q10_2m=1 if q10_2m==0
replace q10_2f=1 if q10_2f==0
replace q10_3m=1 if q10_3m==0
replace q10_3f=1 if q10_3f==0
replace q10_4m=1 if q10_4m==0
replace q10_4f=1 if q10_4f==0
replace q10_5m=1 if q10_5m==0
replace q10_5f=1 if q10_5f==0
replace q10_6m=1 if q10_6m==0
replace q10_6f=1 if q10_6f==0*/

des q1_1n
encode q1_1n , generate (q1_1_n)
drop q1_1n
rename q1_1_n q1_1n
order q1_1n, after(q1_1)
saveold "$base/NEC_FINAL/NEC_2017_YES_LATEST.dta",replace
