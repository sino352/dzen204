SCONFIG = L2TConfig.GetConfig();
moveDistance = 30;
ShowToClient("Q9", "Quest Request of Sealed Evil Fragments - Started");
LearnAllSkills();
MoveTo(-114372, 260141, -1199, moveDistance);
MoveTo(-114367, 260270, -1181, moveDistance);
TargetNpc("Pantheon", 32972);
Talk();
ClickAndWait("talk_select", "Quest");
ClickAndWait("quest_choice?choice=13&option=1", "[532801]");
ClickAndWait("menu_select?ask=10328&reply=2", "\"What do I have to do?\"");
ClickAndWait("quest_accept?quest_id=10328", "\"Sounds easy. I'll do it.\"");
ClearTargets();
MoveTo(-114367, 260270, -1181, moveDistance);
MoveTo(-114607, 259561, -1199, moveDistance);
MoveTo(-114668, 259368, -1199, moveDistance);
MoveTo(-114400, 258172, -1199, moveDistance);
MoveTo(-114410, 257179, -1138, moveDistance);
MoveTo(-115360, 257781, -1137, moveDistance);
MoveTo(-116361, 257785, -1512, moveDistance);
MoveTo(-117044, 255655, -1310, moveDistance);
MoveTo(-117184, 255572, -1298, moveDistance);
MoveTo(-117896, 255865, -1327, moveDistance);
MoveTo(-117968, 255841, -1327, moveDistance);
TargetNpc("Kakai", 30565);
Talk();
ClickAndWait("talk_select", "Quest.");
ClickAndWait("quest_choice?choice=0&option=1", "[532802]");
ClickAndWait("menu_select?ask=10328&reply=1", "Haver over the Piece of Evil.");
ClickAndWait("menu_select?ask=10328&reply=2", "&quot;He wants you to seal this.&quot;");
ClearTargets();
SetPause(true);
ShowToClient("Q9", "Quest Request of Sealed Evil Fragments - Finished");
