CREATE VIEW CLIENTHAS AS
SELECT ClientId, CTitle||' '||CFName||' '||CLName ClientName, AccNo FROM Client 
JOIN HasAccount using (ClientId);

SELECT ClientName, COUNT(AccNo) FROM CLIENTHAS 
GROUP BY ClientName;

SELECT AccNo FROM CLIENTHAS
GROUP BY AccNo  HAVING COUNT(ClientName) > 1;

CREATE VIEW CLIENTACC AS
SELECT CTitle||' '||CFName||' '||CLName ClientName, AccTypeDesc FROM Client
Join HasAccount using (ClientID)
Join Account using (AccNo)
Join AccountType using (AcType);

Select ClientName FROM CLIENTACC
WHERE AccTypeDesc LIKE '%Current' OR AccTypeDesc LIKE '%deposit';

Select ClientName FROM CLIENTACC
WHERE AccTypeDesc LIKE '%Current' Union AccTypeDesc LIKE '%deposit';

Select ClientName FROM CLIENTACC
WHERE AccTypeDesc LIKE '%deposit' AND NOT AccTypeDesc LIKE '%Current' ;

Select ClientName FROM CLIENTACC
WHERE AccTypeDesc LIKE '%Current' AND NOT AccTypeDesc LIKE '%deposit';

Select ClientName FROM CLIENTACC
WHERE AccTypeDesc LIKE '%Current' OR AccTypeDesc LIKE '%deposit' 
AND NOT AccTypeDesc LIKE '%Current' AND AccTypeDesc LIKE '%deposit';

CREATE VIEW NOTUSED AS
SELECT ACTYPE, AccTypeDesc, DateIntroduced, ExpiryDate, Accno FROM AccountType
Join Account using (AcType);

SELECT ACTYPE, AccTypeDesc, DateIntroduced, ExpiryDate FROM NOTUSED
WHERE Accno IS NULL;