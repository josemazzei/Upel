SELECT  nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar, idparticipante  
FROM  tparticipante
WHERE cedulapar IN 
(select tp.cedulapar FROM tparticipante AS tp , tcurso, tgrupo  
WHERE (YEAR(CURDATE())-YEAR(tp.fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(tp.fechanacimientopar,5))
  BETWEEN edadmin AND edadmax
AND idgrupo = tgrupo_idgrupo)
AND idparticipante 
NOT IN (
SELECT tparticipante_idparticipante FROM tcurso_tparticipante, tcurso WHERE tcurso_idcurso = idcurso
 AND estatuscur='1')
  AND estatuspar='1' 