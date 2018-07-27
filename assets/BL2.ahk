#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoTrayIcon				;No annoying system tray icon. My OCD cant handle it
#SingleInstance force	;Replaces old script if run again, no warning

Global counter = 0
Global total = 0
Global str := "SelectaGun"

Gui, +AlwaysOnTop
Gui, Add, Button, x15 gPatch, &Exec Patch [F5]
Gui, Add, Button, ys gColorBlind, &Fix Colorblind [F6]
Gui, Add, Text, xs+250 ys+5 cBlue gWebpage, Revz

Gui, Add, GroupBox, xs-10 ys+30 w240 Section, Reload
Gui, Add, Button, xs+10  ys+20 gReload, &Reload
Gui, Add, Radio, xs+65  ys+25 vRadio checked, &Normal [F7]
Gui, Add, Radio, xs+145  ys+25, Read&Only [F8]
Gui, Add, GroupBox, xs ys+60 w270 h80 Section, Farming
Gui, Add, DropDownList, xs+10  ys+20 w250 vGun gLoad, Select a Gun||12 Pounder|1340 Shield|Actualizer|Aequitas|Ahab|Antagonist|Avenger|Bad Touch|Baby Maker|Badaboom|Bane|Bearcat|Bekah|Big Boom Blaster|Bitch|Black Hole|Blockade|Blockhead|Blood of Terramorphous|Blood of the Seraphs|Bone Shredder|Bonus Package|Boom Puppy|Bouncing Bonny|Buffalo|Breath of Terramorphous|Breath of the Seraphs|Bunny|Butcher|Captain Blade's Otto Idol|Carnage|Chain Lightning|Chère-amie|CHOPPER|Chulainn|Cobra|Commerce|Conference Call|Contraband Sky Rocket|Cracked Sash|Creamer|Crit|Crossfire|Dahlminator|Damned Cowboy|Deadly Bloom|Deliverance|Deputy's Badge|Devastator|Dog|Elephant Gun|Emperor|Evil Smasher|Evolution|Fabled Tortoise|Fastball|Fibber|Fire Bee|Fire Storm|Fireball|Flakker|Flame of the Firehawk|Florentine|Fremington's Edge|Fuster Cluck|Godfinger|Good Touch|Greed|Grog Nozzle|Gub|Gunerang|Gwen's Head|Hail|Hammer Buster|Hawk Eye|Heart Breaker|Hellfire|Hide of Terramorphous|Hive|Hoplite|Hornet|Hydra|Impaler|Infection|Infinity|Interfacer|Invader|Jolly Roger|Judge|Kerblaster|Kiss of Death|Kitten|Lady Fist|Landscaper|Lascaux|Law|Leach|Lead Storm|Legendary Anarchist|Legendary Berserker|Legendary Binder|Legendary Cat|Legendary Catalyst|Legendary Engineer|Legendary Gunzerker|Legendary Hoarder|Legendary Hunter|Legendary Killer|Legendary Mechromancer|Legendary Ninja|Legendary Nurse|Legendary Pointman|Legendary Psycho|Legendary Ranger|Legendary Reaper|Legendary Roboteer|Legendary Sickle|Legendary Siren|Legendary Sniper|Legendary Soldier|Legendary Titan|Legendary Torch|Lightning Bolt|Little Evie|Logan's Gun|Longbow|Love Thumper|Lyuda|Madhous!|Maggie|Magic Missle x2|Magic Missle x4|Manly Man Shield|Meteor Shower|Midnight Star|Might of the Seraphs|Mongol|Morningstar|Nasty Surprise|Neogenator|Norfleet|Nukem|O-Negative|Octo|Ogre|Oman|Order|Orphan Maker|Pandemic|Patriot|Pimpernel|Pitchfork|Pocket Rocket|Pot O' Gold|Pun-chee|Pyrophobia|Quasar|Rapier|Retcher|Rex|Roaster|Roksalt|Rolling Thunder|Rubi|Sand Hawk|Sawbar|Scorpio|Seeker|Seriphim|Shadow of the Seraphs|Sheriff's Badge|Shotgun 1340|Shredifier|Skullmasher|Slagga|Slayer of Terramorphous(Assassin)|Slayer Slayer of Terramorphous(Commando)|Slayer Slayer of Terramorphous(Funzerker)|Slayer Slayer of Terramorphous(Mechromancer)|Slayer Slayer of Terramorphous(Psycho)|Slayer Slayer of Terramorphous(Siren)|Sledge's Shotgun|Sloth|Slow Hand|Sponge|Stalker|Stinger|Stinkpot|Stomper|Storm|Storm Front|Striker|SWORDSPLOSION|Tattler|Teapot|Teeth of Terramorphous|The Bee|The Cradle|The Rough Rider|The Sham|The Transformer|Thunderball Fists|Tidal Wave|Tinderbox|Trespasser|Triquetra|Tunguska|Twister|Unforgiven|Unkempt Harold|Veritas|Veruc|Volcano|Wanderlust|Whiskey Tango Foxtrot|Yellow Jacket
Gui, Add, text, xs+45  ys+54, Resets: 
Gui, Font, S13
Gui, Add, text, xs+85  ys+50 w50 Center vCounter, %counter%
Gui, Font
Gui, Add, Button, xs+200  ys+50 gOnScreen, OnScreen
Gui, Show
SetTimer, Update, 200

