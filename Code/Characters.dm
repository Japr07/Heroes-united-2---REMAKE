mob/verb/Change_Character()
	set hidden=1
	set category="Options"
	src.CompleteTutorial("Changing Characters")
	var/obj/Choice=input("Choose New Character","Change Character") as null|anything in AllCharacters
	if(!Choice || !src.CanAct())	{src<<"Can't change characters at this time...";return}
	src.Character=new Choice.type
	src.Revert()
	if(src.Training=="Focus Training")	src.AddAura()
	src.icon=src.Character.icon
	src.UpdatePartyIcon()
	src.UpdateFaceHUD()
	src.ResetSuffix()

datum/TransDatum
	var/name
	var/icon
	var/ReqPL
	var/CustAura
	var/CharSpecials/BeamSpecial

proc/cTrans(var/Icon,var/NewPL,var/NewSpecial,var/NewCA)
	var/datum/TransDatum/T=new()
	T.name="[Icon]"
	T.icon=Icon;T.ReqPL=NewPL
	T.BeamSpecial=NewSpecial
	T.CustAura=NewCA
	return T

mob/proc/ApplyTransDatum(/**/)
	if(src.CurTrans)
		src.TransDatum=src.Character.Transes[src.CurTrans]
		src.icon=src.TransDatum.icon
	else
		src.TransDatum=null
		src.icon=src.Character.icon
	src.UpdatePartyIcon()

var/list/AllCharacters=typesof(/obj/Characters)-/obj/Characters
proc/PopulateAllChars()
	for(var/v in AllCharacters)
		AllCharacters+=new v
		AllCharacters-=v

