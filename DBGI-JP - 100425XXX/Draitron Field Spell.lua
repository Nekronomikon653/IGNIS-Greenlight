--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,5)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck (yours)
Debug.AddCard(64631466,0,0,LOCATION_DECK,0,POS_FACEDOWN)

--Extra Deck (yours)
Debug.AddCard(63519819,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(41999284,0,0,LOCATION_EXTRA,1,POS_FACEDOWN)

--Hand (yours)
Debug.AddCard(16024176,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(81752019,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(100425031,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(73642296,0,0,LOCATION_HAND,1,POS_FACEDOWN)
Debug.AddCard(57272170,0,0,LOCATION_HAND,2,POS_FACEDOWN)
Debug.AddCard(29888389,0,0,LOCATION_HAND,3,POS_FACEDOWN)
Debug.AddCard(46159582,0,0,LOCATION_HAND,4,POS_FACEDOWN)
Debug.AddCard(19230407,0,0,LOCATION_HAND,5,POS_FACEDOWN)
Debug.AddCard(18716735,0,0,LOCATION_HAND,6,POS_FACEDOWN)

--GY (yours)
Debug.AddCard(46159582,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(66729231,0,0,LOCATION_GRAVE,1,POS_FACEUP)

--Monster Zones (yours)
Debug.AddCard(81752019,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(100425024,0,0,LOCATION_MZONE,1,POS_FACEUP_ATTACK,true)

--Spell & Trap Zones (yours)
Debug.AddCard(84749824,0,0,LOCATION_SZONE,1,POS_FACEDOWN)
Debug.AddCard(18716735,0,0,LOCATION_PZONE,0,POS_FACEUP)
Debug.AddCard(7868571,0,0,LOCATION_PZONE,1,POS_FACEUP)
Debug.AddCard(1845204,0,0,LOCATION_SZONE,2,POS_FACEDOWN)

Debug.ReloadFieldEnd()
aux.BeginPuzzle()