"creativity" by Elliot Fiske

Include Basic Screen Effects by Emily Short.
Include Basic Hyperlinks by Emily Short.

Release along with a website and an interpreter.

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
	Wait for any key;
	say "YOU WILL BE PLACED IN A STATE-OF-THE-ART TEXT-BASED SIMULATOR THAT GAUGES YOUR LEVEL OF CREATIVITY. YOU HAVE AN INNATE HUMAN INGENUITY AND ABILITY TO THINK 'OUTSIDE OF THE BOX' {complement rating: genuine} AND THIS SIMULATION WILL ALLOW CREATIVITRIX TO QUANTIFY IT.[paragraph break]";
	Wait for any key;
	say "THE SIMULATION WILL BEGIN ONCE YOU PRESS ANY KEY. PRESS ANY KEY TO BEGIN THE SIMULATION. {warning: redundant phrase detected}[paragraph break]";
	Wait for any key;
	Move player to Workshop;
	

Part 2 - Setup and Configuration Stuff

Chapter 1 - Dumb Tables

 Table of Hyperlink Glulx Replacement Commands (continued)
 linknum   	replacement  
  1  	"rate 1 stars"
  2   	"rate 2 stars"
  3  	"rate 3 stars"
  4  	"rate 4 stars"
  5  	"rate 5 stars"

When rating1:
	say "Please rate your experience with the CREATIVITRIX QUALIFICATION DETERMINATION SIMULATION thus far:[paragraph break]";
	say "[set link 5]5 - Excellent[end link][paragraph break]";
	say "[set link 4]4 - Appealing[end link][paragraph break]";
	say "[set link 3]3 - Unremarkable[end link][paragraph break]";
	say "[set link 2]2 - Lackluster[end link][paragraph break]";
	say "[set link 1]1 - Truly Awful[end link][paragraph break]";


Chapter 2 - Rating module

A rating is a kind of value. 5 stars specifies a rating.

Giverating is an action applying to one rating. Understand "rate [rating]" as giverating.

Report giverating: say "LOL good rating [rating understood]";

Part 3 - Simulation

Chapter 1 - Workshop

[NOTE: "Wait for Any Key" seems to force room description to print twice. So I disabled printing description if it's unvisited :3]
Rule for printing the name of Workshop: If Workshop is visited, say "Workshop".

The Workshop is a room. "[if Workshop is visited]You are standing in a modern-looking laboratory. [lighting] illuminates the room in a tense white glow.[end if]".

Flourescent lighting is scenery in Workshop. "This is some lights."
Understand "light/lights" as lighting

The table is in the Workshop. The table supports a mouse. A thing can be cool.

[After doing anything other than examining the table when the lighting is scenery: say "WHOO BOY"]

[After examining a thing that is not scenery (called inspectee): say "THAT [noun] IS NOT [one of]SCENERY[or]BUTTS[or]GUYS[or]THINGS[stopping]"; now inspectee is cool.]

The table is undescribed. On the table is a proper-named thing with printed name "DUMB STUFF LOL"

After examining a thing (called inspectee):
	if inspectee is cool:
		say "WOW! WHAT A COOL [noun]";
	otherwise: 
		now inspectee is cool.

A light snack is in the Workshop. It is edible.

Does the player mean eating the lighting: it is likely.

Instead of doing anything other than examining when noun is the lighting: 
	let dogs be a truth state;
	now dogs is whether or not a table is visible;
	if dogs is true, say "LOL LOOK A TABLE"
	
Every thing has a number called damage.