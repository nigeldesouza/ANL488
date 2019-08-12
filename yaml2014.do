
*IFLS 5 Yr 2014
clear 
 
*#### STEP ONE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS5\hh14_all_dta\b3a_cov.dta"

keep  pidlink hhid14 pid14 dob_yr marstat sex 

*First Marriage 1 for married 
replace marstat=0 if marstat!=2
replace marstat=1 if marstat==2
*Male = 0
replace sex=0 if sex==1 
*Female = 1
replace sex=1 if sex==3

rename sex gender2014
rename marstat marital_status2014
rename dob_yr dob_yr2014

gen age2014 = 2014-dob_yr2014

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_1.dta", replace

*#### STEP TWO ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS5\hh14_all_dta\b3a_sw.dta"

keep pidlink hhid14 pid14 sw12

replace sw12=1 if sw12==1
replace sw12=2 if sw12==2
replace sw12=3 if sw12==3
replace sw12=4 if sw12==4


rename sw12 happy2014

sort pidlink
merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_1.dta"

drop _merge

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_2.dta", replace


*#### STEP THREE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS5\hh14_all_dta\b4_cov.dta"

keep pidlink hhid14 pid14 marstat

*First Marriage 1 for married 
replace marstat=0 if marstat!=2
replace marstat=1 if marstat==2

gen gender2014 = 1
rename marstat marital_status2014

sort pidlink
merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_2.dta"

drop _merge

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_3.dta", replace


*#### STEP FOUR ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS5\hh14_all_dta\bk_sc1.dta"

keep hhid14 sc01_14_14 sc02_14_14 sc03_14_14 sc05

*Urban = 0
replace sc05=0 if sc05==1
*Rural = 1
replace sc05=1 if sc05==2

gen bps2014 = sc01*100000 + sc02*1000 + sc03
gen cc2_2014 = sc01*100 + sc02

rename sc01_14_14 prov2014
rename sc02_14_14 kab2014
rename sc03_14_14 kec2014
rename sc05 rural2014
 
sort hhid14
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_a.dta", replace


*#### STEP FIVE #### MERGING DISTRICT INFO WITH INDIVIDUAL

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_a.dta"

sort hhid14
merge 1:m hhid14 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_3.dta"

drop _merge

*keep only female
bysort pidlink (gender2014): keep if gender2014==1
bysort pidlink (age): keep if age>1
bysort pidlink (age): keep if age<32
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2014_combined.dta", replace
