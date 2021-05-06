*keep primary and TIMSS perhaps PISA for analysis
import excel "/Users/aleqn/Downloads/hlo.xlsx", sheet("HLO Database") firstrow
keep region level sourcetest hlo year subject code
keep if level =="sec"
drop level
keep if sourcetest=="PISA"
drop sourcetest

collapse (mean) hlo, by(year region subject)