If !FileExist("settings.ini"){
	IniWrite,0 , settings.ini ,FarmCounter, SelectaGun
	IniWrite,0 , settings.ini ,FarmCounter, 12Pounder
	IniWrite,0 , settings.ini ,FarmCounter, 1340Shield
	IniWrite,0 , settings.ini ,FarmCounter, Actualizer
	IniWrite,0 , settings.ini ,FarmCounter, Aequitas
	IniWrite,0 , settings.ini ,FarmCounter, Ahab
	IniWrite,0 , settings.ini ,FarmCounter, Antagonist
	IniWrite,0 , settings.ini ,FarmCounter, Avenger
	IniWrite,0 , settings.ini ,FarmCounter, BadTouch
	IniWrite,0 , settings.ini ,FarmCounter, BabyMaker
	IniWrite,0 , settings.ini ,FarmCounter, Badaboom
	IniWrite,0 , settings.ini ,FarmCounter, Bane
	IniWrite,0 , settings.ini ,FarmCounter, Bearcat
	IniWrite,0 , settings.ini ,FarmCounter, Bekah
	IniWrite,0 , settings.ini ,FarmCounter, BigBoomBlaster
	IniWrite,0 , settings.ini ,FarmCounter, Bitch
	IniWrite,0 , settings.ini ,FarmCounter, BlackHole
	IniWrite,0 , settings.ini ,FarmCounter, Blockade
	IniWrite,0 , settings.ini ,FarmCounter, Blockhead
	IniWrite,0 , settings.ini ,FarmCounter, BloodofTerramorphous
	IniWrite,0 , settings.ini ,FarmCounter, BloodoftheSeraphs
	IniWrite,0 , settings.ini ,FarmCounter, BoneShredder
	IniWrite,0 , settings.ini ,FarmCounter, BonusPackage
	IniWrite,0 , settings.ini ,FarmCounter, BoomPuppy
	IniWrite,0 , settings.ini ,FarmCounter, BouncingBonny
	IniWrite,0 , settings.ini ,FarmCounter, Buffalo
	IniWrite,0 , settings.ini ,FarmCounter, BreathofTerramorphous
	IniWrite,0 , settings.ini ,FarmCounter, BreathoftheSeraphs
	IniWrite,0 , settings.ini ,FarmCounter, Bunny
	IniWrite,0 , settings.ini ,FarmCounter, Butcher
	IniWrite,0 , settings.ini ,FarmCounter, CaptainBlade'sOttoIdol
	IniWrite,0 , settings.ini ,FarmCounter, Carnage
	IniWrite,0 , settings.ini ,FarmCounter, ChainLightning
	IniWrite,0 , settings.ini ,FarmCounter, Chère-amie
	IniWrite,0 , settings.ini ,FarmCounter, CHOPPER
	IniWrite,0 , settings.ini ,FarmCounter, Chulainn
	IniWrite,0 , settings.ini ,FarmCounter, Cobra
	IniWrite,0 , settings.ini ,FarmCounter, Commerce
	IniWrite,0 , settings.ini ,FarmCounter, ConferenceCall
	IniWrite,0 , settings.ini ,FarmCounter, ContrabandSkyRocket
	IniWrite,0 , settings.ini ,FarmCounter, CrackedSash
	IniWrite,0 , settings.ini ,FarmCounter, Creamer
	IniWrite,0 , settings.ini ,FarmCounter, Crit
	IniWrite,0 , settings.ini ,FarmCounter, Crossfire
	IniWrite,0 , settings.ini ,FarmCounter, Dahlminator
	IniWrite,0 , settings.ini ,FarmCounter, DamnedCowboy
	IniWrite,0 , settings.ini ,FarmCounter, DeadlyBloom
	IniWrite,0 , settings.ini ,FarmCounter, Deliverance
	IniWrite,0 , settings.ini ,FarmCounter, Deputy'sBadge
	IniWrite,0 , settings.ini ,FarmCounter, Devastator
	IniWrite,0 , settings.ini ,FarmCounter, Dog
	IniWrite,0 , settings.ini ,FarmCounter, ElephantGun
	IniWrite,0 , settings.ini ,FarmCounter, Emperor
	IniWrite,0 , settings.ini ,FarmCounter, EvilSmasher
	IniWrite,0 , settings.ini ,FarmCounter, Evolution
	IniWrite,0 , settings.ini ,FarmCounter, FabledTortoise
	IniWrite,0 , settings.ini ,FarmCounter, Fastball
	IniWrite,0 , settings.ini ,FarmCounter, Fibber
	IniWrite,0 , settings.ini ,FarmCounter, FireBee
	IniWrite,0 , settings.ini ,FarmCounter, FireStorm
	IniWrite,0 , settings.ini ,FarmCounter, Fireball
	IniWrite,0 , settings.ini ,FarmCounter, Flakker
	IniWrite,0 , settings.ini ,FarmCounter, FlameoftheFirehawk
	IniWrite,0 , settings.ini ,FarmCounter, Florentine
	IniWrite,0 , settings.ini ,FarmCounter, Fremington'sEdge
	IniWrite,0 , settings.ini ,FarmCounter, FusterCluck
	IniWrite,0 , settings.ini ,FarmCounter, Godfinger
	IniWrite,0 , settings.ini ,FarmCounter, GoodTouch
	IniWrite,0 , settings.ini ,FarmCounter, Greed
	IniWrite,0 , settings.ini ,FarmCounter, GrogNozzle
	IniWrite,0 , settings.ini ,FarmCounter, Gub
	IniWrite,0 , settings.ini ,FarmCounter, Gunerang
	IniWrite,0 , settings.ini ,FarmCounter, Gwen'sHead
	IniWrite,0 , settings.ini ,FarmCounter, Hail
	IniWrite,0 , settings.ini ,FarmCounter, HammerBuster
	IniWrite,0 , settings.ini ,FarmCounter, HawkEye
	IniWrite,0 , settings.ini ,FarmCounter, HeartBreaker
	IniWrite,0 , settings.ini ,FarmCounter, Hellfire
	IniWrite,0 , settings.ini ,FarmCounter, HideofTerramorphous
	IniWrite,0 , settings.ini ,FarmCounter, Hive
	IniWrite,0 , settings.ini ,FarmCounter, Hoplite
	IniWrite,0 , settings.ini ,FarmCounter, Hornet
	IniWrite,0 , settings.ini ,FarmCounter, Hydra
	IniWrite,0 , settings.ini ,FarmCounter, Impaler
	IniWrite,0 , settings.ini ,FarmCounter, Infection
	IniWrite,0 , settings.ini ,FarmCounter, Infinity
	IniWrite,0 , settings.ini ,FarmCounter, Interfacer
	IniWrite,0 , settings.ini ,FarmCounter, Invader
	IniWrite,0 , settings.ini ,FarmCounter, JollyRoger
	IniWrite,0 , settings.ini ,FarmCounter, Judge
	IniWrite,0 , settings.ini ,FarmCounter, Kerblaster
	IniWrite,0 , settings.ini ,FarmCounter, KissofDeath
	IniWrite,0 , settings.ini ,FarmCounter, Kitten
	IniWrite,0 , settings.ini ,FarmCounter, LadyFist
	IniWrite,0 , settings.ini ,FarmCounter, Landscaper
	IniWrite,0 , settings.ini ,FarmCounter, Lascaux
	IniWrite,0 , settings.ini ,FarmCounter, Law
	IniWrite,0 , settings.ini ,FarmCounter, Leach
	IniWrite,0 , settings.ini ,FarmCounter, LeadStorm
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryAnarchist
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryBerserker
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryBinder
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryCat
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryCatalyst
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryEngineer
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryGunzerker
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryHoarder
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryHunter
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryKiller
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryMechromancer
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryNinja
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryNurse
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryPointman
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryPsycho
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryRanger
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryReaper
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryRoboteer
	IniWrite,0 , settings.ini ,FarmCounter, LegendarySickle
	IniWrite,0 , settings.ini ,FarmCounter, LegendarySiren
	IniWrite,0 , settings.ini ,FarmCounter, LegendarySniper
	IniWrite,0 , settings.ini ,FarmCounter, LegendarySoldier
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryTitan
	IniWrite,0 , settings.ini ,FarmCounter, LegendaryTorch
	IniWrite,0 , settings.ini ,FarmCounter, LightningBolt
	IniWrite,0 , settings.ini ,FarmCounter, LittleEvie
	IniWrite,0 , settings.ini ,FarmCounter, Logan'sGun
	IniWrite,0 , settings.ini ,FarmCounter, Longbow
	IniWrite,0 , settings.ini ,FarmCounter, LoveThumper
	IniWrite,0 , settings.ini ,FarmCounter, Lyuda
	IniWrite,0 , settings.ini ,FarmCounter, Madhous!
	IniWrite,0 , settings.ini ,FarmCounter, Maggie
	IniWrite,0 , settings.ini ,FarmCounter, MagicMisslex2
	IniWrite,0 , settings.ini ,FarmCounter, MagicMisslex4
	IniWrite,0 , settings.ini ,FarmCounter, ManlyManShield
	IniWrite,0 , settings.ini ,FarmCounter, MeteorShower
	IniWrite,0 , settings.ini ,FarmCounter, MidnightStar
	IniWrite,0 , settings.ini ,FarmCounter, MightoftheSeraphs
	IniWrite,0 , settings.ini ,FarmCounter, Mongol
	IniWrite,0 , settings.ini ,FarmCounter, Morningstar
	IniWrite,0 , settings.ini ,FarmCounter, NastySurprise
	IniWrite,0 , settings.ini ,FarmCounter, Neogenator
	IniWrite,0 , settings.ini ,FarmCounter, Norfleet
	IniWrite,0 , settings.ini ,FarmCounter, Nukem
	IniWrite,0 , settings.ini ,FarmCounter, O-Negative
	IniWrite,0 , settings.ini ,FarmCounter, Octo
	IniWrite,0 , settings.ini ,FarmCounter, Ogre
	IniWrite,0 , settings.ini ,FarmCounter, Oman
	IniWrite,0 , settings.ini ,FarmCounter, Order
	IniWrite,0 , settings.ini ,FarmCounter, OrphanMaker
	IniWrite,0 , settings.ini ,FarmCounter, Pandemic
	IniWrite,0 , settings.ini ,FarmCounter, Patriot
	IniWrite,0 , settings.ini ,FarmCounter, Pimpernel
	IniWrite,0 , settings.ini ,FarmCounter, Pitchfork
	IniWrite,0 , settings.ini ,FarmCounter, PocketRocket
	IniWrite,0 , settings.ini ,FarmCounter, PotO'Gold
	IniWrite,0 , settings.ini ,FarmCounter, Pun-chee
	IniWrite,0 , settings.ini ,FarmCounter, Pyrophobia
	IniWrite,0 , settings.ini ,FarmCounter, Quasar
	IniWrite,0 , settings.ini ,FarmCounter, Rapier
	IniWrite,0 , settings.ini ,FarmCounter, Retcher
	IniWrite,0 , settings.ini ,FarmCounter, Rex
	IniWrite,0 , settings.ini ,FarmCounter, Roaster
	IniWrite,0 , settings.ini ,FarmCounter, Roksalt
	IniWrite,0 , settings.ini ,FarmCounter, RollingThunder
	IniWrite,0 , settings.ini ,FarmCounter, Rubi
	IniWrite,0 , settings.ini ,FarmCounter, SandHawk
	IniWrite,0 , settings.ini ,FarmCounter, Sawbar
	IniWrite,0 , settings.ini ,FarmCounter, Scorpio
	IniWrite,0 , settings.ini ,FarmCounter, Seeker
	IniWrite,0 , settings.ini ,FarmCounter, Seriphim
	IniWrite,0 , settings.ini ,FarmCounter, ShadowoftheSeraphs
	IniWrite,0 , settings.ini ,FarmCounter, Sheriff'sBadge
	IniWrite,0 , settings.ini ,FarmCounter, Shotgun1340
	IniWrite,0 , settings.ini ,FarmCounter, Shredifier
	IniWrite,0 , settings.ini ,FarmCounter, Skullmasher
	IniWrite,0 , settings.ini ,FarmCounter, Slagga
	IniWrite,0 , settings.ini ,FarmCounter, SlayerofTerramorphous(Assassin)
	IniWrite,0 , settings.ini ,FarmCounter, SlayerofTerramorphous(Commando)
	IniWrite,0 , settings.ini ,FarmCounter, SlayerofTerramorphous(Funzerker)
	IniWrite,0 , settings.ini ,FarmCounter, SlayerofTerramorphous(Mechromancer)
	IniWrite,0 , settings.ini ,FarmCounter, SlayeyofTerramorphous(Psycho)
	IniWrite,0 , settings.ini ,FarmCounter, SlayerofTerramorphous(Siren)
	IniWrite,0 , settings.ini ,FarmCounter, Sledge'sShotgun
	IniWrite,0 , settings.ini ,FarmCounter, Sloth
	IniWrite,0 , settings.ini ,FarmCounter, SlowHand
	IniWrite,0 , settings.ini ,FarmCounter, Sponge
	IniWrite,0 , settings.ini ,FarmCounter, Stalker
	IniWrite,0 , settings.ini ,FarmCounter, Stinger
	IniWrite,0 , settings.ini ,FarmCounter, Stinkpot
	IniWrite,0 , settings.ini ,FarmCounter, Stomper
	IniWrite,0 , settings.ini ,FarmCounter, Storm
	IniWrite,0 , settings.ini ,FarmCounter, StormFront
	IniWrite,0 , settings.ini ,FarmCounter, Striker
	IniWrite,0 , settings.ini ,FarmCounter, SWORDSPLOSION
	IniWrite,0 , settings.ini ,FarmCounter, Tattler
	IniWrite,0 , settings.ini ,FarmCounter, Teapot
	IniWrite,0 , settings.ini ,FarmCounter, TeethofTerramorphous
	IniWrite,0 , settings.ini ,FarmCounter, TheBee
	IniWrite,0 , settings.ini ,FarmCounter, TheCradle
	IniWrite,0 , settings.ini ,FarmCounter, TheRough Rider
	IniWrite,0 , settings.ini ,FarmCounter, TheSham
	IniWrite,0 , settings.ini ,FarmCounter, TheTransformer
	IniWrite,0 , settings.ini ,FarmCounter, ThunderballFists
	IniWrite,0 , settings.ini ,FarmCounter, TidalWave
	IniWrite,0 , settings.ini ,FarmCounter, Tinderbox
	IniWrite,0 , settings.ini ,FarmCounter, Trespasser
	IniWrite,0 , settings.ini ,FarmCounter, Triquetra
	IniWrite,0 , settings.ini ,FarmCounter, Tunguska
	IniWrite,0 , settings.ini ,FarmCounter, Twister
	IniWrite,0 , settings.ini ,FarmCounter, Unforgiven
	IniWrite,0 , settings.ini ,FarmCounter, UnkemptHarold
	IniWrite,0 , settings.ini ,FarmCounter, Veritas
	IniWrite,0 , settings.ini ,FarmCounter, Veruc
	IniWrite,0 , settings.ini ,FarmCounter, Volcano
	IniWrite,0 , settings.ini ,FarmCounter, Wanderlust
	IniWrite,0 , settings.ini ,FarmCounter, WhiskeyTangoFoxtrot
	IniWrite,0 , settings.ini ,FarmCounter, YellowJacket
}


