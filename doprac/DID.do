/* Create a dummy variable to indicate the time when the treatment started. Lets
assume that treatment started in 1994. In this case, years before 1994 will
have a value of 0 and 1994+ a 1. If you already have this skip this step.*/

gen time = (year>=1994) & !missing(year)

/* Create a dummy variable to identify the group exposed to the treatment. In
this example lets assumed that countries with code 5,6, and 7 were treated
(=1). Countries 1-4 were not treated (=0). If you already have this skip this
step.*/
gen treated = (country>4) & !missing(country)

/** Create an interaction between time and treated. We will call this interaction
‘did’*/
gen did = time*treated

/* did estimator*/

reg y time treated did, r

/** The coefficient for ‘did’ is the differences-in-differences
estimator. The effect is significant at 10% with the treatment having
a negative effect.*/
