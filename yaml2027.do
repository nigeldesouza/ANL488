
*IFLS 3 + 4
clear 
 
*#### STEP ONE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_combined.dta"

merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_combined.dta"

drop _merge 
drop gender2000
drop gender2007

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2027_combined.dta", replace


*Labelling Variables
label variable age2000 "age of respondent in 2000"
label variable age2007 "age of respondent in 2007"
label variable bps2000 "BPS code in 2000"
label variable marital_status2000 "1 for single in 2000"
label variable marital_status2007 "1 for married in 2007"

*generate column of verified child marriages 
gen cmtrue = 1 if marital_status2000 == 1 &  marital_status2007 == 1
label variable cmtrue "verified child marriage"
replace cmtrue = 0 if cmtrue ==.

gen cmtrue2 = cmtrue if age2000 !=.

gen telem = elem*cmtrue
gen tjhigh = jhigh*cmtrue
gen tshigh = shigh*cmtrue
gen tuni = uni*cmtrue

save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2027_combined.dta", replace


*use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_combined.dta"

merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_combined.dta"

drop _merge 
drop gender2014

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2027_combined.dta", replace


doubletofloat 

export delimited using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2027_csv.csv", replace

*reshape long rural, i(pidlink) j(year)
*xtset pidlink year