If !FileExist("BL2.log"){
	FileAppend, This is the beginning of your BL2.exe log file.`nIf you have used a previous version before logging was implemented`,`ncounters will not start at zero. Happy Farming`!`n, BL2.log
}

Update:
	gun_temp := StrReplace(Gun, A_Space, _)
	happy := InStr(gun_temp, str)
	if (!(happy+0) && (gun_temp != "")){
		GuiControl,, Counter, %counter%
		GuiControl, OnScreen:, Counter2, %counter%
	}
	if (happy+0){
		GuiControl,, Counter, %total%
	}
return

Patch:
if WinExist("ahk_exe Borderlands2.exe"){
	WinActivate

	Send, ~					;Default key to open console is ~
	Send, exec Patch.txt	;Default patch name is Patch.txt
	Send, {Enter}			;Runs patch
	Send, ~					;Closes Console
}
return

ColorBlind:
if WinExist("ahk_exe Borderlands2.exe"){
	WinActivate
	Loop 3 {
		Send, {ESCAPE}			;Navigating menus
		sleep 75				;sleep commands because the menus cant keep up
		Send, {Down}{Down}{Enter}
		sleep 75
		Send, {Down}{Down}{Enter}
		sleep 75
		Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}
		Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}
		Send, {Left}{Left}
		sleep 75
		Send, {ESCAPE}{ESCAPE}{ESCAPE}
	}
}
return

Reload:
Gui, Submit, NoHide ; Save the values of the radio buttons.
if (Radio = 1){
    if WinExist("ahk_exe Borderlands2.exe"){
		WinActivate
		Send, {ESCAPE}
		sleep 50
		Send, {Down}{Down}{Down}{Down}
		Send, {Enter}
		sleep 50
		Send, {Up}
		Send, {Enter}
		sleep 2500
		Send, {Enter}
		sleep 30
		Send, {Enter}
	}
}
else{
    if WinExist("ahk_exe Borderlands2.exe"){
		WinActivate
		Send, {ESCAPE}
		sleep 50
		Send, {Down}{Down}{Down}{Down}
		Send, {Enter}
		sleep 50
		Send, {Up}
		Send, {Enter}
		sleep 2500					;This is the sleep command to wait for the main menu. Lengthen as you need
		Send, {Down}{Down}{Down}{Down}{Enter}
		sleep 150
		Send, {Enter}
		sleep 150
		Send {Enter}
		sleep 250
		Send, {Up}{Up}{Up}{Up}
		sleep 100
		Send, {Enter}
		sleep 50
		Send, {Enter}
	}
}
return

Load:
	Gui, Submit, NoHide
	gun_temp := StrReplace(Gun, A_Space, _)
	IniRead, total, settings.ini, FarmCounter, %str%
	IniRead, counter, settings.ini, FarmCounter, %gun_temp%
return

Save:
	gun_temp := StrReplace(Gun, A_Space, _)
	happy := InStr(gun_temp, str)	
	if (!(happy+0) && (gun_temp != "")){
		IniWrite,%total% , settings.ini ,FarmCounter, %str%
		IniWrite,%counter% , settings.ini ,FarmCounter, %gun_temp%
		FileAppend, Gun Farmed: %Gun%  --  Counter: %counter%  --  Date: %A_Hour%:%A_Min%:%A_Sec% %A_MM%/%A_DD%/%A_YYYY%`n, BL2.log
	}
	if (happy+0){
		total--
		gosub Update
	}
