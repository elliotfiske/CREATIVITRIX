"creativity" by Elliot Fiske

Include Basic Screen Effects by Emily Short.
Include Basic Hyperlinks by Emily Short.
Include Glulx Text Effects by Emily Short.

Release along with a website and an interpreter.

Use scoring.
	
The maximum score is 10000.

Part 1 - Introduction

The display banner rule is not listed in the startup rulebook.

Introduction is a room.

Rule for printing the name of Introduction: stop.

When play begins:
	say  "WELCOME TO THE CREATIVITRIX QUALIFICATION DETERMINATION SIMULATION." ;
	say "{data indicate that subjects respond positively to parallel rhyming structure while in unfamiliar situations}.";
	say "[paragraph break]";
	say "PLEASE GET COMFORTABLE {data indicate that subjects in an ergonomic seating position produce 14% better content and are less susceptible to thyroid problems} AND PRESS ANY KEY TO CONTINUE.";
	Wait for any key;
	say "[paragraph break]";
	say "CONGRATULATIONS ON BEING ACCEPTED TO THE APPLICATION PROCESS FOR BECOMING A CERTIFIED CREATIVITY ENDPOINT FOR CREATIVITRIX.";
	now the right hand status line is "CREATIVITY: [score]";
	Wait for any key;
	say "YOU WILL BE PLACED IN A STATE-OF-THE-ART TEXT-BASED SIMULATOR THAT GAUGES YOUR LEVEL OF CREATIVITY. YOU HAVE AN INNATE HUMAN INGENUITY AND ABILITY TO THINK 'OUTSIDE OF THE BOX' {complement rating: genuine} AND THIS SIMULATION WILL ALLOW CREATIVITRIX TO QUANTIFY IT.[paragraph break]";
	say "THE SIMULATION TRACKS YOUR LEVEL OF CREATIVITY THROUGH 'CREATIVITY POINTS.' DOING CREATIVE AND UNEXPECTED THINGS WILL RESULT IN AN INCREASE OF 'CREATIVITY POINTS.' TRY TO GET AS MANY AS YOU CAN!";
	Wait for any key;
	say "THE SIMULATION WILL BEGIN ONCE YOU PRESS ANY KEY. PRESS ANY KEY TO BEGIN THE SIMULATION. {warning: redundant phrase detected}[paragraph break]";
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
	the first rating happens in 3 turns from now.
	
At the time when the first rating happens:
	say "HELLO AGAIN! I'D LIKE TO INTRODUCE... THE RATINGS MODULE! HUMAN FEEDBACK IS CRUCIAL TO CREATIVITRIX, AND THIS LITTLE GUY IS HERE TO COLLECT IT! I'LL LET HIM TALK:[paragraph break][paragraph break] Please rate your experience with the CREATIVITRIX QUALIFICATION DETERMINATION SIMULATION thus far:[paragraph break]";
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
		if rating understood is greater than 5 stars:
			say "OH NO! YOU'VE TERRIFIED THE RATING MODULE WITH YOUR PERFECT SCORE! NOW IT THINKS IT CAN NEVER LIVE UP TO THE GLORY IT'S ACHIEVED FROM YOUR OVERLY PERFECTIONIST RATING. THE RATING MODULE RAN AWAY!";
		if rating understood is 4 stars:
			say "OH NO! THE RATING MODULE WAS SO CLOSE TO 5 STARS! IT'S GOING TO CONSTANTLY WONDER WHAT LITTLE MISTAKE IT MADE THAT KEPT IT FROM A PERFECT SCORE! THE RATING MODULE RAN AWAY.";
		if rating understood is 3 stars:
			say "OH NO! THE RATING MODULE IS PARALYZED BY YOUR MEDIOCRE RATING! IF ONLY YOU'D GIVEN IT A DEFINITIVELY GOOD OR BAD SCORE, IT MIGHT HAVE HAD AN IDEA OF HOW GOOD ITS PERFORMANCE WAS! THE RATING MODULE RAN AWAY.";
		if rating understood is 2 stars:
			say "OH NO! THE RATING MODULE IS CRUSHED BY YOUR POOR REVIEW! IT SAYS IT DOESN'T NEED YOUR 'PITY STAR' AND WISHES YOU HAD JUST GIVEN IT ONE STAR! THE RATING MODULE RAN AWAY CRYING.";
		if rating understood is less than 1 stars:
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
	
