/* data cleaning section */

*Q1 import data from excel
 *a)Import from excel not shown because it many not run in other computer*
 *b)
bysort town_id (turnout_total): gen desired_rank = sum(tournout_total!= turnout_total[_n-1])

egen rank = rank(-turnout_total), by(town_id)

note: town id 250 is not part of the main database

*C)
replace registered_male=0 if registered_male==-999
replace registered_male=0 if registered_male==-998
replace registered_female=0 if registered_female==-999
replace registered_female=0 if registered_female==-998
replace registered_total=0 if registered_total==-999
replace registered_total=0 if registered_total==-998

*D)
generate town_id_172=0
replace town_id_172=1 if town_id==172

generate town_id_173=0
replace town_id_173=1 if town_id==173

generate town_id_175=0
replace town_id_175=1 if town_id==175

generate town_id_176=0
replace town_id_176=1 if town_id==176

generate town_id_177=0
replace town_id_177=1 if town_id==177

generate town_id_190=0
replace town_id_190=1 if town_id==190

generate town_id_191=0
replace town_id_191=1 if town_id==191

generate town_id_192=0
replace town_id_192=1 if town_id==192

generate town_id_193=0
replace town_id_193=1 if town_id==193

generate town_id_195=0
replace town_id_195=1 if town_id==195

generate town_id_196=0
replace town_id_196=1 if town_id==196

generate town_id_197=0
replace town_id_197=1 if town_id==197

generate town_id_198=0
replace town_id_198=1 if town_id==198

generate town_id_199=0
replace town_id_199=1 if town_id==199

generate town_id_200=0
replace town_id_200=1 if town_id==200

generate town_id_201=0
replace town_id_201=1 if town_id==201

generate town_id_208=0
replace town_id_208=1 if town_id==208

generate town_id_210=0
replace town_id_210=1 if town_id==210

generate town_id_211=0
replace town_id_211=1 if town_id==211

generate town_id_212=0
replace town_id_212=1 if town_id==212

generate town_id_213=0
replace town_id_213=1 if town_id==213

generate town_id_235=0
replace town_id_235=1 if town_id==235

generate town_id_236=0
replace town_id_236=1 if town_id==236

generate town_id_237=0
replace town_id_237=1 if town_id==237

generate town_id_238=0
replace town_id_238=1 if town_id==238

generate town_id_239=0
replace town_id_239=1 if town_id==239

generate town_id_250=0
replace town_id_250=1 if town_id==250


*e) tried but wasted to much time trying to match two datasets created
*the formula to use will me one to many merge from matching town id and town name 
*between the two files but failes to performed 
*"variable town_id does not uniquely identify observations in the master data" will be the outcome 
*each time I tried. 


*f)

label variable turnout_total "Electoral data"
label variable turnout_male "Electoral data"
label variable turnout_female "Electoral data"
label variable registered_total "Electoral data"
label variable registered_male "Electoral data"
label variable registered_female "Electoral data"


*G) 
 * use the formula label value treatment ( ...) but did not have time to perform
 
 * Q2 failed to regress problem setting the panel data an fixed effects
 
 *Q3 failed to performed would have used bars with total turnout and female turn out comparison
 *treatment and control
 
 *Q4 among the ones I use often , compress will be the one I like the most 
 *it redifines the way you save your variables , this is very useful 
 *when working with large set of variables , stata redifine them to the
 *best and least heavy way of storage like from long to bytes. 
