--rush draft simulator
local s,id=GetID()
function s.initial_effect(c)
	--Pre-draw
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_STARTUP)
	e1:SetCountLimit(1)
	e1:SetOperation(s.op)
	Duel.RegisterEffect(e1,0)
end

function s.op(e,tp,eg,ep,ev,re,r,rp)
	local toname=function(code)
		return "c"..code..".lua"
	end
	local fg=Duel.GetFieldGroup(0,0x43,0x43)
	--remove all cards
	Duel.SendtoDeck(fg,nil,-2,REASON_RULE)
	
	--announce number of pack drafted
	local packnum=Duel.AnnounceLevel(tp,1,15)
	
	--declare kind of pack
	--the list of packs might be loaded from another file as well
	local pack={}
	for i=1,packnum do
		local ac=Duel.SelectCardsFromCodes(tp,1,1,false,false,260000001,260000002)
		table.insert(pack,ac)
	end
	local packopp={table.unpack(pack)}
	--variable for later
	local pick=Group.CreateGroup()
	local pickopp=Group.CreateGroup()
	
	local packopen=Group.CreateGroup()
	local packopenopp=Group.CreateGroup()
	--pack opening
	Debug.Message(#pack)
	for i=1,#pack do
		--each player pick their pack
		local packpick=Duel.SelectCardsFromCodes(tp,1,1,false,true,table.unpack(pack))
		
		local packpickopp=Duel.SelectCardsFromCodes(1-tp,1,1,false,true,table.unpack(packopp))
		--remove the pack
		table.remove(pack,packpick[2])
		table.remove(packopp,packpickopp[2])
		
		--pack gen
		packopen=({Duel.LoadScript(toname(packpick[1]),false)})[2](tp)
		packopenopp=({Duel.LoadScript(toname(packpickopp[1]),false)})[2](1-tp)
		pickturn=tp
		--loop that make the player pick
		--a new token is generated in function of pick to set the owner
		for j=1,#packopen do
			if pickturn==tp then
				local tc= packopen:Select(tp,1,1,nil)
				packopen:Sub(tc)
				local c=Duel.CreateToken(tp,tc:GetFirst():GetOriginalCode())
				pick:AddCard(c)
				local tc2= packopenopp:Select(tp,1,1,nil)
				packopenopp:Sub(tc2)
				local c2=Duel.CreateToken(1-tp,tc2:GetFirst():GetOriginalCode())
				pickopp:AddCard(c2)
				pickturn=1-tp
			else
				local tc= packopenopp:Select(tp,1,1,nil)
				packopenopp:Sub(tc)
				local c=Duel.CreateToken(tp,tc:GetFirst():GetOriginalCode())
				pick:AddCard(c)
				local tc2= packopen:Select(tp,1,1,nil)
				packopen:Sub(tc2)
				local c2=Duel.CreateToken(1-tp,tc2:GetFirst():GetOriginalCode())
				pickopp:AddCard(c2)
				pickturn=tp
			end
		end
	end
	--add something to have the players pick the cards he want to keep
	
	Duel.SendtoDeck(pick,nil,tp,REASON_RULE)
	Duel.SendtoDeck(pickopp,nil,tp,REASON_RULE)
end