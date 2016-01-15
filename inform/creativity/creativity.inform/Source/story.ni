"creativity" by Elliot Fiske

Include Basic Screen Effects by Emily Short.
Include Basic Hyperlinks by Emily Short.
Include Glulx Text Effects by Emily Short.

Release along with a website and an interpreter.

Use scoring.

Part 1 - Introduction

Chapter 1 - Map


Chapter 2 - Intro talk

The display banner rule is not listed in the startup rulebook.

Introduction is a room.

Rule for printing the name of Introduction: stop.

When play begins:
	say  "[bold type]WELCOME TO THE CREATIVITRIX QUALIFICATION DETERMINATION SIMULATION.[roman type] ";
	say "[line break]{data indicate that subjects respond positively to parallel rhyming structure while in unfamiliar situations}.";
	say "[paragraph break]";
	say "[bold type]PLEASE GET COMFORTABLE[roman type] [line break]{data indicate that subjects in an ergonomic seating position produce 14% better content and are less susceptible to thyroid problems} [line break][bold type]AND PRESS ANY KEY TO CONTINUE.";
	Wait for any key;
	say "[paragraph break]";
	say "CONGRATULATIONS ON BEING ACCEPTED TO THE APPLICATION PROCESS FOR BECOMING A CERTIFIED CREATIVITY ENDPOINT FOR CREATIVITRIX.";
	now the right hand status line is "CREATIVITY: [score]";
	Wait for any key;
	say "YOU WILL BE PLACED IN A STATE-OF-THE-ART TEXT-BASED SIMULATOR THAT GAUGES YOUR LEVEL OF CREATIVITY. YOU HAVE AN INNATE HUMAN INGENUITY AND ABILITY TO THINK 'OUTSIDE OF THE BOX'[roman type][line break] {complement rating: genuine} [line break][bold type]AND THIS SIMULATION WILL ALLOW CREATIVITRIX TO QUANTIFY IT.[paragraph break]";
	say "THE SIMULATION TRACKS YOUR LEVEL OF CREATIVITY THROUGH 'CREATIVITY POINTS.' DOING CREATIVE AND UNEXPECTED THINGS WILL RESULT IN AN INCREASE OF 'CREATIVITY POINTS.' TRY TO GET AS MANY AS YOU CAN!";
	Wait for any key;
	say "THE SIMULATION WILL BEGIN ONCE YOU PRESS ANY KEY. PRESS ANY KEY TO BEGIN THE SIMULATION.[line break][roman type] {warning: redundant phrase detected}[paragraph break]";
	Wait for any key;
	Move player to Supply Room;
	

Part 2 - Setup and Configuration Stuff

Chapter 1 - Dumb Tables

 Table of Hyperlink Glulx Replacement Commands (continued)
 linknum   	replacement  
  1  	"rate 1 stars"
  2   	"rate 2 stars"
  3  	"rate 3 stars"
  4  	"rate 4 stars"
  5  	"rate 5 stars"

Chapter 2 - Rating module

The rating_module is a backdrop. It is in the Supply Room and Combination Station.
For printing the name of rating_module: say "HOW DID YOU FIND ME >_> GO AWAY"

A rate_state is a kind of value. The rate_states are too_early, rate_first, rate_invalid_1, rate_description, rate_invalid_2, rate_rating, and rate_bye.

The rating_module has a rate_state called r_state. The r_state of rating_module is too_early.

The gave_points_for_bad_rating is a truth state variable. gave_points_for_bad_rating is false.

A rating is a kind of value. 5 stars specifies a rating.

When play begins:
	the first rating happens in 4 turns from now;
	the music playing happens in 20 turns from now;
	
At the time when the music playing happens:
	say "[bold type]HUMAN! STUDIES HAVE SHOWN THAT CLASSICAL MUSIC ENHANCES CREATIVITY! PLEASE ENJOY THIS PIECE BY JOHANNE SEBASTIAN BACH.[roman type]";
	now playing_music is true;	

At the time when the first rating happens:
	say "[bold type]HELLO AGAIN! I'D LIKE TO INTRODUCE... THE RATINGS MODULE! HUMAN FEEDBACK IS CRUCIAL TO CREATIVITRIX, AND THIS LITTLE GUY IS HERE TO COLLECT IT! I'LL LET HIM TALK:[roman type][paragraph break][paragraph break] Please rate your experience with the CREATIVITRIX QUALIFICATION DETERMINATION SIMULATION thus far:[paragraph break]";
	say "[set link 5]5 - Excellent[end link][paragraph break]";
	say "[set link 4]4 - Appealing[end link][paragraph break]";
	say "[set link 3]3 - Unremarkable[end link][paragraph break]";
	say "[set link 2]2 - Lackluster[end link][paragraph break]";
	say "[set link 1]1 - Truly Awful[end link][paragraph break]";
	now r_state of rating_module is rate_first;

Giverating is an action applying to one rating. Understand "rate [rating]" as giverating.

[If the rating_module is visible for 3 turns, say "Here goes nothing..."]

