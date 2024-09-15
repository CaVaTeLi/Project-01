/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/


VAR health = 20
VAR Hunger = 40 // 30, 20, 10, 0
VAR playerArmoreValue = 20
VAR weaponStrength = 10
LIST Inventory = (Sword), (Backpack), (Food), LightArmor, HeavyArmor, FlamingSword, SkullRelic, MagicSword, tankyArmor, lightningSword

->start

==start==
You and your brother Jake are traveling to a mystery cave you heard about from your friend Flambo in the fire kingdom.
You are carrying: {Inventory}. 
Health = {health}
Armor strength = {playerArmoreValue}
Weapon strength = {weaponStrength}
Hunger = {advance_time ()}

There is a train up ahead passing by, blocking the path. What do you want to do?
+[Wait for the train to pass] ->wait
*[Jump onto the train] ->jumpOn 

 ==wait==
You both sit and wait.....30 minutes pass...and the train is still going by...
+[Wait for the train to pass] ->wait
*[Jump onto the train] ->jumpOn

 ==jumpOn==
 You both jump on and try to pass through but you are met by a strange-looking warrier who attacks you without warning!
 *[Draw your sword and fight] ->fight
 *[Push the man off the train] -> pushMan
 
 
 ==fight==
 Slicing through the warriers torso, he spontaneously combusts into a cloud of dust. All his armor and gear drop to the ground with a loud clang. 
 *[loot gear] ->lootGear
 *[continue to next train cart] ->trainCart2
 ->END

==lootGear==
You obtain light armor and a magic sword. 
~ weaponStrength = weaponStrength + 10
~ playerArmoreValue = playerArmoreValue + 10
~ Inventory += MagicSword
~ Inventory += LightArmor 
*[Continue to next cart]->trainCart2

==pushMan==
You try to dodge his attack by spinning out of the way, the warrier still manages to hit you over the head with a club, you stumble backwards. Taking 5 health damage.
~ health = health - 5
Feeling engraged you charge at him and shove him. He flys backwards, failing to catch his balance he falls out of the train car.
Scanning your surroundings you see a chest.
*[Loot chest] ->lootChest 
*[Continue to next cart] ->trainCart2

==lootChest==
You obtained light armor and magic sword!
 ~ Inventory += MagicSword 
 ~ Inventory += LightArmor
 ~ weaponStrength = weaponStrength + 10
 ~ playerArmoreValue = playerArmoreValue + 10
*[Continue] ->trainCart2


==trainCart2==
You and Jake are now in the the next cart. They are met by giant crystal ants!

You are equipped with: {Inventory}. 
Health = {health}
Armor Strength = {playerArmoreValue}
Weapon Strength = {weaponStrength}
Choose your weapon and armor
->Stats

==Stats== 
*[Sword]
~ Inventory -= Sword
->Stats
*[Magic Sword]
~Inventory -= MagicSword
->Stats
*[light armor]
~Inventory -= LightArmor
->Stats
*[Fight]
->fightAnts


==fightAnts==
Using your sword you attack the giant crystal ants, they put up quite the fight, destroying your armor, but you prevail killing them with a few final blows, your sword splits in two from the power of the last attack but the ants shatter into a million pieces.  
~ health = health - 5
~weaponStrength = weaponStrength - 10
~playerArmoreValue = playerArmoreValue -10
*[loot the cart] ->lootCart2
*[continue to next cart] ->Cart3

==Run==
You run past the enemies and continue to the next car 
->Cart3

==lootCart2==
You obtain a Flaming Sword and Heavy Armor
~Inventory += FlamingSword
~weaponStrength += weaponStrength + 20
~Inventory += HeavyArmor
*[continue] ->Cart3

==Cart3==
You and Jake are in the next cart. You are met by massive geode monsters!
You are equipped with: {Inventory}. 
Choose your weapon and armor
->Stats1


==Stats1== 
*[Sword]
~ Inventory -= Sword
->Stats
*[Flaming Sword]
~Inventory -= FlamingSword
~weaponStrength = weaponStrength + 30
->Stats1
*[Heavy armor]
~Inventory -= HeavyArmor
~playerArmoreValue = playerArmoreValue + 50
->Stats1
+[Fight]
->fightGeodeMonsters

==fightGeodeMonsters==
Health = {health}
Armor Strength = {playerArmoreValue}
Weapon Strength = {weaponStrength}
You and Jake attack the geode monsters!
They are much stronger than your last oponents!
It is a rough battle, you both sustain damage and your armor and weapons are destroyed. 
~ health = health - 5
*[loot cart] ->lootCart3
*[continue] ->Cart4

==lootCart3==
You obtain a magical skull relic, a lightning sword and better more tanky armor
~weaponStrength = weaponStrength - 30
~playerArmoreValue = playerArmoreValue - 50

*[continue] ->Cart4

==Cart4==
This cart is empty. You are feeling worn out from fighting. Jake points out these train cars are all the same and tries to convince you to head home now.
Health = {health}
Armor Strength = {playerArmoreValue}
Weapon Strength = {weaponStrength}
Hunger = {advance_time ()}
*[Stop to rest and eat]
->END
*[jump off train and go home]
->END
*[Continue]
->END


== function advance_time ==

    ~ Hunger = Hunger - 10
    
    {
        - Hunger < 0:
            ~ Hunger = 0
    }
    
    {
        -Hunger == 30:
            ~return "Full"
            
        -Hunger == 20:
            ~return "hungry"
        
        -Hunger == 10:
            ~return "very hungry"
            
        -Hunger == 0:
            ~return "starving"
            
        }
        

/*
VAR Hunger = +20 // 20 Full, 10 Hungry, 5 very hungry, 0 Starving

 
