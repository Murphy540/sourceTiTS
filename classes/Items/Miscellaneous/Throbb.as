﻿package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	
	public class Throbb extends ItemSlotClass
	{
		
		//constructor
		public function Throbb()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "Throbb";
			
			//Regular name
			this.longName = "vial of Throbb";
			
			//Longass shit, not sure what used for yet.
			this.description = "a vial of Throbb";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This vial of transparent cyan fluid seems so innocuous considering its supposed deleterious effects: overwhelming libido increase, massive male genital growth, and a titanic boost to production of semen (along with requisite swelling of semen-producing organs). In order to use it, females are to inject it just above the pubic mound. Males are supposed to inject directly into their preferred organ.";
			this.attackVerb = "";
			
			//Information
			this.basePrice = 200;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature):Boolean
		{
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Multiple wangs: 
				if(target.cockTotal() > 1) 
				{
					kGAMECLASS.output("You have more than one penis. Which one will you inject with Throbb?");
					kGAMECLASS.userInterface.clearMenu();
					for(var x:int = 0; x < target.cockTotal(); x++)
					{
						kGAMECLASS.output("\n" + (x+1) + ": [pc.cock " + x + "]");
						kGAMECLASS.userInterface.addButton(x,kGAMECLASS.num2Text(x+1),throbbPCEffects,x);
					}
					return true;
				}
				else throbbPCEffects();

			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " injects the Throbb to no effect.");
			}
			return false;			
		}
		public function throbbPCEffects(arg:int = 0):void {
			var pc = kGAMECLASS.chars["PC"];
			kGAMECLASS.clearOutput();
			var changes:int = 0;
			var changeLimit:int = 2;
			var temp = 1;
			if(rand(3) == 0) changeLimit++;
			if(kGAMECLASS.flags["TIMES_THROBB_USED"] == undefined) kGAMECLASS.flags["TIMES_THROBB_USED"] = 0;
			kGAMECLASS.flags["TIMES_THROBB_USED"]++;
			//First Use: 
			if(kGAMECLASS.flags["TIMES_THROBB_USED"] == 1) {
				kGAMECLASS.output("Well, here goes nothing. You twist the little plastic cap off one end of the vial to reveal the needle. It gleams menacingly in the light as you consider it. There's no backing out now. You reverse your grip, align the needle with your ");
				if(!pc.hasCock()) kGAMECLASS.output("groin");
				else kGAMECLASS.output("[pc.cock " + arg + "]");
				kGAMECLASS.output(" and jam it in.\n\nIt doesn't do anything at all! Not at first anyway. You discard the spent needle and look around, wondering if you got a dud when the effects finally hit.");
			}
			//Repeat Use: 
			else kGAMECLASS.output("Already feeling a familiar, anxious lust, you uncap the throbb and look down at your crotch. There's barely any hesitation when you plunge it in and depress the plunger, flooding your system with the libido-spiking mutagen. You don't feel anything at first, but then again, you didn't the first time either. You smile and rub yourself, calmly awaiting the effects.");

			//<= 25 libido get boosted by 10!
			if(pc.libido() <= 25) {
				kGAMECLASS.output("\n\nThe room tilts slightly on its axis, and you move your head to compensate, aware that the Throbb must be doing this but bound by your body's traitorous senses to experience it all the same. Your [pc.skin] flushes hotly a moment later, fed by the rapid-fire hammering of your accelerating heartbeat. A slow moan slips out between your lips as your thoughts invariable slip into sexual musings, wondering how horny this is going to make you or if you'll need to fuck six times a day just to function. The latter idea has more and more merit; you briefly consider injecting yourself with more when your better sense asserts itself. This stuff has you panting with lust and has undoubtedly supercharged your libido!");
				pc.libido(10);
				pc.lust(50+rand(10));
				changes++;
			}
			//<= 50 libido get boosted by 7
			else if(pc.libido() <= 50)
			{
				kGAMECLASS.output("\n\nA slutty, whorish sounding moan slips out of your [pc.lips] before you can stop it. You didn't even feel it coming, but you can tell why you made it now. Your whole body is burning up with lust, carried aloft on a wave of crimson, pulsating desire that pumps through your very veins, making your eyes cross and your tongue loll from you from your mouth. A simpering, needful whimper follows on the heels of the moan as you become completely, irrevocably aroused, too turned on to function in any sane manner. You're certain it's given your libido a bump, not that you mind. It's just another excuse to fuck, after all.");
				pc.libido(7);
				pc.lust(75+rand(10));
				changes++;
			}
			//<= 75 libido get boosted by 5!
			else if(pc.libido() <= 5) 
			{
				kGAMECLASS.output("\n\nSuddenly, you realize you need to fuck - right now. You want sex like a starving man wants food: fast and in as great a quantity as possible. Lolling out of your mouth, your [pc.tongue] hangs limply as you begin to pant, dripping saliva over your [pc.chest]. Your [pc.skin] is hot and flushed, so sensitive to the touch that you can't help but rub your hands along over yourself and quietly moan out your enjoyment. As soon as you can get your bearings straight, you're going to bend someone over and give them a good, hard fucking.");
				if(!pc.hasCock()) kGAMECLASS.output(" Where did that thought come from? You don't even have a dick yet!");
				kGAMECLASS.output(" Maybe two or three fucks, actually. That way you can use your cum as lube and give a proper, thorough creampie.");
				if(!pc.hasCock()) kGAMECLASS.output(" There's no banishing the strange thoughts.");
				//+100+rand(10) lust
				pc.libido(5);
				pc.lust(100);
				changes++;
			}
			//Else libido get boosted by 3!
			else 
			{
				kGAMECLASS.output("\n\nYou fall flat on your [pc.butt], letting lewd little moans slip out of your mouth, and unashamedly fondling your ");
				if(pc.hasCock()) kGAMECLASS.output("[pc.cocks]");
				if(pc.hasCock() && pc.hasVagina()) kGAMECLASS.output(" and ");
				if(pc.hasVagina()) kGAMECLASS.output("[pc.vaginas]");
				if(!pc.hasCock() && !pc.hasVagina()) kGAMECLASS.output("groin");
				kGAMECLASS.output(". Every single inch of your [pc.skin] feels tingly and sensitive, and you break out into a sweat regardless of the ambient temperature. You're hot, inside and out, fiendishly aroused by the Throbb. You wonder just how much fucking hornier it can get you. It's kind of hard to think straight with how turned on you are right now, but you have a hard time caring. It feels so good, and you're going to get so big and sexy!");
				pc.libido(3);
				pc.lust(100);
				changes++;
			}
			//GROWTH! REQUIRES DICK!
			if(pc.hasCock() && ((pc.cockTotal() > 1 || rand(2) == 0) || (changes < changeLimit && rand(3) == 0))) {
				//Make a smallish dick bigger!
				if(pc.cocks[arg].cLength <= 8) {
					kGAMECLASS.output("\n\nYour hand strays to your [pc.cock " + arg + "] without conscious thought. On noticing it, you merely smile, admiring the shape of your swollen length, like your hand belongs there. Your arm begins to pump, dragging your hand up and down the length, pleasuring yourself before you have a chance to react, and you just slump back, jacking on your [pc.cock " + arg + "] as it feels better and better.");
					temp = Math.round(23 + rand(30))/10;
					pc.cocks[arg].cLength += temp;
					kGAMECLASS.output("\n\nThis is way more pleasurable than any normal masturbation! You don't really recall being able to take such long strokes along your length or having it fill your hand so powerfully, throbbing just like the drug's namesake. Looking down, you gasp. Your [pc.cock " + arg + "] is at least two inches longer and still growing! You tug it to help it on its way, moaning as it slops big ropes of pre onto your knuckles. <b>You've gained " + kGAMECLASS.num2Text(temp) + " inches of length!</b>");
				}
				//Make a kinda big dick bigger!
				else if(pc.cocks[arg].cLength <= 20)
				{
					kGAMECLASS.output("\n\nYou couldn't stop yourself from grabbing onto your [pc.cock " + arg + "] if you wanted to. It's burning with need, throbbing and bouncing against you as it weakly shoots out ropes of pre-cum as thick as your normal ejaculate. You tug it, feeling lengthing in your hand, thickening to match its expanded size, and groan. Your [pc.hips] lurch into the air as you start fistfucking yourself, dick lengthening all the while. ");
					temp = Math.round(15 + rand(30))/10;
					pc.cocks[arg].cLength += temp;
					kGAMECLASS.output("<b>It doesn't stop until you've gained " + kGAMECLASS.num2Text(temp) + " inches of length.</b>");
				}
				//Make a hyper dick bigger!
				else 
				{
					kGAMECLASS.output("\n\nDespite its immensity, your [pc.cock " + arg + "] has become painfully hard. You idly wonder how you have enough blood to make a dong this size this rigid before another wave of excitement washes that away. Pre-cum is practically pissing out of your slit as you start pumping your expanding length, rolling down the [pc.cockHead " + arg + "] in waves of cream that are sure to be outshone by your inevitable, massive orgasm. You're throbbing so hard, thickening with each beat of your heart. It feels so good that you can't fathom how why you haven't cum yet. It's like you're drowning in an ocean of burning, oozing lust, and the only thing exposed is the steadily growing tip of your length. <b>Your [pc.cock " + arg + "] has gotten even bigger!</b>");
					temp = Math.round(10 + rand(30))/10;
					pc.cocks[arg].cLength += temp;
				}
				//Adjust thickness temporarily.
				if(pc.cocks[arg].cLength / 6 > pc.cocks[arg].cThickness) pc.cocks[arg].cThickness = pc.cocks[arg].cLength/6;
				trace("NEW THICKNESS: " + pc.cocks[arg].cThickness);
				changes++;
			}
			//Grow balls from nothing!
			if(pc.balls == 0 && pc.hasCock() && pc.longestCockLength() >= 10 && changes < changeLimit) {
				kGAMECLASS.output("\n\nJust when you're getting into the chemical arousal that's coursing through you, your gut twists, and nausea threatens to overwhelm you. Something is squeezing down on you painfully hard! You check, but there's nothing there aside from your hand massaging your embiggened phallus. Closing your eyes, you try to identify the source of your discomfort. The tightness shifts lower, sliding down and granting you relief at last. You open your eyes to see something entirely unexpected - a small scrotum with two lumps inside. <b>You have grown testicles!</b>");
				pc.balls = 2;
				pc.ballSize = 1;
				changes++;
			}
			//Make balls bigger!
			if(pc.balls > 0 && pc.hasCock() && rand(3) == 0 && changes < changeLimit)
			{
				kGAMECLASS.output("\n\nA churning, swelling tightness stretches the skin of your [pc.sack] tight for a moment as the omnipresent heat travels into your [pc.balls]. ");
				if(pc.balls == 1) kGAMECLASS.output("You can feel it");
				else kGAMECLASS.output("You can feel them");
				kGAMECLASS.output(" churning up a huge load of [pc.cum], swelling just to hold all the [pc.cumColor] goodness that's waiting to burst out in a blissful explosion. You gently palm ");
				if(pc.balls == 1) kGAMECLASS.output("it");
				else kGAMECLASS.output("one");

				if(pc.ballSize < 4) pc.ballSize += 1.5 + rand(20)/10;
				else if(pc.ballSize < 8) pc.ballSize += .75 + rand(10)/10;
				else pc.ballSize += .5 + rand(5)/10;
				kGAMECLASS.output(" and nearly blow your load when you feel it pulsating in your hand, stretching out against you. <b>You got bigger [pc.balls]!</b>");
				changes++;
			}
			//Increase cum capacity if can hold less than 3 shots a day!
			if(pc.cumMultiplier / 3 >= pc.ballEfficiency && pc.hasCock() && changes < changeLimit) {
				kGAMECLASS.output("\n\nYou whimper and ooze a strand of [pc.cum] onto yourself when a strange but pleasurable sensation rolls over your [pc.balls]. It isn't necessarily growth, nor is it some kind overly erotic, orgasm-inducing surge. The feeling could best be described as a budding capacitance. <b>Somehow, you know your body can hold even more [pc.cum] in its reserves.</b>");
				changes++;
				pc.ballEfficiency += 3 + rand(6);
			}
			//Increase cum multiplier to a max of x50!
			if(pc.cumMultiplier < 50 && pc.hasCock() && rand(2) == 0 && changes < changeLimit) {
				kGAMECLASS.output("\n\nMuscles in your abdomen lock and release, rhythmically clenching with the pulsing pleasure that's running through your [pc.cocks], pushing more and more pre out each time. <b>You can force out even more ejaculate during orgasm!</b>");
				pc.cumMultiplier += 2 + rand(3);
				pc.ballEfficiency++;
				changes++;
			}
			//Increase cum quality by 25%
			if(pc.cumQuality < 2 && pc.hasCock() && rand(3) == 0 && changes < changeLimit) {
				kGAMECLASS.output("\n\nAs heavy as loins are feeling right now, you're not sure you could drag yourself anywhere, but at the same time, your body is demanding you get up and stuff yourself inside the closest pussy - not just any pussy either: the wettest, most fertile twat you can find. You find yourself fantasizing about dozens of round-bellied women riding you one after the other, all carrying your offspring, when you become aware of that heavy feeling settling in your [pc.balls]. There's no doubt about it; <b>you've gotten more virile.</b>");
				pc.cumQuality += .25;
				changes++;
			}
			//Increase refractory rate!
			if(pc.refractoryRate < 100 && pc.hasCock() && changes < changeLimit) {
				kGAMECLASS.output("\n\nEven though you're practically dripping liquid from your crotch, you feel like you're never going to run out. Your body is producing it more than fast enough, and if the growing tightness in your [pc.balls] is any indication, <b>you're producing [pc.cum] even faster than before, allowing you to refill more quickly between orgasms.</b>");
				changes++;
				pc.refractoryRate++;
			}
			//Grow a penis from nothing!
			if(!pc.hasCock() && changes < changeLimit) 
			{
				kGAMECLASS.output("\n\nA swollen lump of flesh appears ");
				if(pc.hasVagina()) kGAMECLASS.output("right above your [pc.vaginas]");
				else kGAMECLASS.output("in the center of your crotch");
				kGAMECLASS.output(". It feels achy and a little painful but very very sensitive, and it's getting bigger with alarming ridity. The little knot is sticking an inch out past your [pc.skinFurScales], turning glossy and red as it does. You touch its tip and moan, assaulted by pleasure you barely understand, watching the bulge stretch out another inch in eager response. In seconds, you're rubbing and fondling it, coaxing more and more length from your crotch until ");
				pc.createCock();
				pc.cocks[0].cLength = 5;
				if(pc.race() == "ausar" || pc.race() == "half-ausar") pc.shiftCock(arg,GLOBAL.CANINE);
				kGAMECLASS.output("<b>your hand is wrapped around a five-inch long, twitching [pc.cockNounSimple " + arg + "].</b>");
				changes++;
			}
			//Wear off
			kGAMECLASS.output("\n\nThe artificial heat and longing that filled you and put you into such a state fade, but the arousal and need remain. <b>You should probably go blow off some steam....</b>");
			kGAMECLASS.userInterface.clearMenu();
			kGAMECLASS.userInterface.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}