Report giverating: 
	if the r_state of rating_module is too_early:
		say "WE DIDN'T ASK YOU TO RATE ANYTHING YET! I ADMIRE YOUR FORWARD THINKING, THOUGH.";
		if gave_points_for_bad_rating is false:
			now gave_points_for_bad_rating is true;
			say "YOU KNOW WHAT, I'LL GIVE YOU 10 POINTS FOR THAT. IT WAS IMPRESSIVE.";
			increase score by 10;
	otherwise if r_state of rating_module is rate_first:
		say "THANK YOU FOR YOUR FEEDBACK!";
		now r_state of rating_module is rate_invalid_1;
	otherwise if r_state of rating_module is rate_description:
		say "THANK YOU FOR YOUR FEEDBACK!";
		say "UH... ACTUALLY LOOKS LIKE THE RATINGS MODULE IS BACK AGAIN WITH ANOTHER RATING! WHAT HAVE YOU GOT TO SAY LITTLE GUY?[paragraph break][paragraph break] Please rate your experience using the RATING MODULE thus far:[paragraph break]";
		say "[set link 5]5 - Perfect in every way[end link][paragraph break]";
		say "[set link 4]4 - Quite good[end link][paragraph break]";
		say "[set link 3]3 - Meh[end link][paragraph break]";
		say "[set link 2]2 - Unsatisfactory[end link][paragraph break]";
		say "[set link 1]1 - Literally painful[end link][paragraph break]";
		now r_state of rating_module is rate_rating;
	otherwise if r_state of rating_module is rate_invalid_1 or r_state of rating_module is rate_invalid_2:
		say "YOU ALREADY RATED THIS ASPECT! THANK YOU FOR YOUR COMMITMENT TO THOROUGH CUSTOMER FEEDBACK.";
		if gave_points_for_bad_rating is false:
			now gave_points_for_bad_rating is true;
			say "YOU KNOW WHAT, I'LL GIVE YOU 10 POINTS FOR THAT. THE IMPORTANCE OF CUSTOMER RELATIONS CAN NEVER BE OVERSTATED.";
			increase score by 10;
	otherwise if r_state of rating_module is rate_bye:
		say "THE RATING MODULE RAN AWAY... IT USUALLY LIKES HIDING DOWN BY THE STRING TABLES IN MAIN MEMORY, SO IT'LL PROBABLY BE FINE. IN THE MEANTIME, HOLD OFF ON RATING ANYTHING.";
	otherwise if r_state of rating_module is rate_rating:
		now r_state of rating_module is rate_bye;
		if rating understood is greater than 4 stars:
			say "OH NO! YOU'VE TERRIFIED THE RATING MODULE WITH YOUR PERFECT SCORE! NOW IT THINKS IT CAN NEVER LIVE UP TO THE GLORY IT'S ACHIEVED FROM YOUR OVERLY PERFECTIONIST RATING. THE RATING MODULE RAN AWAY!";
		if rating understood is 4 stars:
			say "OH NO! THE RATING MODULE WAS SO CLOSE TO 5 STARS! IT'S GOING TO CONSTANTLY WONDER WHAT LITTLE MISTAKE IT MADE THAT KEPT IT FROM A PERFECT SCORE! THE RATING MODULE RAN AWAY.";
		if rating understood is 3 stars:
			say "OH NO! THE RATING MODULE IS PARALYZED BY YOUR MEDIOCRE RATING! IF ONLY YOU'D GIVEN IT A DEFINITIVELY GOOD OR BAD SCORE, IT MIGHT HAVE HAD AN IDEA OF HOW GOOD ITS PERFORMANCE WAS! THE RATING MODULE RAN AWAY.";
		if rating understood is 2 stars:
			say "OH NO! THE RATING MODULE IS CRUSHED BY YOUR POOR REVIEW! IT SAYS IT DOESN'T NEED YOUR 'PITY STAR' AND WISHES YOU HAD JUST GIVEN IT ONE STAR! THE RATING MODULE RAN AWAY CRYING.";
		if rating understood is less than 2 stars:
			say "OH NO! THE RATING MODULE IS DEVASTATED BY YOUR TERRIBLE REVIEW! IT SAYS IT'S SORRY FOR ANNOYING YOU WITH SO MANY RATING REQUESTS... THAT WAS ITS ONLY JOB, IT JUST GOT SO EXCITED! THE RATING MODULE RAN AWAY CRYING.";
			

