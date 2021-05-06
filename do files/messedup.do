clear
input str23 combined
"2014UKManchesterGBP"
"2015UKLondonGBP"
"2016IrelandDublinEUR"
end


gen year = substr(combined, 1, 4)
gen currency = substr(combined, -3, 3)
gen country_city = subinstr(combined, year, "", 1)
replace country_city = substr(country_city, 1, strlen(country_city)-3)
destring year, replace

gen country="UK" 

replace country="Ireland" if country_city=="IrelandDublin"

gen city="Manchester"
replace city="London" if country_city=="UKLondon"
replace city="Dublin" if country_city=="IrelandDublin"

drop country_city
