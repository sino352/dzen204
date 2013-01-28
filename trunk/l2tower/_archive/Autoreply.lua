MaxAutoAnswersForSameGuy = 2; -- Set how many pms you can answer the same player while in AFK mode.
SaluteDelay = 5; -- Answer Delay on Salute PMs in seconds.
OthersDelay = 15; -- Answer Delay on Rest of PMs in seconds.
MinimumBulshitTalkDelay = 300 ; -- Set here minimum general chat answer time possible between chats if someone flags on your char.
 
GoAFKCommand = 'afk';  -- Set the Command you need to PM yourself with to indicate your AFK Status.
ImBackCommand = 'back'; -- Set the Command you need to PM yourself with to indicate your Presence Status.
 
HelloRList = {'Hey','Sup','Hello','hi','hey','?','here?'}; -- List of pms you consider as Salute type and expect the bot to answer corrispondently.
HelloSList = {'Hey','Sup','Hello','hi','hey','?'};
MockList = {'bot','bot?'}; -- List of pms you consider they need a stupid response.
MockSList = {'lol','lol?','what?','...','no engrish'}; -- List of stupid answers.
OthersSList ={'non capisco',':o','non comprendo','no english','???','no eng','aderna plz','itemz plz','no understando'}; -- List of answers you you want your char to answer with in case script couldnt decipher what they meant.
---- below another 2 lists of pms and answers to add.
List2R = {'ciao','ehi'};  -- Set PM you plan to give Special Answers List2.
List2S = {'ehi la','come va?'};  -- Set The Special Answers for List2.
List3R = {};  -- Set PM you plan to give Special Answers List3.
List3S = {};  -- Set The Special Answers for List3.
 
BSAnswer = 0 ; -- Set -1 if you dont want your char to talk if someone flags on you, or 0 in case you want it to talk.
BulshitTalkList = {'you are lucky im farming right now or I would have killed you','fuck off...','piss off','you better leave me alone','and?','what a noob..','you feel pro now?','fuck you douchbag' };  -- Put here The General Chat Talks you want your chat to say in case it get attacked by another.
 
---------------------------------------No Change Under This Line-----------------------------------
ShouldAnswerPM = false;
AFKmode = false;
LastTalkBulshitTime = 0;
 
function HowManyPossibleAnswersInTheList()
local t = AnswerList;
local count =0;
	for i,v in ipairs(t) do
	count = i;
	end;
return count;
end;
 
function CheckIfInsideList(Smsg,Rmsglist)
for x,y in pairs(Rmsglist) do
if (y == Smsg) then
return true;
end;
end;
return false;
end;
 
function OnAttack(user, target)
	AnswerList = BulshitTalkList;
	if (BSAnswer == 0) and (AFKmode == true) and (user:IsPlayer() == true) and (target:GetCpPercent()<30)  and (AmISafe == true) and (LastTalkBulshitTime+MinimumBulshitTalkDelay < os.time()) then
	AmISafe = false;	
	BSAnswer = math.ceil(math.random(1,HowManyPossibleAnswersInTheList()));	-- Choose Random Answer from the list.				
	LastTalkBulshitTime = os.time() ;
 
	end;
 
end;
 
function OnLogout()
AFKmode = false;
ShouldAnswerPM = false;
end;
 
function OnDestroy()
	AFKmode = false;
	ShouldAnswerPM = false;
end;
 
function OnLTick1s()
 
	if (GetMe():GetCpPercent()>30) then
		AmISafe = true;
	end;
 
	if (LastTalkBulshitTime + 15 < os.time()) and (BSAnswer > 0) then
		Command(AnswerList[BSAnswer]);
		BSAnswer = 0 ;
	end;
 
	if (AFKmode == true) then
		if (ShouldAnswerPM == true) then 
			if (MessageCurrentTime+DelayinAnswer < os.time() ) then 
				ShouldAnswerPM = false;
				SendPM(PlayerToAnswerName, Answer);  
			end;
		end; 
	end; 
 
end;
 
function OnChatUserMessage(chatType, nick, msg)
 
	    if (chatType == 2) and (ShouldAnswerPM == false)  then
			Message =  string.gsub(string.lower(msg)," ","");
			if (string.lower(nick) ~= string.lower(GetMe():GetName())) and (AFKmode == true) then  
			if (oldnick ~= nick) then
				oldnick = nick;
				ChatCounter = 0;
				end;
 
				ChatCounter = ChatCounter+1;
				if (ChatCounter <= MaxAutoAnswersForSameGuy) then
				ShouldAnswerPM = true;
				PlayerToAnswerName = nick;
				MessageCurrentTime = os.time();					
					if (CheckIfInsideList(Message,HelloRList)) then
						AnswerList = HelloSList;
						DelayinAnswer = SaluteDelay;  -- Delay in seconds
					elseif  CheckIfInsideList(Message,MockList) then  
						AnswerList = MockSList;
						DelayinAnswer = OthersDelay;  -- Delay in seconds
					elseif  CheckIfInsideList(Message,List2R) then  
						AnswerList = List2S;
						DelayinAnswer = OthersDelay;  -- Delay in seconds
					elseif  CheckIfInsideList(Message,List3R) then  
						AnswerList = List3S;
						DelayinAnswer = OthersDelay;  -- Delay in seconds						
					else
						AnswerList = OthersSList;
						DelayinAnswer = OthersDelay;  -- Delay in seconds
					end;
				Answer = AnswerList[math.ceil(math.random(1,HowManyPossibleAnswersInTheList()))];	-- Choose Random Answer from the list.			
				end;
			else 
				if (Message == GoAFKCommand) and (AFKmode == false) then
				AFKmode = true;	
				ShowToClient("Auto Chat Script","Im on AFK mode now, Auto chat is now Activated.");
				elseif (Message == ImBackCommand) and (AFKmode == true) then			
				AFKmode = false;
				ShowToClient("Auto Chat Script","You Are Back, Auto chat is now Deactivated.");
				end;
			end;
		end; 
end;