
*IFLS 4 Yr 2007
clear 
 
*#### STEP ONE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS4\hh07_all_dta\b3a_cov.dta"

keep  pidlink hhid07 pid07 dob_yr marstat sex 

*First Marriage 1 for married 
replace marstat=0 if marstat!=2
replace marstat=1 if marstat==2
*Male = 0
replace sex=0 if sex==1 
*Female = 1
replace sex=1 if sex==3

rename sex gender2007
rename marstat marital_status2007
rename dob_yr dob_yr2007

gen age2007 = 2007-dob_yr2007

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_1.dta", replace


*#### STEP TWO ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS4\hh07_all_dta\b3a_sw.dta"

keep pidlink hhid07 pid07 sw12
replace sw12=. if sw12==9
rename sw12 happy2007

sort pidlink
merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_1.dta"

drop _merge

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_2.dta", replace


*#### STEP THREE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS4\hh07_all_dta\b4_cov.dta"

keep pidlink hhid07 pid07 marstat

*First Marriage 1 for married 
replace marstat=0 if marstat!=2
replace marstat=1 if marstat==2

gen gender2007 = 1
rename marstat marital_status2007

sort pidlink
merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_2.dta"

drop _merge

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_3.dta", replace


*#### STEP FOUR ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS4\hh07_all_dta\bk_sc.dta"

keep hhid07 sc010707 sc020707 sc030707 sc05

*Urban = 0
replace sc05=0 if sc05==1
*Rural = 1
replace sc05=1 if sc05==2

gen bps2007 = sc01*100000 + sc02*1000 + sc03
gen cc2_2007 = sc01*100 + sc02

rename sc010707 prov2007
rename sc020707 kab2007
rename sc030707 kec2007
rename sc05 rural2007
 
sort hhid07
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_a.dta", replace


*#### STEP FIVE #### MERGING DISTRICT INFO WITH INDIVIDUAL

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_a.dta"

sort hhid07
merge 1:m hhid07 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_3.dta"

drop _merge

*keep only female
bysort pidlink (gender2007): keep if gender2007==1
bysort pidlink (age): keep if age>1
bysort pidlink (age): keep if age<25
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2007_combined.dta", replace


