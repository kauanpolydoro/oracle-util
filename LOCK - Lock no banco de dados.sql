SELECT L1.SID, ' esta bloqueando ', L2.SID
FROM GV$LOCK L1, 
     GV$LOCK L2
WHERE L1.BLOCK = 1
AND L2.REQUEST > 0
AND L1.ID1 = L2.ID1
AND L1.ID2 = L2.ID2;

-- IDENTIFICA SESSÃO
SELECT * FROM V$SESSION WHERE SID = 3241; --SID do L1 do SELECT acima

-- MATA A SESSÃO
ALTER SYSTEM KILL SESSION '3241,5217' IMMEDIATE; --SID e SERIAL# do SELECT em V$SESSION