
*IFLS 3 Yr 2000
clear


*#### STEP ONE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\b3a_cov.dta"

keep  pidlink hhid00 pid00 dob_yr marstat sex

*First Marriage 1 for single
replace marstat=0 if marstat>1
*replace marstat=0 if marstat==1
*Male = 0
replace sex=0 if sex==1
*Female = 1
replace sex=1 if sex==3

rename sex gender2000
rename marstat marital_status2000
rename dob_yr dob_yr2000

gen age2000 = 2000-dob_yr2000

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_1.dta", replace


*#### STEP TWO ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\b3a_dl1.dta"

keep pidlink hhid00 pid00 dl02 dl03 dl04 dl06 dl01e

*No = 0
replace dl02=0 if dl02>1
*No = 0
replace dl03=0 if dl03>1
*No = 0
replace dl04=0 if dl04>1
*elementary
replace dl06=81 if dl06==2
replace dl06=81 if dl06==17
replace dl06=81 if dl06==70
replace dl06=81 if dl06==72
*junior high
replace dl06=82 if dl06==3
replace dl06=82 if dl06==4
replace dl06=82 if dl06==11
replace dl06=82 if dl06==12
replace dl06=82 if dl06==73
*senior high
replace dl06=83 if dl06==5
replace dl06=83 if dl06==6
replace dl06=83 if dl06==74
*university
replace dl06=84 if dl06==60
replace dl06=84 if dl06==61
replace dl06=84 if dl06==62
replace dl06=84 if dl06==63
replace dl06=84 if dl06==13
*others/islamic school
replace dl06=0 if dl06==10
replace dl06=0 if dl06==14

gen elem =0
gen jhigh =0
gen shigh =0
gen uni =0

replace elem=1 if dl06==81
replace jhigh=1 if dl06==82
replace shigh=1 if dl06==83
replace uni=1 if dl06==84

*Labelling Variables
label variable elem "Respondent attended elementary school"
label variable jhigh "Respondent attended junior high school"
label variable shigh "Respondent attended senior high school"
label variable uni "Respondent attended university school"

gen jawa =0
gen sunda =0
gen bali =0
gen batak =0
gen bugis =0
gen tionghoa =0
gen madura =0
gen sasak =0
gen minang =0
gen banjar =0
gen bimadompu =0
gen makassar =0
gen nias =0
gen palembang =0
gen sumbawa =0
gen toraja =0
gen betawi =0
gen dayak =0
gen melayudeli =0
gen komering =0
gen ambon =0
gen manado =0
gen aceh =0
gen southsumatera =0
gen others =0

replace jawa =1 if dl01e ==1
replace sunda =1 if dl01e ==2
replace bali =1 if dl01e ==3
replace batak =1 if dl01e ==4
replace bugis =1 if dl01e ==5
replace tionghoa =1 if dl01e ==6
replace madura =1 if dl01e ==7
replace sasak =1 if dl01e ==8
replace minang =1 if dl01e ==9
replace banjar =1 if dl01e ==10
replace bimadompu =1 if dl01e ==11
replace makassar =1 if dl01e ==12
replace nias =1 if dl01e ==13
replace palembang =1 if dl01e ==14
replace sumbawa =1 if dl01e ==15
replace toraja =1 if dl01e ==16
replace betawi =1 if dl01e ==17
replace dayak =1 if dl01e ==18
replace melayudeli =1 if dl01e ==19
replace komering =1 if dl01e ==20
replace ambon =1 if dl01e ==21
replace manado =1 if dl01e ==22
replace aceh =1 if dl01e ==23
replace southsumatera =1 if dl01e ==25
replace others =1 if dl01e ==95

*Labelling Variables
label variable jawa "Ethnical Group - Jawa"
label variable sunda "Ethnical Group - Sunda"
label variable bali "Ethnical Group - Bali"
label variable batak "Ethnical Group - Batak"
label variable bugis "Ethnical Group - Bugis"
label variable tionghoa "Ethnical Group - Tionghoa"
label variable madura "Ethnical Group - Madura"
label variable sasak "Ethnical Group - Sasak"
label variable minang "Ethnical Group - Minang"
label variable banjar "Ethnical Group - Banjar"
label variable bimadompu "Ethnical Group - Bimadompu"
label variable makassar "Ethnical Group - Makassar"
label variable nias "Ethnical Group - Nias"
label variable palembang "Ethnical Group - Palembang"
label variable sumbawa "Ethnical Group - Sumbawa"
label variable toraja "Ethnical Group - Toraja"
label variable betawi "Ethnical Group - Betawi"
label variable dayak "Ethnical Group - Dayak"
label variable melayudeli "Ethnical Group - Melayudeli"
label variable komering "Ethnical Group - Komering"
label variable ambon "Ethnical Group - Ambon"
label variable manado "Ethnical Group - Manado"
label variable aceh "Ethnical Group - Aceh"
label variable southsumatera "Ethnical Group - SouthSumatera"
label variable others "Ethnical Group - Others"


rename dl02 read2000
rename dl03 write2000
rename dl04 sch_atn2000
rename dl06 highedu2000
rename dl01e ethnicalgroup2000

sort pidlink
merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_1.dta"

drop _merge

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_2.dta", replace


*#### STEP THREE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\b3a_tk1.dta"