obj/Characters
	var
		Aura="Blue"
		Race="Baby Panda"
		list/Transes=list()
		CharSpecials/BeamSpecial
	Kid_Goku
		Race="Saiyan"
		icon='Icons/Characters/KidGoku.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
	Goku
		Race="Saiyan"
		icon='Icons/Characters/Goku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GokuKaioken.dmi',1000,NewCA="Red"),cTrans('Icons/Characters/GokuSS1.dmi',100000),cTrans('Icons/Characters/GokuSS2.dmi',250000),cTrans('Icons/Characters/GokuSS3.dmi',500000),cTrans('Icons/Characters/GokuSS4.dmi',750000),cTrans('Icons/Characters/GokuSS5.dmi',999999,NewCA="White"))
	Shirtless_Goku
		Race="Saiyan"
		icon='Icons/Characters/ShirtlessGoku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/ShirtlessGokuFalseSS.dmi',50000),cTrans('Icons/Characters/AltGokuSS4.dmi',750000))
	Super_Goku
		Aura="Yellow"
		Race="Saiyan"
		icon='Icons/Characters/SuperGoku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/AltGokuSS4.dmi',750000))
	Yardrat_Goku
		Race="Saiyan"
		icon='Icons/Characters/YardratGoku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/YardratGokuSS.dmi',100000),cTrans('Icons/Characters/AltGokuSS4.dmi',750000))
	Saiyan_Armor_Goku
		Race="Saiyan"
		icon='Icons/Characters/SAGoku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/SAGokuSS.dmi',100000),cTrans('Icons/Characters/SAGokuUSS.dmi',250000),cTrans('Icons/Characters/AltGokuSS4.dmi',750000))
	GT_Goku
		Race="Saiyan"
		icon='Icons/Characters/GTGoku.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GTGokuSS1.dmi',100000),cTrans('Icons/Characters/GTGokuSS3.dmi',500000),cTrans('Icons/Characters/AltGokuSS4.dmi',750000,new/CharSpecials/KameHameHa))
	Adult_GT_Goku
		Race="Saiyan"
		icon='Icons/Characters/AdultGTGoku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/AdultGTGokuSS1.dmi',100000),cTrans('Icons/Characters/AdultGTGokuSS2.dmi',250000),cTrans('Icons/Characters/AltGokuSS4.dmi',750000))
	Great_SaiyaGoku
		Aura="Yellow"
		Race="Saiyan"
		icon='Icons/Characters/GreatSaiyaGoku.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/AltGokuSS4.dmi',750000))
	Goku_Jr
		Aura="Yellow"
		Race="Saiyan"
		icon='Icons/Characters/GokuJr.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
	Kid_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/KidGohan.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
	Piccolo_Trained_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/PiccoloTrainedGohan.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_Masenko
	Namek_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/NamekGohan.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
	Saiyan_Armor_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/SAGohan.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/SAGohanSS.dmi',100000),cTrans('Icons/Characters/SAGohanSS2.dmi',250000))
	Teen_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/TeenGohan.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/TeenGohanSS.dmi',100000))
	Bojack_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/BojackGohan.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/BojackGohanSS1.dmi',100000))
	Adult_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/AdultGohan.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Adult_Piccolo_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/AdultPiccoloGohan.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Great_Saiyaman
		Race="Half Saiyan"
		icon='Icons/Characters/GreatSaiyaman.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GreatSaiyaman1.dmi',100000,NewCA="Blue"),cTrans('Icons/Characters/GreatSaiyamanSS.dmi',250000),cTrans('Icons/Characters/GreatSaiyamanSS2.dmi',500000),cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Buu_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/BuuGohan.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Mystic_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/MysticGohan.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/MysticGohanSS.dmi',100000),cTrans('Icons/Characters/MysticGohanSS2.dmi',250000),cTrans('Icons/Characters/MysticGohanMystic.dmi',500000),cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Elder_Kai_Gohan
		Race="Half Saiyan"
		icon='Icons/Characters/ElderKaiGohan.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/ElderKaiGohanSword.dmi',750000),cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Future_Gohan
		Aura="Yellow"
		Race="Half Saiyan"
		icon='Icons/Characters/FutureGohanSS.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Future_Gohan_Aftermath
		Race="Half Saiyan"
		icon='Icons/Characters/FutureGohanAftermath.dmi'
		BeamSpecial=new/CharSpecials/Gohan_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GohanSS4.dmi',750000))
	Goten
		Race="Half Saiyan"
		icon='Icons/Characters/Goten.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GotenSS.dmi',100000),cTrans('Icons/Characters/GotenSS2.dmi',250000))
	Teen_Goten
		Race="Half Saiyan"
		icon='Icons/Characters/TeenGoten.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
	GT_Goten
		Aura="Yellow"
		Race="Half Saiyan"
		icon='Icons/Characters/GTGoten.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa

	Prince_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/PrinceVegeta.dmi'
		BeamSpecial=new/CharSpecials/Big_Bang_Attack
		New()	Transes=list(cTrans('Icons/Characters/PrinceVegetaSS.dmi',100000))
	Scouter_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/ScouterVegeta.dmi'
		BeamSpecial=new/CharSpecials/Galick_Gun
		New()	Transes=list(cTrans('Icons/Characters/VegetaSS4.dmi',750000,new/CharSpecials/Final_Shine))
	Saiyan_Armor_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/SAVegeta.dmi'
		BeamSpecial=new/CharSpecials/Big_Bang_Attack
		New()	Transes=list(cTrans('Icons/Characters/SAVegetaSS.dmi',100000),cTrans('Icons/Characters/SAVegetaUSS.dmi',250000,new/CharSpecials/Final_Flash),cTrans('Icons/Characters/VegetaSS4.dmi',750000,new/CharSpecials/Final_Shine))
	Vegeta
		Race="Saiyan"
		icon='Icons/Characters/Vegeta.dmi'
		BeamSpecial=new/CharSpecials/Galick_Gun
		New()	Transes=list(cTrans('Icons/Characters/VegetaSS.dmi',100000,new/CharSpecials/Final_Flash),cTrans('Icons/Characters/VegetaMajin.dmi',250000,new/CharSpecials/Final_Flash),cTrans('Icons/Characters/VegetaSS3.dmi',500000,new/CharSpecials/Final_Flash),cTrans('Icons/Characters/VegetaSS4.dmi',750000,new/CharSpecials/Final_Shine))
	Alternate_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/AltVegeta.dmi'
		BeamSpecial=new/CharSpecials/Big_Bang_Attack
		New()	Transes=list(cTrans('Icons/Characters/AltVegetaMajin.dmi',250000,new/CharSpecials/Final_Flash),cTrans('Icons/Characters/AltVegetaSS2.dmi',250000),cTrans('Icons/Characters/VegetaSS4.dmi',750000,new/CharSpecials/Final_Shine))
	GT_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/GTVegeta.dmi'
		BeamSpecial=new/CharSpecials/Big_Bang_Attack
		New()	Transes=list(cTrans('Icons/Characters/GTVegetaSS.dmi',100000,new/CharSpecials/Final_Flash),cTrans('Icons/Characters/VegetaSS4.dmi',750000,new/CharSpecials/Final_Shine))
	Alternate_GT_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/AltGTVegeta.dmi'
		BeamSpecial=new/CharSpecials/Big_Bang_Attack
		New()	Transes=list(cTrans('Icons/Characters/AltGTVegetaSS.dmi',100000),cTrans('Icons/Characters/VegetaSS4.dmi',750000,new/CharSpecials/Final_Shine))
	Baby_Vegeta
		Aura="White"
		Race="Saiyan"
		icon='Icons/Characters/BabyVegeta.dmi'
		BeamSpecial=new/CharSpecials/Big_Bang_Attack
	Kid_Trunks
		Race="Half Saiyan"
		icon='Icons/Characters/KidTrunks.dmi'
		BeamSpecial=new/CharSpecials/Buster_Cannon
		New()	Transes=list(cTrans('Icons/Characters/KidTrunksSS.dmi',100000))
	Future_Trunks
		Race="Half Saiyan"
		icon='Icons/Characters/FutureTrunks.dmi'
		BeamSpecial=new/CharSpecials/Buster_Cannon
		New()	Transes=list(cTrans('Icons/Characters/FutureTrunksSS.dmi',100000))
	Trunks
		Race="Half Saiyan"
		icon='Icons/Characters/Trunks.dmi'
		BeamSpecial=new/CharSpecials/Buster_Cannon
		New()	Transes=list(cTrans('Icons/Characters/TrunksSS.dmi',100000,new/CharSpecials/Burning_Attack),cTrans('Icons/Characters/TrunksSS2.dmi',250000,new/CharSpecials/Burning_Attack),cTrans('Icons/Characters/TrunksSS3.dmi',500000),cTrans('Icons/Characters/TrunksSS4.dmi',750000,new/CharSpecials/Burning_Attack))
	Super_Trunks
		Aura="Yellow"
		Race="Half Saiyan"
		icon='Icons/Characters/SuperTrunksSS.dmi'
		BeamSpecial=new/CharSpecials/Buster_Cannon
		New()	Transes=list(cTrans('Icons/Characters/SuperTrunksSS2.dmi',250000))
	Saiyan_Armor_Trunks
		Race="Half Saiyan"
		icon='Icons/Characters/SATrunks.dmi'
		BeamSpecial=new/CharSpecials/Buster_Cannon
		New()	Transes=list(cTrans('Icons/Characters/SATrunksSS.dmi',100000,new/CharSpecials/Finish_Buster),cTrans('Icons/Characters/SATrunksUSS.dmi',250000,new/CharSpecials/Burning_Attack),cTrans('Icons/Characters/SATrunksSS3.dmi',500000,new/CharSpecials/Burning_Attack))
	Bojack_Trunks
		Race="Half Saiyan"
		icon='Icons/Characters/BojackTrunks.dmi'
		BeamSpecial=new/CharSpecials/Finish_Buster
	GT_Trunks
		Race="Half Saiyan"
		icon='Icons/Characters/GTTrunks.dmi'
		BeamSpecial=new/CharSpecials/Buster_Cannon
		New()	Transes=list(cTrans('Icons/Characters/GTTrunksSS.dmi',100000))

	Gotenks
		Race="Half Saiyan"
		icon='Icons/Characters/Gotenks.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GotenksSS1.dmi',100000),cTrans('Icons/Characters/GotenksSS3.dmi',500000))
	Vegetrunks
		Race="Saiyan"
		icon='Icons/Characters/Vegetrunks.dmi'
		BeamSpecial=new/CharSpecials/Final_Flash
		New()	Transes=list(cTrans('Icons/Characters/VegetrunksSS.dmi',100000))
	Broku
		Aura="Green"
		Race="Saiyan"
		icon='Icons/Characters/Broku.dmi'
		BeamSpecial=new/CharSpecials/Blaster_Shell
	Vegito
		Race="Saiyan"
		icon='Icons/Characters/Vegito.dmi'
		BeamSpecial=new/CharSpecials/BBK
		New()	Transes=list(cTrans('Icons/Characters/VegitoSS.dmi',100000))
	Gogeta
		Race="Saiyan"
		icon='Icons/Characters/Gogeta.dmi'
		BeamSpecial=new/CharSpecials/BBK
		New()	Transes=list(cTrans('Icons/Characters/GogetaSS.dmi',100000),cTrans('Icons/Characters/GogetaSS4.dmi',750000))

	Master_Roshi
		Race="Human"
		icon='Icons/Characters/MasterRoshi.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
	Black_Suit_Roshi
		Race="Human"
		icon='Icons/Characters/BlackSuitRoshi.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
	Yajirobe
		Race="Human"
		icon='Icons/Characters/Yajirobe.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Krillin
		Race="Human"
		icon='Icons/Characters/Krillin.dmi'
		BeamSpecial=new/CharSpecials/Destructo_Disk
	GT_Krillin
		Race="Human"
		icon='Icons/Characters/GTKrillin.dmi'
		BeamSpecial=new/CharSpecials/Destructo_Disk
	Yamcha
		Race="Human"
		icon='Icons/Characters/Yamcha.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
	Tien
		Race="Alien"
		icon='Icons/Characters/Tien.dmi'
		BeamSpecial=new/CharSpecials/TriBeam
	Chiaotzu
		Race="Alien"
		icon='Icons/Characters/Chiaotzu.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
	Piccolo
		Aura="Green"
		Race="Namekian"
		icon='Icons/Characters/Piccolo.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
		New()	Transes=list(cTrans('Icons/Characters/PiccoloForm2.dmi',100000),cTrans('Icons/Characters/PiccoloForm3.dmi',250000))
	Nail
		Aura="Green"
		Race="Namekian"
		icon='Icons/Characters/Nail.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Lord_Slug
		Aura="Green"
		Race="Namekian"
		icon='Icons/Characters/LordSlug.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Pikkon
		Aura="Green"
		Race="Alien"
		icon='Icons/Characters/Pikkon.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Olibu
		Race="Human"
		icon='Icons/Characters/Olibu.dmi'
		BeamSpecial=new/CharSpecials/Falcon_Punch
	ChiChi
		Race="Human"
		icon='Icons/Characters/ChiChi.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
	Pan
		Race="Half Saiyan"
		icon='Icons/Characters/Pan.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/PanSS.dmi',100000))
	Saiyan_Armor_Bulma
		Race="Human"
		icon='Icons/Characters/SABulma.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
	Videl
		Race="Human"
		icon='Icons/Characters/Videl.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/GreatSaiyagirl.dmi',1000))
	Great_Saiyagirl
		Race="Human"
		icon='Icons/Characters/GreatSaiyagirl.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
	Hercule
		Race="Human"
		icon='Icons/Characters/Hercule.dmi'
		BeamSpecial=new/CharSpecials/Falcon_Punch
	Uub
		Race="Human"
		icon='Icons/Characters/Uub.dmi'
		BeamSpecial=new/CharSpecials/Kid_Gohan_KameHameHa
	Turtle
		Race="Animal"
		icon='Icons/Characters/Turtle.dmi'
		BeamSpecial=new/CharSpecials/Falcon_Punch

	Raditz
		Aura="Red"
		Race="Saiyan"
		icon='Icons/Characters/Raditz.dmi'
		BeamSpecial=new/CharSpecials/Watch_the_Birdie
		New()	Transes=list(cTrans('Icons/Characters/RaditzSS3.dmi',500000))
	Saibaman
		Aura="Green"
		Race="Creature"
		icon='Icons/Characters/Saibaman.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Nappa
		Aura="Red"
		Race="Saiyan"
		icon='Icons/Characters/Nappa.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Guldo
		Aura="Green"
		Race="Alien"
		icon='Icons/Characters/Guldo.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Burter
		Race="Alien"
		icon='Icons/Characters/Burter.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Jeice
		Aura="Red"
		Race="Alien"
		icon='Icons/Characters/Jeice.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Recoome
		Race="Alien"
		icon='Icons/Characters/Recoome.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Captain_Ginyu
		Aura="Red"
		Race="Alien"
		icon='Icons/Characters/CaptainGinyu.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Henchman
		Race="Alien"
		icon='Icons/Characters/FriezaHenchman.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Zarbon
		Race="Alien"
		icon='Icons/Characters/Zarbon.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Dodoria
		Aura="Red"
		Race="Alien"
		icon='Icons/Characters/Dodoria.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Frieza
		Aura="White"
		Race="Alien"
		icon='Icons/Characters/Frieza.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
		New()	Transes=list(cTrans('Icons/Characters/FriezaForm3.dmi',250000),cTrans('Icons/Characters/FriezaForm4.dmi',500000))
	Cooler
		Aura="White"
		Race="Alien"
		icon='Icons/Characters/Cooler.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Cell
		Aura="Green"
		Race="BioAndroid"
		icon='Icons/Characters/Cell.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/CellForm2.dmi',100000),cTrans('Icons/Characters/CellPerfectForm.dmi',750000))
	Cell_Jr
		Race="BioAndroid"
		icon='Icons/Characters/CellJr.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
	Android_19
		Race="Android"
		icon='Icons/Characters/Android19.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Android_17
		Race="Android"
		icon='Icons/Characters/Android17.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Dabura
		Aura="Red"
		Race="Demon King"
		icon='Icons/Characters/Dabura.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	Babidi
		Race="Alien"
		icon='Icons/Characters/Babidi.dmi'
		BeamSpecial=new/CharSpecials/Goten_KameHameHa
	Buu
		Race="Pink"
		icon='Icons/Characters/SuperBuu.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
		New()	Transes=list(cTrans('Icons/Characters/KidBuu.dmi',750000))
	Omega_Shenron
		Aura="White"
		Race="Dragon"
		icon='Icons/Characters/OmegaShenron.dmi'
		BeamSpecial=new/CharSpecials/Blaster_Shell

	King_Piccolo
		Aura="Green"
		Race="Namekian"
		icon='Icons/Characters/KingPiccolo.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon
	General_Tao
		Race="Human"
		icon='Icons/Characters/GeneralTao.dmi'
		BeamSpecial=new/CharSpecials/Falcon_Punch

	Salza
		Race="Alien"
		icon='Icons/Characters/Salza.dmi'
		BeamSpecial=new/CharSpecials/Special_Beam_Cannon

	Bardock
		Race="Saiyan"
		icon='Icons/Characters/Bardock.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
		New()	Transes=list(cTrans('Icons/Characters/BardockSS1.dmi',100000),cTrans('Icons/Characters/BardockSS4.dmi',750000))
	Tora
		Race="Saiyan"
		icon='Icons/Characters/Tora.dmi'
		BeamSpecial=new/CharSpecials/KameHameHa
	King_Vegeta
		Race="Saiyan"
		icon='Icons/Characters/KingVegeta.dmi'
		BeamSpecial=new/CharSpecials/Galick_Gun
		New()	Transes=list(cTrans('Icons/Characters/KingVegetaSS.dmi',100000),cTrans('Icons/Characters/KingVegetaSS2.dmi',250000))
	Broly
		Aura="Green"
		Race="Saiyan"
		icon='Icons/Characters/Broly.dmi'
		BeamSpecial=new/CharSpecials/Blaster_Shell
		New()	Transes=list(cTrans('Icons/Characters/NightmareBroly.dmi',100000,NewCA="Green"),cTrans('Icons/Characters/BrolySS1.dmi',250000),cTrans('Icons/Characters/BrolySS3.dmi',500000))
	Janemba
		Aura="Red"
		Race="Alien"
		icon='Icons/Characters/Janemba.dmi'
		BeamSpecial=new/CharSpecials/Blaster_Shell