return

OnScreen:
	if (!WinExist("ahk_id " GuiOnScreen_ID)){
		Gui OnScreen:+LastFound +AlwaysOnTop -Caption
		GuiOnScreen_ID := WinExist()
		Gui, OnScreen:Color, EEAA99
		Gui, OnScreen:Font, S15, Verdana
		Gui, OnScreen:Add, Text, cBlue BackgroundTrans w100 vCounter2, %counter%
		WinSet, TransColor, EEAA99
		Gui, OnScreen:Show, X100 Y100 w100
	}else{
		GuiOnScreen_ID := ""
		Gui OnScreen:Destroy
	}
return

Webpage:
	run chrome.exe https://github.com/Seth-Revz
return

GuiClose:
ExitApp

End::					;This is the key to close the script
ExitApp

;This is for starting the patch
F5::
if WinExist("ahk_exe Borderlands2.exe"){
	WinActivate

	Send, ~					;Default key to open console is ~
	Send, exec Patch.txt	;Default patch name is Patch.txt
	Send, {Enter}			;Runs patch
	Send, ~					;Closes Console
}
return						;End of F5 hotkey

;This is for reseting the colorblind issue
F6::
if WinExist("ahk_exe Borderlands2.exe"){
	WinActivate
	Send, {ESCAPE}			;Navigating menus
	sleep 75				;sleep commands because the menus cant keep up
	Send, {Down}{Down}{Enter}
	sleep 75
	Send, {Down}{Down}{Enter}
	sleep 75
	Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}
	Send, {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}
	Send, {Left}{Left}
	sleep 75
	Send, {ESCAPE}{ESCAPE}{ESCAPE}
}
return					;End of F6 hotkey

F7::
if WinExist("ahk_exe Borderlands2.exe"){
	WinActivate
	Send, {ESCAPE}
	sleep 50
	Send, {Down}{Down}{Down}{Down}
	Send, {Enter}
	sleep 50
	Send, {Up}
	Send, {Enter}
	sleep 2500
	Send, {Enter}
	sleep 30
	Send, {Enter}
}
counter++
total++
gosub Update
gosub Save
return

;This is for read only farming, exits to main menu selects latest character and starts the game
F8::
if WinExist("ahk_exe Borderlands2.exe"){
	WinActivate
	Send, {ESCAPE}
	sleep 50
	Send, {Down}{Down}{Down}{Down}
	Send, {Enter}
	sleep 50
	Send, {Up}
	Send, {Enter}
	sleep 2500					;This is the sleep command to wait for the main menu. Lengthen as you need
	Send, {Down}{Down}{Down}{Down}{Enter}
	sleep 150
	Send, {Enter}
	sleep 150
	Send {Enter}
	sleep 250
	Send, {Up}{Up}{Up}{Up}
	sleep 100
	Send, {Enter}
	sleep 50
	Send, {Enter}
}
counter++
total++
gosub Update
gosub Save
return
