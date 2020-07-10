--鉄獣の抗戦
--Tribrigade Revolt
--Scripted by Naim
local s,id=GetID()
function s.initial_effect(c)
	--Special Summon from hand
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCountLimit(1,id)
	e1:SetTarget(s.target)
	e1:SetOperation(s.activate)
	c:RegisterEffect(e1)
end
s.listed_series={0x249}
function s.spfilter2(c,fg,minmat,maxmat)
	return c:IsSetCard(0x249) and c:IsLinkSummonable(nil,fg,minmat,maxmat)
end
function s.rescon(sg,e,tp,mg)
	return Duel.GetMatchingGroupCount(s.spfilter2,tp,LOCATION_EXTRA,0,nil,sg,#sg,#sg)>0
end
function s.filtercheck(c,e,tp)
	return c:IsCanBeLinkMaterial() and c:IsCanBeSpecialSummoned(e,0,tp,false,false) and c:IsRace(RACES_BEAST_BWARRIOR_WINGB)
		and (c:IsLocation(LOCATION_GRAVE) or (c:IsLocation(LOCATION_REMOVED) and c:IsFaceup()))
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	local fg=Duel.GetMatchingGroup(s.filtercheck,tp,LOCATION_GRAVE+LOCATION_REMOVED,0,nil,e,tp)
	if chk==0 then return aux.SelectUnselectGroup(fg,e,tp,1,ft,s.rescon,0)
		and Duel.IsPlayerCanSpecialSummonCount(tp,2)
		and ft>0 and Duel.GetLocationCountFromEx(tp,tp,nil,TYPE_LINK)>=0
	end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,nil,tp,LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA)
end
function s.activate(e,tp,eg,ep,ev,re,r,rp)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	local fg=Duel.GetMatchingGroup(s.filtercheck,tp,LOCATION_GRAVE+LOCATION_REMOVED,0,nil,e,tp)
	if ft<1 then return end
	local g=aux.SelectUnselectGroup(fg,e,tp,1,99,s.rescon,1,tp,HINTMSG_SPSUMMON,s.rescon,nil,false)
	if not g or #g==0  then
		return false
	end
	local c=e:GetHandler()
	for tc in aux.Next(g) do
		Duel.SpecialSummonStep(tc,0,tp,tp,false,false,POS_FACEUP)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		tc:RegisterEffect(e1)
		local e2=e1:Clone()
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		tc:RegisterEffect(e2)
	end
	Duel.SpecialSummonComplete()
	local tg=Duel.GetMatchingGroup(s.spfilter2,tp,LOCATION_EXTRA,0,nil,g,#g,#g)
	if #tg>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local sg=tg:Select(tp,1,1,nil)
		local sc=sg:GetFirst()
		Duel.LinkSummon(tp,sc,g,g)
	end
end