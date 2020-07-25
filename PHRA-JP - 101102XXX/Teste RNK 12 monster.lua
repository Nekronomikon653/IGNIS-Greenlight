--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,5)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Hand (yours)
Debug.AddCard(62541668,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(101102045,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)

Debug.AddCard(19230407,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(14778250,0,0,LOCATION_HAND,1,POS_FACEDOWN)
Debug.AddCard(14778250,0,0,LOCATION_HAND,1,POS_FACEDOWN)
Debug.AddCard(14778250,0,0,LOCATION_HAND,1,POS_FACEDOWN)

--Monster Zones (yours)
Debug.AddCard(6983839,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)
Debug.AddCard(31764700,0,0,LOCATION_MZONE,1,POS_FACEUP_ATTACK,true)
Debug.AddCard(31764700,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(41209827,0,0,LOCATION_MZONE,5,POS_FACEUP_ATTACK,true)
Debug.AddCard(101102045,0,0,LOCATION_MZONE,4,POS_FACEUP_DEFENSE,true)
Debug.AddCard(48739166,0,0,LOCATION_MZONE,4,POS_FACEUP)

--Spell & Trap Zones (opponent's)
Debug.AddCard(29401950,1,1,LOCATION_SZONE,3,POS_FACEDOWN)
Debug.AddCard(98427577,1,1,LOCATION_SZONE,4,POS_FACEDOWN)

Debug.ReloadFieldEnd()