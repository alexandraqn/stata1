 clear all
*****total armed forces****
 wbopendata, language(en - English) country() topics(13 - Public Sector) indicator()
 *wbopendata, language(en - English) country() topics() indicator(Armed forces personnel, total)
 *Military expenditure (current LCU)
keep if indicatorname=="Armed forces personnel, total"
drop lendingtypename lendingtype adminregionname adminregion
drop if regionname=="Aggregates"
encode region, gen(reg)
rename reg reg1
drop countryname region incomelevel indicatorcode
reshape long yr, i(countrycode reg1 regionname incomelevelname indicatorname) j(year)
drop indicatorname regionname
rename yr armedfortot
collapse (sum) armedfortot, by(countrycode reg1 year)
collapse (sum) armedfortot, by(reg1 year)
tsset reg1 year
sort year
drop if armedfortot==0
****** total spent in military*****
 wbopendata, language(en - English) country() topics(13 - Public Sector) indicator()
 *wbopendata, language(en - English) country() topics() indicator(Armed forces personnel, total)
 *Military expenditure (current LCU)
keep if indicatorname=="Military expenditure (current LCU)"
drop lendingtypename lendingtype adminregionname adminregion
drop if regionname=="Aggregates"
encode region, gen(reg)
rename reg reg1
drop countryname region incomelevel indicatorcode
reshape long yr, i(countrycode reg1 regionname incomelevelname indicatorname) j(year)
drop indicatorname regionname
rename yr mili
collapse (sum) mili, by(countrycode reg1 year)
collapse (sum) mili, by(reg1 year)
tsset reg1 year
sort year
drop if year==2020
format %20.1f mili