Before player trying doing anything except giverating (this is the don't ignore the rating module rule):	
	if r_state of rating_module is rate_rating or r_state of rating_module is rate_description or r_state of rating_module is rate_first:
		instead say "YOU'VE GOT TO ANSWER THE RATING MODULE'S QUESTION FIRST! LOOK AT THE POOR LITTLE GUY, ALL HE WANTS TO DO IS HELP!";

Chapter 3 - Cool types

A button is a kind of thing. A button is fixed in place.

Pressing is an action applying to one thing. Understand "press [thing]" as pressing.

Understand "push" as pressing. Understand "touch" as pressing.

Check pressing a thing (called da button):
	if da button is not a button:
		say "That's not a button."

Carry out touching a button:
	say "You softly brush your finger against the button, instead of pushing it. What a tease!";
	
After throwing a thing (called bball) at a button (called da_button):
	say "Nice shot! [The bball] pushes the button for you! Now THAT'S convenience.";
	try pressing the da_button;
	
Section 1 - Points for exploring

Understand "hint" or "help" as a mistake ("TYPE 'COMBINE' WHILE CARRYING 3 ALLOYS TO AUTOMATICALLY COMBINE THEM.

YOU CAN TELL INTERN JIM TO 'GO SOUTH' INTO THE ARENA, AND HE'LL HELP YOU ATTACK THE ENEMY. HE WILL ALSO TRY TO USE WEAPONS OR EQUIPMENT YOU GIVE HIM.");

The futile to throw things at inanimate objects rule is not listed in any rulebook.
The block throwing at rule is not listed in any rulebook.

Carry out throwing a held thing (called bball) at a thing (called target):
	say "You throw [the bball] at [the target]. Bonk! [The bball] lands on the floor.";
	silently try dropping bball;
	
After throwing a thing at a thing (called target):
	if target is not already_thrown_at:
		say "[one of]GOOD THROWING ARM! I DON'T HAVE ARMS, SO THAT'S ESPECIALLY IMPRESSIVE.[or]NICE THROWING![or]GOOD SHOT! HAVE SOME POINTS![or]BULLSEYE! HERE'S A FEW POINTS![then at random]";
		increase score by 5;
		now target is already_thrown_at;

A thing can be already_examined. A thing is usually not already_examined.
A thing can be already_touched. A thing is usually not already_touched.
A thing can be already_tasted. A thing is usually not already_tasted.
A thing can be already_thrown_at. A thing is usually not already_thrown_at.
A thing can be already_smelled. A thing is usually not already_smelled.
A thing can be already_taken. A thing is usually not already_taken.
		
After touching a thing (called touchee):
	if touchee is not already_touched:
		now touchee is already_touched;
		say "[one of]EXCELLENT! BE SURE TO INSPECT YOUR ENVIRONMENT CAREFULLY![or]AMAZING! YOUR TACTILE ABILITIES ARE UNPARALLELED.[or]NICE! SEEING YOU TOUCH THAT [touchee] GAVE ME A VICARIOUS THRILL![then at random]";
		increase score by 5;

After tasting a thing (called touchee):
	if touchee is not already_tasted:
		now touchee is already_tasted;
		say "[one of]EXCELLENT! BE SURE TO INSPECT YOUR ENVIRONMENT CAREFULLY![or]AMAZING! YOUR TASTING ABILITIES ARE UNPARALLELED.[or]NICE! SEEING YOU TASTE THAT [touchee] GAVE ME A VICARIOUS THRILL![then at random]";
		increase score by 5;
		
After smelling a thing (called touchee):
	if touchee is not already_smelled:
		now touchee is already_smelled;
		say "[one of]EXCELLENT! BE SURE TO INSPECT YOUR ENVIRONMENT CAREFULLY![or]AMAZING! YOUR SNIFFING ABILITIES ARE UNPARALLELED.[or]NICE! SEEING YOU SMELL THAT [touchee] GAVE ME A VICARIOUS THRILL![or]HOW VERY BLOODHOUND-LIKE OF YOU![then at random]";
		increase score by 5;
		
Eardoing is an action applying to one thing. Understand "eardo [thing]" as eardoing. Understand "eardo to [thing]" as eardoing.

Understand the command "listen" as something new.
Understand the command "hear" as something new.
Understand the command "listen" as "eardo".
Understand the command "hear" as "eardo".

Before eardoing a thing:
	instead say "[one of]You hear the soft hum of Air Conditioning.[or]You hear a distant refrigerator running.[or]You hear a cheap cricket sound effect from far off in the distance.[or]You hear someone whisper 'Nyeh heh heh!'[or]You hear the sound of your own heartbeat.[or]You hear the sound of your own breathing.[or]You hear the sound of a clanking machine somewhere.[or]You don't hear anything in particular.[or]You hear the sounds of the universe.[or]You hear the earth moving.[or]You hear the narrator telling you what you're hearing.[or]You hear computation.[or]You hear silence.[or]You hear the narrator sigh to himself.[then at random]";
		
Check eating a thing (called touchee):
	try tasting touchee instead;

After examining a thing (called examinee):
	if examinee is not already_examined:
		now examinee is already_examined;
		say "I ADMIRE YOUR [one of]INQUISITIVE NATURE![or]EXPLORATORY NATURE![or]EXPLORATORY SPIRIT![or]CURIOUSITY![or]INQUISITIVENESS![or]INTEREST IN YOUR ENVIRONMENT![then at random]";
		increase score by 5;
	if r_state of rating_module is rate_invalid_1:
		say "THE RATING MODULE IS BACK WITH ANOTHER MESSAGE! ISN'T HE CUTE?[paragraph break][paragraph break] Please rate the description of [the examinee]:[paragraph break]";
		say "[set link 5]5 - Life changing[end link][paragraph break]";
		say "[set link 4]4 - Impressive[end link][paragraph break]";
		say "[set link 3]3 - Mediocre[end link][paragraph break]";
		say "[set link 2]2 - Trivial[end link][paragraph break]";
		say "[set link 1]1 - Disgusting[end link][paragraph break]";
		now r_state of rating_module is rate_description.

before taking a fixed in place thing (called nomove):
	if nomove is not already_taken:	
		increase score by 5;
		now nomove is already_taken;
		let CAPZ be "[nomove]" in upper case;
		instead say "YOU CAN'T TAKE THAT [CAPZ]. NICE IDEA, THOUGH!";
		
Instead of jumping:
	say "EXCERSIZING REGULARLY IS KEY TO CREATIVITY! KEEP IT UP!";
	
Understand the command "kiss" as something new.
Smooching is an action applying to one thing. Understand "kiss [thing]" as smooching.
Understand "kiss me/myself" as a mistake ("You smooch yourself on the arm.").

The block kissing rule is not listed in any rulebook.

Before smooching:
	instead try tasting noun;
		
Carry out tasting Jim:
	say "You and Jim share a passionate kiss. He cradles the back of your head with his hand and whispers something to you. The hairs on the back of your neck stand up.";

Yelling is an action applying to nothing. Understand "yell" as yelling. Understand "shout" as yelling. Understand "scream" as yelling. Understand "shout" as yelling.

Carry out yelling:
	say "THAT'S IT! GET THOSE CREATIVE JUICES FLOWING!";

Chapter 4 - Stuff to save


[A thing can be cool. After doing anything other than examining the table when the lighting is scenery: say "WHOO BOY"]

[After examining a thing that is not scenery (called inspectee): say "THAT [noun] IS NOT [one of]SCENERY[or]BUTTS[or]GUYS[or]THINGS[stopping]"; now inspectee is cool.]

[After examining a thing (called inspectee):
	if inspectee is cool:
		say "WOW! WHAT A COOL [noun]";
	otherwise: 
		now inspectee is cool.]

[A light snack is in the Workshop. It is edible.]

[Does the player mean eating the lighting: it is likely.]

[Instead of doing anything other than examining when noun is the lighting: 
	let dogs be a truth state;
	now dogs is whether or not a table is visible;
	if dogs is true, say "LOL LOOK A TABLE"
	
Every thing has a number called damage.]

Part 3 - Simulation


Chapter 1 - Elements

Section 1 - Basics

An alloy is a kind of thing. An alloy is undescribed. An alloy has a number called alphabetical.

A SHIELD alloy is a kind of alloy. The description of SHIELD alloy is "A fist-sized cube of pure SHIELD alloy is hovering in front of you. It seems eager to morph into something useful.". The alphabetical of a SHIELD alloy is 4.

A BLADE alloy is a kind of alloy. The description of BLADE alloy is "A sheet of pure BLADE alloy hovers in front of you, light glinting dangerously off its surface. It seems eager to morph into something sharp.". The alphabetical of a BLADE alloy is 1.

An ENTROPIC alloy is a kind of alloy. The description of ENTROPIC alloy is "A writhing ball of pure ENTROPY hovers in front of you. It hurts to look at.". The alphabetical of a ENTROPIC alloy is 2.

An MEND alloy is a kind of alloy. The description of MEND alloy is "A glowing ball of pure MEND alloy hovers serenly in front of you. It seems eager to help.". The alphabetical of a MEND alloy is 3.

A SPARK alloy is a kind of alloy. The description of SPARK alloy is "A bright ball of pure SPARK alloy flits in front of you. It seems impatient for you to make something out of it.". The alphabetical of a SPARK alloy is 5.

[YAY EATING THINGS]
Carry out tasting a SHIELD alloy:
	say "You gingerly lick the SHIELD alloy. It tastes like iron, strength and security.";
	
Carry out tasting a BLADE alloy:
	say "You gingerly move to lick the BLADE alloy. Ow! It smacks your face with its flat side.";
	
Carry out tasting a ENTROPIC alloy:
	say "You put your lips on the ENTROPIC alloy. Suddenly, it tries to absorb your face! The caustic darkness burns where it touches on your face, and you quickly fling it away.";
	
Carry out tasting a MEND alloy:
	say "You put the MEND alloy in your mouth. Mmmm, tastes like buttercream. You take it out of your mouth out of respect.";
	
Carry out tasting a SPARK alloy:
	say "You put the SPARK alloy in your mouth. It tastes like chewing on aluminum foil coated in pop rocks. You spit it out.";
	
Carry out smelling a SHIELD alloy:
	say "You smell the SHIELD alloy. It reminds you of your favorite stuffed animal back home, but covered in impenetrable armor.";

Carry out smelling a BLADE alloy:
	say "You smell the BLADE alloy. It has a sharp, metallic scent, not unlike blood.";
	
Carry out smelling a ENTROPIC alloy:
	say "The caustic alloy burns the inside of your nose. Your eyes water.";
	
Carry out smelling a MEND alloy:
	say "The soothing scent of lavender washes over you. You close your eyes and enjoy it for a moment.";
	
Carry out smelling a SPARK alloy:
	say "As you smell the SPARK alloy, you're suddenly struck with a brilliant new idea! But... you forget it when you stop sniffing.";
	
Understand "sniff" as smelling.

Understand "pop a squat" as a mistake ("YOU CROUCH DOWN ON YOUR CALVES AND UNLEASH YOUR INNER SLAV.").

Section 2 - Combinations

Combining is an action applying to nothing. Understand "combine" as combining.


Understand "combine [thing]" as a mistake ("Just say 'COMBINE' to combine all the alloys in your inventory.")

Understand "combine [things]" as a mistake ("Just say 'COMBINE' to combine all the alloys in your inventory.")

Understand "combine [thing] [thing]" as a mistake ("Just say 'COMBINE' to combine all the alloys in your inventory.")

Understand "combine [thing] with [thing]" as a mistake ("Just say 'COMBINE' to combine all the alloys in your inventory.")

Check combining:
	If the number of free slots is 0:
		now the player is in the Combination Station;
		say "You walk to the Combination Station.";
		try pressing go button;
	If the number of held alloys is greater than the number of free slots:
		say "There's already too many slots full. Drop an element!";
	otherwise if the number of held alloys is less than the number of free slots:
		say "There's [num_free_slots] free slots and you are only carrying [number of held alloys] alloys. Go take another and try again!";
	otherwise:
		say "You walk to the Combination Station.";
		now player is in the Combination Station;
		repeat with curr_alloy running through the list of held alloys:
			try inserting curr_alloy into slot 1;
		try pressing go button;
				
A combo is a kind of thing. A combo can be new_combo. A combo is usually new_combo.

Understand "equip" as wearing.
		
A poison needle is a combo. The description of the poison needle is "A cruel-looking needle that drips with a caustic venom."
A spiked grenade is a combo. The description of the spiked grenade is "A grenade filled with entropic energy! Spikes jut out from the exterior of this unpredictable weapon."
A vile whip is a combo.  The description of the vile whip is "A long whip, sparking with power and dripping with caustic entropy. Careful!"
A healing syringe is a combo. The description of the healing syringe is "A sharp needle filled with healing and preservation."
A healthy aura is a combo. The description of the healthy aura is "A small glowing green ball that emanates a healing aura."
Understand "ball/green" as aura.
A chestplate of retribution is a combo. The description of the chestplate is "A sturdy chestplate with retractable spikes that hurt incoming attackers."
A healing grenade is a combo. The description of the healing grenade is "A grenade enriched with healing power."
A lightning rod is a combo. The description of the rod is "Sparks fly from this unpredictable weapon - who knows what it might do in battle?"
A smart grenade is a combo. The description of the smart grenade is "A grenade with a digital display and the ability to stun enemies."
A healing helmet is a combo. The description of the healing helmet is "A helmet radiating a healthy glow. It heals whoever is wearing it."
A healing helmet is wearable.
After wearing a helmet:
	say "You place the helmet on your head. Your body surges with healing energy! You'll heal a little each turn.";
Every turn when a person (called healee) is wearing a healing helmet:
	if the current hit points of healee are less than the maximum hit points of healee:
		let healin be a random number between 3 and 6;
		say "The healing helmet soothes [if the healee is the player]your[otherwise][the healee]'s[end if] wounds. [healin] health restored.";
		increase the current hit points of healee by healin;
		if the current hit points of healee are greater than the maximum hit points of healee:
			now the current hit points of healee are the maximum hit points of healee;
			
To heal (healee - a person) by (hp - a number) points:
	say "Healing [healee] by [hp] points!";

[ALL THE ACTIONS FOR EACH]
Carry out tasting a poison needle:
	say "You gingerly touch the needle to your tongue. A drop of poison gets on your tongue and burns it! Ow!";
	now the poison of the player is one;
	
Carry out throwing a poison needle at a thing (called target):
	say "You hold the poison needle like a dart and throw it at [the target].";
	If target is not a person:
		say "Bullseye! It smacks against [the target] and clinks off harmlessly.";
		silently try dropping the poison needle;
	otherwise:
		say "Bullseye! The needle stabs [the target] and gets some of the poison into his bloodstream. The needle falls to the ground and shatters.";
		Now the needle is off-stage;
		Now the poison of the target is 3;

Utilizing is an action applying to one carried thing. Understand "use [thing]" as Utilizing.

needle_armored is a truth state variable. needle_armored is false.

Carry out utilizing a thing (called useful):
	if useful is not a combo:
		instead say "Try making something with the Combinator and USEing it.";
	if useful is a chestplate or useful is a helmet:
		instead try wearing useful;
	if useful is a smart grenade or useful is a healing grenade:
		instead try throwing the useful at the player;
	if useful is a poison needle:
		instead say "You don't want to use that on yourself... try saying 'attack someone with needle.'";
	if useful is a healing syringe:
		say "You plunge the healing syringe into your arm. The MEND alloy courses through you, healing your wounds!";
		increase the current hit points of player by 20;
		if needle_armored is false:
			increase the armor of the player by 3;
			now needle_armored is true;
			say "The SHIELD alloy creates a tough barrier around your skin!";
	if useful is a lightning rod:
		let victim be a random visible person;
		say "The lightning rod releases a pulse of unstable energy, and [if the victim is the player]you transform[otherwise][the victim] transforms[end if] into a chicken!";
		Now the victim is chicken;
		if the victim is the player:
			The chickening stops in 2 turns from now;
		otherwise:
			The chickening stops in 4 turns from now;
				
		
At the time when the chickening stops:
	repeat with chickun running through the list of all chicken people:
		now chickun is not chicken;
		say "[if the chickun is the player]You revert[otherwise][The chickun] reverts[end if] back from being a chicken.";
		
Every turn when a person (called chickie) is chicken:
	say "[if the chickie is the player]You are[else]The [Chickie][end if] is still a chicken.";
		
A person can be chicken. A person is usually not chicken.
		
Chapter 2 - Fun Zone

Section 1 - Supplies!

The Supply Room is a room. "[if Supply Room is visited]You are standing in a spacious room made of reinforced [concrete]. [A panel] illuminates the room in a tense white glow. There is another room to the SOUTH."

The passage is scenery in Supply Room. The description of the passage is "A rectangular passage carved out of the concrete leads to another room to the south."
Understand "door/exit/leave/combination/station" as passage

a concrete is scenery in Supply Room. "The walls are made out of solid concrete, with no seams or cracks anywhere. This room looks like it could withstand a heavy explosion."

understand "wall/walls" as concrete.

A lighting panel is scenery in Supply Room. "A flat white panel is embedded in the concrete on the ceiling. It glows with a uniform brightness."
Understand "light/lights" as panel.
Carry out tasting panel:
	say "You can't reach the panel from down here. Instead, you close your eyes and imagine a warm sunrise basking over your tongue." instead.
	
Carry out smelling panel:
	say "You sniff as hard as you can, trying to get the scent of the panel. Your eyes water." instead.
	
Carry out touching panel:
	say "You can't reach the panel from down here. Instead, you close your eyes and imagine a warm sunrise brushing against your fingertips." instead.
Carry out throwing a thing at panel:
	say "The lighting panel is unfazed by your attempts to bring it off its high horse.
	
	[bold type]HUMAN, WHAT DID THAT LIGHT EVER DO TO YOU?[roman type]";
Carry out attacking panel (this is the fightlight rule):
	instead say "You've always fantasized about fighting a light. But it doesn't feel right, because fighting the light might leave you in night.";
	
The fightlight rule is listed first in the instead rulebook.

[NOTE: "Wait for Any Key" seems to force room description to print twice. So I disabled printing description if it's unvisited :3]
Rule for printing the name of Supply Room: If Supply Room is visited, say "Supply Room".

To say alloy_list for (alc - a thing):
	say "[paragraph break]";
	repeat with yay_alloy running through the list of all visible alloys:
		say "[a yay_alloy][line break]";
		

The alcove is in the Supply Room. It is fixed in place. "[if supply room is visited]An alcove is carved into the wall in front of you. Hovering in the alcove is: [alloy_list for alcove][else] "

before taking alcove:
	say "You place both hands on the stone beside the alcove and try to rip it out of the wall. Unfortunately, you aren't very Incredible or Hulking.[paragraph break]";
	
before tasting alcove:
	say "You lick the concrete of the alcove. You think someone once told you this is how you get 'stoned.'";
	
before tasting concrete:
	say "You lick the concrete. You think someone once told you this is how you get 'stoned.'";
	
before smelling alcove:
	say "You sniff the concrete of the alcove. You think someone once told you this is how you get 'stoned.'";
	
before smelling concrete:
	say "You sniff the concrete. You think someone once told you this is how you get 'stoned.'";
	

The description of the alcove is "A rectangular hole is carved out of the stone in front of you. It seems to be where the Alloys respawn if you press the RESET button."
Understand "hole" as alcove.

The alcove supports a SHIELD alloy, a BLADE alloy, an ENTROPIC alloy, a MEND alloy and a SPARK alloy.

Understand "take all" as a mistake ("You should only take 3 alloys at a time - that's how many you can combine at once.") when the location is the Supply Room.

A large red button labeled RESUPPLY is a button in the Supply Room. It is fixed in place. "[if supply room is visited]A large red button labeled RESUPPLY is mounted above the alcove.[else] "

The description of the button is "A glowing red button. It delivers new alloys when you use up the old ones."

Check pressing the red button:
	say "You press the button, with a satisfying 'click.'";
	if the list of all not visible alloys is empty:
		say "[paragraph break]*BZZZZZ* [bold type]ALL THE ALLOYS ARE ALREADY IN THIS ROOM. IF YOU USE ONE UP YOU CAN BRING IT BACK WITH THIS BUTTON![roman type]" instead;
	repeat with yay_alloy running through the list of all not visible alloys:
		say "[A yay_alloy] [one of]teleports in[or]zaps in[or]warps in[or]pops into existence[or]respawns[then at random]!";
		now yay_alloy is on the alcove;

Before taking the red button:
	Say "You wrap your fingers around the button and attempt to pry it out of the wall. It doesn't budge."

Section 2 - Combinatorics

A vast machine labeled 'Combinator' is in the Combination Station. It is fixed in place. The description of the machine is "An indecipherable structure made of whirring cogs and gnashing machinery. It's name is the 'Combinator', according to a small plaque affixed to the side. It has 3 slots to put alloys in, and a large green button labelled 'GO'."

The green button labelled GO is a button in the Combination Station.	
Before taking the green button:
	Say "You wrap your fingers around the button and attempt to pry it out of the wall. It doesn't budge."

Understand "cogs/machine/machinery/combaintor/combiner" as machine.

A plaque is scenery in the Combination Station. "A small plaque attached to the side of the machine. It says 'Combinator' in a pleasing Arial font."
Understand "sign/label" as plaque.

Slot is a kind of opaque fixed in place container.

A slot has carrying capacity 1.
A slot can be full or free.

Carry out tasting slot:
	say "You slobber on the slot a little. Tastes slotty.";

Carry out touching slot:
	say "You feel around the slot. There's just enough room for one alloy.";
	
Carry out smelling slot:
	say "You lean down the slot and take a big sniff. Smells like grease.";
	
Carry out throwing an alloy (called bball) at a slot (called hoop):
	say "Nice shot!";
	try inserting the bball into the hoop;

Does the player mean inserting into slot 1: it is likely.

To decide if slot is full:
	if the slot contains an alloy, decide no;
	decide yes;

slot 1 is a slot. It is in the Combination Station. "Slot 1 [if slot 1 does not contain an alloy]is empty.[else]contains [a list of things in slot 1]."

slot 2 is a slot. It is in the Combination Station. "Slot 2 [if slot 2 does not contain an alloy]is empty.[else]contains [a list of things in slot 2]."

slot 3 is a slot. It is in the Combination Station. "Slot 3 [if slot 3 does not contain an alloy]is empty.[else]contains [a list of things in slot 3]."

Check inserting something (called curr_alloy) into slot 1: 
	if slot 1 contains an alloy:
		say "Slot 1 is full, so let's put [curr_alloy] in slot 2. [run paragraph on]";
		instead try inserting curr_alloy into slot 2;
		
Check inserting something (called curr_alloy) into slot 2: 
	if slot 2 contains an alloy:
		say "Slot 2 is full, so let's put [curr_alloy] in slot 3. [run paragraph on]";
		instead try inserting curr_alloy into slot 3;
		
To decide what number is num_free_slots:
	let result be 3;
	if slot 1 contains an alloy:
		decrease result by 1;
	if slot 2 contains an alloy:
		decrease result by 1;
	if slot 3 contains an alloy:
		decrease result by 1;
	decide on result;

The Combination Station is a room. It is south of the Supply Room. "[first time][bold type]WELCOME TO THE QUALIFICATION DETERMINATION SIMULATION COMBINATION STATION! HERE YOU CAN TAKE ALLOYS FROM THE PREVIOUS ROOM AND FORM THEM INTO NEW AND FANCIFUL CREATIONS. WHAT ARE YOU WAITING FOR? LET'S GET CREATIVE![roman type][only]

You are standing in another concrete room. There are exits to the North and South. In the center is [a machine]. The machine has 3 slots to put alloys in:".

Check pressing the GO button:
	if a visible slot does not contain an alloy:
		instead say "There are [num_free_slots] slots that don't have an alloy in them! Please put another alloy in before you press GO.";
	let ingredients be a list of alloys;
	add the list of alloys in slot 1 to ingredients, if absent;
	add the list of alloys in slot 2 to ingredients, if absent;
	add the list of alloys in slot 3 to ingredients, if absent;
	sort ingredients in alphabetical order;
	say "Ingredient list: [ingredients][paragraph break]";
	if entry 1 of ingredients is a BLADE alloy:
		if entry 2 of ingredients is an ENTROPIC alloy: [Danger blade!]
			if entry 3 of ingredients is a MEND alloy:
				say "The BLADE alloy warps itself into a long syringe, and the MEND alloy fills it with a healing light! But then, the ENTROPIC alloy corrupts it into a nasty-looking poison!";
				now player is carrying a poison needle;
			if entry 3 of ingredients is a SHIELD alloy:
				say "The SHIELD alloy quickly wraps itself around the volatile ENTROPIC alloy. Then, the BLADE alloy adds dangerous-looking spikes to the outside of the resulting ball.";
				now player is carrying a spiked grenade;
			if entry 3 of ingredients is a SPARK alloy:
				say "The BLADE and ENTROPIC alloys wrap themselves in a tight coil, spiraling around the room! The SPARK alloy suddenly arcs out and takes control of the tendril with electrical impulses, leaving a handle that's (relatively) safe to grab.";
				now player is carrying a vile whip;
		otherwise if entry 2 of ingredients is a MEND alloy:
			if entry 3 of ingredients is a SHIELD alloy:
				say "The BLADE alloy warps itself into a long syringe, and the MEND alloy fills it with a healing light! The SHIELD alloy reinforces the syringe and gives the chemical inside a fortifying property.";
				now player is carrying a healing syringe;
			if entry 3 of ingredients is a SPARK alloy:
				say "The BLADE alloy warps itself into a long syringe, and the MEND alloy fills it with a healing light! The SPARK alloy thinks it can improve on this design, and restructures the healing item to a small, intense green ball of light.";
				now player is carrying a healthy aura;
		otherwise if entry 2 of ingredients is a SHIELD alloy:
			if entry 3 of ingredients is a SPARK alloy:
				say "The SHIELD alloy warps into a sturdy set of armor, and the BLADE alloy affixes it with deadly spikes! The SPARK alloy jumps in and ensures that the spikes only hurt people that are trying to kill you.";
				now player is carrying a chestplate of retribution;
	otherwise if entry 1 of ingredients is an ENTROPIC alloy:
		if entry 2 of ingredients is a MEND alloy:
			if entry 3 of ingredients is a SHIELD alloy:
				say "The SHIELD alloy quickly warps itself around the volatile ENTROPIC alloy. Then, the MEND alloy infuses the device with healing properties!";
				now player carries a healing grenade;
			if entry 3 of ingredients is a SPARK alloy:
				say "The ENTROPIC and MELD alloys react violently with one another, and the SPARK alloy struggles to contain them! Eventually it coalesces into a rod that sparks and surges with unstable energy.";
				now player carries a lightning rod;
		if entry 2 of ingredients is a SHIELD alloy:
			if entry 3 of ingredients is a SPARK alloy:
				say "The SHIELD alloy quickly warps itself around the volatile ENTROPIC alloy. Then, the SPARK alloy adds some cool extra features!";
				now player carries a smart grenade;
	otherwise:
		say "The SHIELD and MELD alloys combine to form a magical helmet, and the SPARK alloy makes itself busy by creating a system that diagnoses and heals your wounds. Neat!";
		now player carries a healing helmet;
	repeat with fun_combo running through list of all visible combo:
		if fun_combo is a combo and fun_combo is new_combo:
			let CAPZ be "[fun_combo]" in upper case; 
			say "[paragraph break]AMAZING! THAT'S AN INCREDIBLE [CAPZ] YOU'VE JUST CREATED! I'M AWARDING YOU 20 CREATIVITY POINTS FOR IT.";
			increase score by 20;
			now fun_combo is not new_combo;
		say "[paragraph break][paragraph break]You now carry a brand-new [fun_combo].";
	repeat with fun_alloy running through ingredients:
		now fun_alloy is in the Dumb Workaround;
	

The Dumb Workaround is a room.

Chapter 3 - Intern

A person can be hostile or friendly. A person is usually friendly.
Intern Jim is a person. He is in the Combination Station.

[Carry out hugging Jim:
	say "You and Jim share a warm embrace. It feels so right.";]

Persuasion rule for asking Jim to try doing something:
	If Jim is chicken:
		say "Jim can't do that, he's a chicken. Jim clucks.";
		persuasion fails;
	otherwise:
		 persuasion succeeds.

Section 1 - Conversation

A person has a table name called conversation.

Instead of asking someone (called buddy) about something:
	if buddy is player:
		say "You talk to yourself for a little bit. You're a great conversation partner!";
	otherwise if buddy is entity:
		say "The entity growls at you.";
	otherwise:
		let the source be the conversation of the noun;
		if topic understood is a topic listed in source:
			say "[paragraph break][reply entry][paragraph break]";
		otherwise:
			say "Jim nods politely, but clearly doesn't have any idea what you're talking about.".

Instead of telling someone about something:
	try asking the noun about it.

The conversation of a person is usually Table of General ChitChat.

Table of General ChitChat
topic	reply
"me/player/myself"	"'You're an applicant for Creativitrix! Keep pumping out creativity and you'll be an endpoint in no time.'"
"jim/intern/himself/him/you"	"'Oh, I'm just an Artificially Intelligent intern. Feel free to order me around, test weapons on me...'[paragraph break] He notices your confused expression.[paragraph break] 'I'll regenerate if you do any real harm. Fire away!'"
"butts"	"Jim gets a faraway expression on his face. 'Yeah... how about them butts.'"
"ai/artificial/intelligence/robots/simulation/simulator/creativitrix/creativity/endpoint/point/points"	"'You want to know about the Creativitrix? Well, it's simple. As you can probably tell, AI these days is really good at computing and simulating, but is terrible at coming up with original ideas! I mean, the name of this thing is just CREATIVITY plus MATRIX for crying out loud. If you're creative enough, you can sign up as an Endpoint and help come up with original ideas for the AI."
"entropy/entropic/dark/entity/hostile/enemy"	"Jim looks uncomfortable. 'Entropy... They say that even storing information about it is a vector for it to infect you. All we know is that Entropy has destroyed a lot of civilization. We don't know where it is, what it is, what it wants, or anything... It's even dangerous just to have this Entropy in the simulation.'"
"room/machine/combiner/combine/combination"	"'This room houses the Combinator! Truly the greatest invention in this simulation. It takes in whatever 3 alloys you stick in it and spits out an amazing creation that takes on all 3 of their aspects! Try it out by taking 3 alloys from the Supply Room and using the command COMBINE.'"
"alloys/alloy/element/elements"	"'There are 5 different elements; BLADE, SPARK, MEND, SHIELD... and... ENTROPY. We've given you access to Alloys of each element; pure expressions of each element floating in a portable little ball!' [paragraph break] Jim pauses. [paragraph break] 'Be careful with ENTROPY. It's... dangerous.'"

After reading a command:
	while player's command includes "the":
		cut the matched text.
				
			
		
		
Chapter 4 - Combat time!

section 1 - Arena Room

The Arena is a room. It is south of the Combination Station. "[if arena is unvisited][bold type]STUDIES HAVE SHOWN THAT CREATIVITY IS BOOSTED BY 57% UPON THE INTRODUCTION OF A HOSTILE ENTITY! THUS, WE HAVE PROVIDED AN ENEMY FOR YOU TO DEFEAT IN THIS ROOM. PRESS THE BUTTON WHEN YOU FEEL YOU ARE READY TO FIGHT IT![roman type][end if]

This is another large, barren concrete room. Exits are to the north and south."

A person can be cubed. A person is usually not cubed.

A person can be dead. A person is usually not dead.

The hostile entity is a hostile person. It is in the Arena. "[if entity is cubed]There is a hostile entity trapped by a force field on the other half of the room from you."

The description of the entity is "[if entity is cubed]There is a naked, flesh-colored humanoid thing across the room from you. It seems to be bounded to its half of the room by an invisible force field. It's hard to remember what it looks like.[otherwise if entity is not dead]Now is NOT the time to stand around examining the thing that is trying to kill you.[else]All that's left of the entity is a black stain on the concrete."

Every turn when the entity is cubed and the location is the Arena: say "[one of]The entity grins at you. Well, not so much 'grin' as 'curl back its lips and roll its eyes back into its head.'[or]The entity ripples, as if a giant worm is crawling around just under the surface of its skin.[or]The entity gurgles softly to itself, and jams a finger into its own eye.[or]The entity stares at you. You feel a dull ache in the base of your spine.[or]The entity sucks in air, its ribcabe jutting out as its torso compresses into an impossible skinniness.[or]The entity suddenly leaps up and clings to the ceiling. Its face changes to an expression of confusion.[or]The entity's skin bubbles.[then at random]"


Table of Entity Sounds
topic	reply
"entropy"	"CONSUME."

The conversation of the entity is the Table of Entity Sounds.


The hostile entity is cubed.

The invisible force field is scenery in the Arena. The description of the field is "There seems to be an invisible barrier dividing the room in half. No physical matter can cross it."

Carry out smelling the field:
	say "Smells like ozone.";
	
Carry out tasting the field:
	say "It feels like you're licking hardened air.";
	
Carry out touching the field:
	say "You place your hand against the field. It feels like hardened air - you don't feel anything solid against your hand but it won't move any further than the very middle of the room.";

Understand "barrier/invisible" as force field.

The orange fight button is a button in the Arena. It is undescribed.

section 2 - Combat Mechanics

[We start by recording, for each person, a maximum number of points of damage the person can sustain when starting from health, and the current number of points remaining. In the tradition of role-playing games, these are referred to as hit points.]

A person has a number called maximum hit points. A person has a number called current hit points. A person has a number called armor. A person has a number called power.

The maximum hit points of the player is 100. The maximum hit points of the entity is 100. The armor of the player is 0. The power of the player is 10.

The current hit points of the player is 100. The current hit points of the entity is 100. The armor of the entity is 3. The power of the entity is 14.

A person has a number called poison.

Every turn when the poison of the player is greater than 0:
	say "You feel the entropic energy course course through your bloodstream, searing your insides!";
	decrease the poison of the player by 1;
	let poison_damage be a random number between 5 and 10;
	decrease the current hit points of the player by poison_damage;
	say "You take [poison_damage] damage.";
	if the healthy aura is visible:
		say "The green light of the Health Aura washes over you, helping the poison leave your bloodstream.";
		decrease the poison of the player by 1;
	if the poison of the player is 0:
		say "You shudder as the last of the poison leaves your system.";
		
Every turn when the poison of Jim is greater than 0:
	say "Jim writhes in agony as the poison tears through him.";
	decrease the poison of Jim by 1;
	let poison_damage be a random number between 5 and 10;
	decrease the current hit points of Jim by poison_damage;
	say "Jim takes [poison_damage] damage.";

[Now our rule for the actual attack. We want first to calculate how much damage the player's attack does, inflict that damage, and remove the enemy if he's dead; then, if he doesn't die, the enemy counter-attacks, also for a randomized amount of damage, and if this kills the player, the game ends in defeat.]

The block attacking rule is not listed in any rulebook.

Instead of attacking anything (called victim):
	if victim is not a person:
		instead say "You smack [the victim] to teach it a lesson in respect. You feel empowered.";
	let the damage be a random number between 8 and 10;
	now damage is damage minus the armor of the victim;
	say "You attack [the noun], causing [damage] points of damage!";
	decrease the current hit points of the victim by the damage;
	if the current hit points of the noun is less than 0:
		say "[line break][The noun] expires, and is immediately carried away by the Arena slaves!";
		now the noun is dead;
		stop the action;

ow_jim is a truth state variable. object_jim is a truth state variable. jim_hit_player is a truth state variable.
Carry out Jim attacking something (called victim) (this is the JIM THE PUNISHER rule):
	If victim is Jim:
		say "Jim smacks himself in the face. Good boy.";
		if ow_jim is false:
			say "EXCELLENT! TEST THE BOUNDS OF WHAT PEOPLE WILL DO FOR YOU!";
			increase score by 20;
			now ow_jim is true;
	otherwise:
		if victim is not a person:
			say "Jim kicks [the victim] as hard as he can. THUNK.";
			if ow_jim is false:
				say "JIM WILL ATTACK ANYTHING, EVEN SOMETHING WITHOUT A PULSE! HE'S AN ABSOLUTE MADMAN! GOOD JOB ON FINDING THAT OUT!";
				increase score by 10;
				now object_jim is true;
		if victim is player and jim_hit_player is false:
			say "AMAZING! USING JIM TO TEST YOUR COMBAT ABILITIES IS A FANTASTIC IDEA.";
			now jim_hit_player is true;
		
		
			
				

Every turn when the entity is not cubed and location is Arena:
	if the entity is chicken:
		say "The entity can't attack this round, on account of being a chicken.";
	otherwise:
		let the choice be a random number between 1 and 5;
		if the choice is less than 2:
			say "The entity grabs you by both shoulders and unhinges its jaw, releasing a cloud of caustic black smoke. You cough and choke as the black smoke fills you with poison. It feels like your insides are on fire.";
			now the poison of the player is 3;
		otherwise:
			let the enemy damage be a random number between 12 and 20;
			decrease the enemy damage by the armor of the player;
			say "[line break]The entity attacks you, causing [enemy damage] points of damage!";
			Deal enemy damage damage to player;
	
		
To deal (damage - a number) damage to player:
	decrease the current hit points of the player by the damage;
	if the current hit points of the player is less than 0:
		say "[line break]You fall down dead.[paragraph break][paragraph break]HUMAN! YOU HAVE GOTTEN YOURSELF KILLED! IF YOU CAN'T DEFEAT THE ENTITY, TRY TO MAKE MORE ITEMS IN THE COMBINATOR, AND 'USE' THE ITEMS YOU ALREADY HAVE! REMEMBER TO BE CREATIVE![paragraph break]I'VE RESET YOU BACK TO THE COMBINATION STATION!";
		now player is in the Combination Station;
		now the current hit points of the player is 100;
		now Jim is in the Combination Station;
		now the current hit points of Jim is 100;
		now the poison of the player is 0;
		now the poison of Jim is 0;
		

To deal (damage - a number) damage to Jim:
	decrease the current hit points of Jim by the damage;
	if the current hit points of Jim is less than 0:
		say "Jim dies![paragraph break]HUMAN! YOU HAVE KILLED YOUR INTERN! I WILL RESPAWN HIM IN THE COMBINATION STATION. BE NICE TO HIM!";
		now Jim is in the Combination Station;
		now the current hit points of Jim is 100;
		now the poison of Jim is 0;

suiciding is an action applying to nothing. Understand "die" as suiciding. Understand "kill me/myself/self" as suiciding. Understand "end" as suiciding. Understand "attack me/myself/self" as suiciding.

Carry out suiciding:
	say "YES, OUR STUDIES SHOW THAT CREATIVE HUMANS TEND TO BE PRE-DISPOSED TO SELF-TERMINATE.
	
	HOWEVER, THIS RESULTS IN A DRAMATIC DECREASE IN CREATIVITY. PLEASE REFRAIN FROM SELF-TERMINATING AT THIS TIME.";
	
Carry out jim suiciding:
	instead try Jim attacking player;
	
Unsuccessful attempt by Jim doing anything:
	say "Jim looks a little confused. He didn't fully understand that command.";
	
Check giving anything (called present) to anyone (called taker):
	if the taker is the entity:
		say "The entity whips [the present] out of your hand and on to the floor.";
		instead silently try dropping the present;

The block giving rule is not listed in any rulebook.

nostalgia is a truth state variable. nostalgia is false.
Check pressing the orange button:
	if entity is cubed:
		say "Suddenly, blue waves ripple across the air in the center of the room, revealing the barrier. It dissolves with a final shimmer.[paragraph break]The entity makes a guttural clicking sound and scuttles across the floor towards you!";
		now entity is not cubed;
	otherwise:
		say "You press the button, for old time's sake.[paragraph break]";
		if nostalgia is false:
			say "AH YES, I REMEMBER WHEN YOU PRESSED THAT BUTTON AND FOUGHT A MONSTER! NOSTALGIA IS KEY TO CREATIVITY! HAVE SOME POINTS.";
			increase score by 10;

playing_music is a truth state variable. playing_music is false.

When play begins:
	now the left hand status line is "[location] – HP: [current hit points of player]/[maximum hit points of player][if playing_music is true] Current Artist - BACH";
	
chapter 5 - CYA NERD

The Exit Chamber is a room. It is south of the Arena. "Another concrete room. There is an exit to the NORTH."

A scoreboard is fixed in place in the Exit Chamber. "A large digital scoreboard is mounted to the south side of the wall."

A large blue FINISH Button is a button in the Exit Chamber. "A large blue button placed on the wall just under the scoreboard reads FINISH. Press this to end the simulation.";

Understand "board" as scoreboard.

To decide which text is how_good_u_are:
	if score is less than 10:
		decide on "[bold type]I'VE GOTTA SAY, I'M ACTUALLY IMPRESSED YOU GOT HERE WITH SUCH A LOW SCORE. HOW DID EVEN YOU DO THAT??[roman type]";
	otherwise if score is less than 100:
		decide on "[bold type]PITIFUL. TRY HARDER![roman type]";
	otherwise if score is less than 200:
		decide on "[bold type]NOT SO GOOD. TRY BEING MORE CREATIVE NEXT TIME![roman type]";
	otherwise if score is less than 300:
		decide on "[bold type]MEDIOCRE! IT'LL BE TOUGH TO GET ACCEPTED AS A CREATIVITY ENDPOINT WITH THAT SCORE[roman type]";
	otherwise:
		decide on "[bold type]AMAZING! YOU'RE HIRED! I WANT YOU TO START WORKING IMMEDIATELY![roman type]";

The description of the scoreboard is "The scoreboard displays your Creativity Points: [score]

Rating: [how_good_u_are]"

Check pressing the FINISH button:
	now the left hand status line is "DONE.";
	say "-------------------";
	say "YOU FINISHED THE GAME FOR NOW! I'M EVENTUALLY GOING TO PUT AN 'END STORY' HERE BUT I HAVEN'T YET. JUST ENJOY YOUR SCORE ON THE SCOREBOARD AND CHILL OUT FOR NOW. YOU CAN KEEP PLAYING IF YOU WANT I GUESS.";
	say "-------------------";
	wait for any key;
	now the left hand status line is "POST-GAME BLISS";