--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,5)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Main Deck
Debug.AddCard(101102059,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(101102057,0,0,LOCATION_DECK,0,POS_FACEDOWN)
--Debug.AddCard(101102014,0,0,LOCATION_DECK,0,POS_FACEDOWN)
--Extra Deck
Debug.AddCard(101102034,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(101102033,0,0,LOCATION_EXTRA,0,8)
Debug.AddCard(101102032,0,0,LOCATION_EXTRA,0,8)
--Hand
Debug.AddCard(101102058,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(19230407 ,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101102057,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(19230407,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101102014,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101102015,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(24094653,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(101102015,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--GY
Debug.AddCard(19230407,0,0,LOCATION_GRAVE,0,POS_FACEUP)
--Monster Zones
Debug.AddCard(101102014,0,0,LOCATION_MZONE,0,1,true)
Debug.AddCard(101102015,0,0,LOCATION_MZONE,1,1,true)
Debug.AddCard(75878039,0,0,LOCATION_MZONE,3,1,true)
Debug.AddCard(75878039,1,1,LOCATION_MZONE,3,4,true)
Debug.AddCard(75878039,1,1,LOCATION_MZONE,2,1,true)
Debug.ReloadFieldEnd()
aux.BeginPuzzle()