keep pidlink hhid00 pid00 tk01 tk02 tk05

*Employed = 1
replace tk01=0 if tk01!=1
*No = 0
replace tk02=0 if tk02>1
*No = 0
replace tk05=0 if tk05>1

rename tk01 curremployed2000
rename tk02 pastwrk2000
rename tk05 wrkbef2000

sort pidlink
merge 1:1 pidlink using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_2.dta"

drop _merge

sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_3.dta", replace


use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\bk_ar1.dta"
keep pidlink hhid00 pid00 ar02b 
gen childinhh2000 =0
replace childinhh2000 = 1 if ar02b==3
bysort pidlink (ar02b): keep if ar02b==3
label variable childinhh2000 "Was a biological child in household in 2000"
sort pidlink
drop ar02b
merge 1:1 pidlink hhid00 pid00 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_3.dta"
drop _merge
sort pidlink
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_4.dta", replace

*#### STEP HouseHold Head ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\bk_ar1.dta"

keep pidlink hhid00 pid00 ar02b ar16 ar07

bysort pidlink (ar02b): keep if ar02b==1

*elementary
replace ar16=81 if ar16==2
replace ar16=81 if ar16==17
replace ar16=81 if ar16==70
replace ar16=81 if ar16==72
*junior high
replace ar16=82 if ar16==3
replace ar16=82 if ar16==4
replace ar16=82 if ar16==11
replace ar16=82 if ar16==12
replace ar16=82 if ar16==73
*senior high
replace ar16=83 if ar16==5
replace ar16=83 if ar16==6
replace ar16=83 if ar16==74
*university
replace ar16=84 if ar16==9
replace ar16=84 if ar16==60
replace ar16=84 if ar16==61
replace ar16=84 if ar16==62
replace ar16=84 if ar16==63
replace ar16=84 if ar16==13
*others/islamic school
replace ar16=0 if ar16==10
replace ar16=0 if ar16==14

gen hhelem =0
gen hhjhigh =0
gen hhshigh =0
gen hhuni =0

replace hhelem=1 if ar16==81
replace hhjhigh=1 if ar16==82
replace hhshigh=1 if ar16==83
replace hhuni=1 if ar16==84

label variable hhelem "Household head attended elementary school"
label variable hhjhigh "Household head attended junior high school"
label variable hhshigh "Household head attended senior high school"
label variable hhuni "Household head attended university school"

drop ar02b
drop ar16
drop pidlink
drop pid00

*Female = 0
replace ar07=0 if ar07==3

rename ar07 headsex2000

label variable headsex2000 "Gender of HH, 0 for female, 1 for male"

sort hhid00
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_1a.dta", replace



*#### STEP FOUR ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\b2_kr.dta"

keep hhid00 kr11 kr24a

*No = 0
replace kr11=0 if kr11>1
*No = 0
replace kr24a=0 if kr24a>1

rename kr11 elec2000
rename kr24a tele2000

sort hhid00
merge 1:1 hhid00 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_1a.dta"

drop _merge

sort hhid00
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_a.dta", replace


*#### STEP FIVE ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\bk_sc.dta"

keep hhid00 sc01 sc02 sc03 sc05 sc17

*Urban = 0
replace sc05=0 if sc05==1
*Rural = 1
replace sc05=1 if sc05==2

gen bps2000 = sc01*100000 + sc02*1000 + sc03
gen cc2_2000 = sc01*100 + sc02

rename sc01 prov2000
rename sc02 kab2000
rename sc03 kec2000
rename sc05 rural2000
rename sc17 totalhhmember2000

sort hhid00
merge 1:1 hhid00 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_a.dta"

drop _merge

sort hhid00
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_b.dta", replace


*#### STEP Dwelling ####

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\IFLS\IFLS3\hh00_all_dta\bk_krk.dta"

keep hhid00 krk01 krk05a krk06

gen singleunitsinglelevel =0
gen singleunitmultiplelevels =0
gen duplexsinglelevel =0
gen duplexmultiplelevels =0
gen multipleunitsinglelevel  =0
gen multipleunitmultiplelevels  =0
gen houseonstilts =0

replace singleunitsinglelevel =1 if krk01==1
replace singleunitmultiplelevels =1 if krk01==2
replace duplexsinglelevel =1 if krk01==3
replace duplexmultiplelevels =1 if krk01==4
replace multipleunitsinglelevel =1 if krk01==5
replace multipleunitmultiplelevels =1 if krk01==6
replace houseonstilts =1 if krk01==8

rename krk01 housetype2000
rename krk05a housesizesqm2000
rename krk06 roomnum2000

sort hhid00
merge 1:1 hhid00 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_b.dta"

drop _merge

sort hhid00
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_c.dta", replace


*#### STEP SIX #### MERGING DISTRICT INFO WITH INDIVIDUAL

use "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_c.dta"

sort hhid00
merge 1:m hhid00 using "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_4.dta"

drop _merge

*keep only female under 18
bysort pidlink (gender2000): keep if gender2000==1
bysort pidlink (age): keep if age<18
*gen year = 2000

replace childinhh2000 = 0 if childinhh2000 ==.
save "C:\Users\nigel\Dropbox\Public\Unisim\Modules\Sem 19_1\ANL488 Business Analytics Applied Project\Child Marriage\Working Folder\STATAWD\2000_combined.dta", replace