Section 1 - Points for exploring

A thing can be already_examined. A thing is usually not already_examined.
A thing can be already_touched. A thing is usually not already_touched.
A thing can be already_tasted. A thing is usually not already_tasted.
A thing can be already_thrown. A thing is usually not already_thrown.
A thing can be already_smelled. A thing is usually not already_smelled.
		
After touching a thing (called touchee):
	if touchee is not already_touched:
		now touchee is already_touched;
		say "[one of]EXCELLENT! BE SURE TO INSPECT YOUR ENVIRONMENT CAREFULLY![or]AMAZING! YOUR TACTILE ABILITIES ARE UNPARALLELED.[or]NICE! TOUCHING THAT [touchee] GAVE ME A VICARIOUS THRILL![then at random]";
		increase score by 5;

After tasting a thing (called touchee):
	if touchee is not already_tasted:
		now touchee is already_tasted;
		say "[one of]EXCELLENT! BE SURE TO INSPECT YOUR ENVIRONMENT CAREFULLY![or]AMAZING! YOUR TASTING ABILITIES ARE UNPARALLELED.[or]NICE! TASTING THAT [touchee] GAVE ME A VICARIOUS THRILL![then at random]";
		increase score by 5;
		
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

Report taking an alloy: say "Test [first time]this[only]";

The can_respawn_blade is a truth state variable. can_respawn_blade is false.
The can_respawn_entropic is a truth state variable. can_respawn_entropic is false.
The can_respawn_mend is a truth state variable. can_respawn_mend is false.
The can_respawn_shield is a truth state variable. can_respawn_shield is false.
The can_respawn_spark is a truth state variable. can_respawn_spark is false.

Section 2 - Combinations

Combining is an action applying to nothing. Understand "combine" as combining.

Check combining: 
	If player is in the Supply Room:
		If the number of held alloys is greater than the number of free slots:
			say "There's already too many slots full. Drop an element!";
		otherwise if the number of held alloys is less than the number of free slots:
			say "There's [num_free_slots] free slots and you are only carrying [number of held alloys] alloys. Go take another and try again!";
		otherwise:
			try going south;
			repeat with curr_alloy running through the list of held alloys:
				try inserting curr_alloy into slot 1;
		
A poison needle is a thing. The description of the poison needle is "A cruel-looking needle that drips with a caustic venom."
A spiked grenade is a thing. The description of the spiked grenade is "A grenade filled with entropic energy! Spikes jut out from the exterior of this unpredictable weapon."
A vile whip is a thing.  The description of the vile whip is "A long whip, sparking with power and dripping with caustic entropy. Careful!"
A healing syringe is a thing. The description of the healing syringe is "A sharp needle filled with healing and preservation."
A healthy aura is a thing. The description of the healthy aura is "A small glowing green ball that emanates a healing aura."
Understand "ball/green" as aura.
A chestplate of retribution is a thing. The description of the chestplate is "A sturdy chestplate with retractable spikes that hurt incoming attackers."
A healing grenade is a thing. The description of the healing grenade is "A grenade enriched with healing power."
A lightning rod is a thing. The description of the rod is "Sparks fly from this unpredictable weapon - who knows what it might do in battle?"
A smart grenade is a thing. The description of the smart grenade is "A grenade with a digital display and the ability to stun enemies."
A healing helmet is a thing. The description of the healing helmet is "A helmet radiating a healthy glow. It heals whoever is wearing it."

		
Chapter 2 - Fun Zone

Section 1 - Supplies!

The Supply Room is a room. "[if Supply Room is visited]You are standing in a spacious room made of reinforced [concrete]. [A panel] illuminates the room in a tense white glow. There is another room to the south."

The passage is scenery in Supply Room. The description of the passage is "A rectangular passage carved out of the concrete leads to another room to the south."
Understand "door/exit/leave/combination/station" as passage

