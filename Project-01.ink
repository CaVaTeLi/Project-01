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

You wake up from what feels like a very deep sleep. The sky is cloudy, you can't see the sun. As you prop yourself up realize you are surrounded by massive stone pillars that are spaced perfectly in a circle. At the base of one of the pillars you see a wooden chest. You struggle to get up onto your feet, but you make your way over to the chest. Inside there is a corked bottle, a backpack, a compass, a hunting knife, some rope, and a blanket. 
*[grab the backpack and stuff all the supplies into it.] ->grab_supplies

==grab_supplies==
You now have the backpack and supplies. You scan your surroundings. In one direction you see a forest, in the opposite direction you see a large body of water. What do you do?

+[walk towards the forest] -> forest
+[walk towards the shoreline] -> shoreline

==forest==
You approach the forest and see a small opening to what seems to be a trail.
+[proceed into the forest and follow the trail.] -> enter_forest

==shoreline==
You approach the shoreline. The sound of the waves gently crashing onto the shore is calming despite the current situation. 
+[Sit down and search the contents of your bag] -> search_backpack
+[Continue to explore the shoreline] -> explore_shoreline

==enter_forest==
->END

==search_backpack==
->END

==explore_shoreline==
->END