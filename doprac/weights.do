use https://www.stata-press.com/data/r17/census5
*I want to tab by region to get the total pop per region
*https://www.stata.com/manuals/u.pdf#u11.1.6weight
tab region [fweight=pop]

sum median_age

clear all


webuse nhanes2f