a concrete is scenery in Supply Room. "The walls are made out of solid concrete, with no seams or cracks anywhere. This room looks like it could withstand a heavy explosion."

A lighting panel is scenery in Supply Room. "A flat white panel is embedded in the concrete on the ceiling. It glows with a uniform brightness."
Understand "light/lights" as panel.
Carry out tasting panel:
	say "You can't reach the panel from down here. Instead, you close your eyes and imagine a warm sunrise basking over your tongue." instead.
Carry out touching panel:
	say "You can't reach the panel from down here. Instead, you close your eyes and imagine a warm sunrise brushing against your fingertips." instead.

[NOTE: "Wait for Any Key" seems to force room description to print twice. So I disabled printing description if it's unvisited :3]
Rule for printing the name of Supply Room: If Supply Room is visited, say "Supply Room".

The alcove is in the Supply Room. It is fixed in place. "[if supply room is visited]An alcove is carved into the wall in front of you. Hovering in the alcove [is-are a list of things on the alcove].[else] "

The description of the alcove is "A rectangular hole is carved out of the stone in front of you. It seems to be where the Alloys respawn if you press the RESET button."
Understand "hole" as alcove.

The alcove supports a SHIELD alloy, a BLADE alloy, an ENTROPIC alloy, a MEND alloy and a SPARK alloy.

A large red button labeled RESUPPLY is a button in the Supply Room. It is fixed in place. "[if supply room is visited]A large red button labeled RESUPPLY is mounted above the alcove.[else] "

The description of the button is "A glowing red button. PRESS THIS BUTTON IF YOU NEED MORE ALLOYS."

Check pressing the red button:
	repeat with yay_alloy running through the list of all not visible alloys:
		say "[A yay_alloy] [one of]teleports in[or]zaps in[or]warps in[or]pops into existence[or]respawns[then at random]!";
		now yay_alloy is on the alcove;

Section 2 - Combinatorics

A vast machine labeled 'Combinator' is in the Combination Station. The description of the machine is "An indecipherable structure made of whirring cogs and gnashing machinery. It's name is the 'Combinator', according to a small plaque affixed to the side. It has 3 slots to put elements in, and a large green button labelled 'GO'."

The green button labelled GO is a button in the Combination Station.

Understand "cogs/machine/machinery" as machine.

A plaque is scenery in the Combination Station. "A small plaque attached to the side of the machine. It says 'Combinator' in a pleasing Arial font."
Understand "sign/label" as plaque.



Slot is a kind of opaque fixed in place container.

A slot has carrying capacity 1.
A slot can be full or free.

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

The Combination Station is a room. It is south of the Supply Room. "[first time]WELCOME TO THE QUALIFICATION DETERMINATION SIMULATION COMBINATION STATION! HERE YOU CAN TAKE ELEMENTS FROM THE PREVIOUS ROOM AND FORM THEM INTO NEW AND FANCIFUL CREATIONS. WHAT ARE YOU WAITING FOR? LET'S GET CREATIVE![only]

You are standing in another concrete room. There are exits to the North and South. In the center is [a machine]. The machine has 3 slots to put elements in:".

Check pressing the GO button:
	if a visible slot does not contain an alloy:
		instead say "You can't press GO if there's an empty slot!";
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
		say "The SHIELD and MELD elements combine to form a magical helmet, and the SPARK alloy makes itself busy by creating a system that diagnoses and heals your wounds. Neat!";
		now player carries a healing helmet;		
	repeat with fun_alloy running through ingredients:
		if fun_alloy is BLADE alloy:
			now can_respawn_blade is true;
		else if fun_alloy is ENTROPIC alloy:
			now can_respawn_entropic is true;
		else if fun_alloy is MEND alloy:
			now can_respawn_mend is true;
		else if fun_alloy is SHIELD alloy:
			now can_respawn_shield is true;
		else if fun_alloy is SPARK alloy:
			now can_respawn_spark is true;
		now fun_alloy is in the Dumb Workaround;
		[now fun_alloy is on the alcove;]
		
The Dumb Workaround is a room.
				
	
				
			
		
		
	