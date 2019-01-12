obj/TurfType
	layer=2
	density=1
	mouse_opacity=0
	var/ApplyDensity=0
	New()
		if(src.layer<=2)	src.layer=2.2
		if(src.ApplyDensity)	src.loc.density=src.density
		return ..()
	FormatPainter
		layer=10
		icon='Icons/Other/Other.dmi'
		icon_state="FormatPainter"
		var/list/Vars2Paint
		New()
			src.icon_state=""
			for(var/obj/TurfType/O in src.loc.contents-src)
				for(var/v in src.Vars2Paint)	O.vars[v]=src.vars[v]
			return ..()
	Cliff
		icon='Icons/Turfs/NewCliffs.dmi'
		icon_state="TM1"
		density=1
		New()
			if(src.icon_state=="TM1")	src.icon_state="TM[rand(2,3)]"
			if(src.icon_state=="BM1")	src.icon_state="BM[rand(1,3)]"
			return ..()
	CloudsOverlay
		layer=5
		icon='Icons/Turfs/CloudsOverlay.dmi'
	BuildingLetters
		icon_state="GoldZ"
		icon='Icons/Turfs/BuildingLetters.dmi'
	BuildingToppers
		icon='Icons/Turfs/SquareBuilding.dmi'
		icon_state="RoofGrate"
	CircusSign
		layer=5
		density=0
		pixel_y=16
		icon='Icons/Images/CircusSign.png'
	TentEntrance
		icon='Icons/Images/TentEnt.png'
	GrassCorners
		density=0
		ApplyDensity=1
		icon='Icons/Turfs/NewTurfs.dmi'
		icon_state="DarkGrassTL"
	DenseGrassFuzz
		density=0
		layer=2.3	//was 2.3?  So that it would appear over cliffs!  Then changed to 2.1?
		icon='Icons/Turfs/NewTurfs.dmi'
		icon_state="GrassFuzzL"
	Dumpster
		icon='Icons/Turfs/CityTurfs.dmi'
		icon_state="DumpsterB"
	Tree
		layer=5
		density=0
		icon='Icons/Images/Tree.png'
		New()
			if(src.icon_state=="1,0")	{src.layer=2.1;src.density=1}
			return ..()
	FancyTree16
		layer=5;density=0
		pixel_x=16
		icon='Icons/Images/FancyTree.png'
	PalmTree
		layer=5;density=0
		icon='Icons/Images/PalmTree.png'
	RockSlide
		icon='Icons/Images/RockSlide.png'
	RoundBallTop
		icon='Icons/Images/BallTop.png'
	TournamentSign
		layer=5;density=0
		icon_state="SignBL"
		icon='Icons/Turfs/TournamentTurfs.dmi'
	TournEntrance
		layer=5
		icon='Icons/Images/TournEntrance.png'
	TournTop
		layer=5;density=0
		icon='Icons/Images/TournTop.png'
	GiftShop
		icon='Icons/Images/GiftShop.png'
	FoodShop
		icon='Icons/Images/FoodShop.png'
	DrinkShop
		icon='Icons/Images/DrinkShop.png'
	PuncherFiller
		icon='Icons/Other/NPCs.dmi'
		icon_state="PuncherR"
	SnakeWay
		ApplyDensity=1
		icon='Icons/Images/SnakeWay.png'
	SnakeWayOverlay
		layer=5;density=0
		icon='Icons/Images/SnakeWayOverlay.png'
	SnakeWayHead
		ApplyDensity=1
		icon='Icons/Images/SnakeHead.png'
	SnakeWayHeadOver
		layer=5;density=0
		icon='Icons/Images/SnakeHeadOver.png'
	YemmaEntranceOver
		layer=5;density=0
		icon='Icons/Images/YemmaEntOver.png'
	Submarine
		icon='Icons/Images/Submarine.png'
	AirShip
		icon='Icons/Images/AirShip.png'
	KingYemma
		layer=5;density=0
		icon='Icons/Images/KingYemma.png'
		verb/Revive()
			set category=null
			set src in oview()
			if(usr.JoinMissionCheck())	return
			var/NewLoc=input("Where should I send you this time?","Revival Location") as anything in Locations
			if(!usr)	return
			usr=usr.GetFusionMob()
			if(MyGetDist(usr,src)<=world.view)
				usr.IsDead=0
				usr.Locate(NewLoc)
				usr.overlays-=global.Halo
				usr.CompleteTutorial("Alpha Revival")
	Capsule_Ship
		icon='Icons/Images/CapsuleShip.png'
	Saiyan_Space_Pod
		density=0;layer=5
		icon='Icons/Images/SaiyanSpacePod.png'
	Kame_House
		icon='Icons/Images/NewKameHouse.png'
	CellGamesArena
		density=0
		icon='Icons/Images/CellGamesArena.png'
	CellGamesPillarT
		density=0;layer=5
		icon='Icons/Images/CellGamesPillarT.png'
	CellGamesPillarB
		density=0;layer=5
		icon='Icons/Images/CellGamesPillarB.png'
	KamisLookout
		density=0
		icon='Icons/Images/KamisLookout.png'
	KamisLookoutOverlayers
		density=0;layer=5
		icon='Icons/Images/KamisLookoutOverlayers.png'
	HBTC
		density=0
		icon='Icons/Images/HBTC.png'
	HbtcOverlay
		density=0;layer=5
		icon='Icons/Images/HbtcOverlay.png'
	Friezas_Ship
		icon='Icons/Images/FriezaShip.png'
