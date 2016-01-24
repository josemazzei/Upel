<?php
	/* ESTE MODELO DE SEGURIDAD ESTÁ HECHO CON FINES ACADEMICOS, SU DISTRIBUCIÓN ES GRATUITA, CUALQUIER ADAPTACIÓN, MODIFICACIÓN O MEJORA QUE SE HAGA APARTIR DE ESTE CODIGO DEBE SER NOTIFICADA A LA COMUNIDAD DE LA CUAL FUE OBTENIDO Y/0 A SU CREADOR JAVIER MARTÍN AL CORREO RECUPERA.JAVIER@GMAIL.COM */
	require_once('../nucleo/ModeloConect.php');
	class clsCurso extends ModeloConect
	{
		
		private $lcIdcurso;
		private $lcNombrecur;
		private $lcDescripcioncur;
		private $lcCapacidadcur;
		private $lcLapso;
		private $lcGrupo;
		private $lcEstatuscur;
		private $lcAsignatura;
		private $lcDocente;

		function set_Curso($pcIdcurso)
		{
			$this->lcIdcurso=$pcIdcurso;
		}

		function set_Nombrecur($pcNombrecur)
		{
			$this->lcNombrecur=$pcNombrecur;
		}

		function set_Descripcioncur($pcDescripcioncur)
		{
			$this->lcDescripcioncur=$pcDescripcioncur;
		}

		function set_Capacidadcur($pcCapacidadcur)
		{
			$this->lcCapacidadcur=$pcCapacidadcur;
		}

		function set_Lapso($pcLapso)
		{
			$this->lcLapso=$pcLapso;
		}

		function set_Grupo($pcGrupo)
		{
			$this->lcGrupo=$pcGrupo;
		}

		function set_Aula($pcAula)
		{
			$this->lcAula=$pcAula;
		}

		function set_Docente($pcDocente)
		{
			$this->lcDocente=$pcDocente;
		}

		function set_Asignatura($pcAsignatura)
		{
			$this->lcAsignatura=$pcAsignatura;
		}

		function set_Estatuscur($pcEstatuscur)
		{
			$this->lcEstatuscur=$pcEstatuscur;
		}

		function consultar_curso()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, `taula_idaula`,nombreasi,nombreunodoc,apellidounodoc,nombreaul
					FROM `tcurso`, `tlapso`, `tgrupo`,tasignatura,tdocente,taula WHERE idcurso='$this->lcIdcurso'
					AND idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo AND tasignatura_idasignatura=idasignatura AND tdocente_iddocente=iddocente AND taula_idaula=idaula";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idcurso'];
					$Fila[1]=$laRow['nombrecur'];
					$Fila[2]=$laRow['desgripcioncur'];
					$Fila[3]=$laRow['capacidadcur'];
					$Fila[4]=$laRow['estatuscur'];
					$Fila[5]=$laRow['tlapso_idlapso'];
					$Fila[6]=$laRow['tgrupo_idgrupo'];
					$Fila[7]=$laRow['nombrelap'];
					$Fila[8]=$laRow['nombregru'];
					$Fila[9]=$laRow['descripciongru'];
					$Fila[10]=$laRow['nombreasi'];
					$Fila[11]=$laRow['nombreunodoc'].' '.$laRow['apellidounodoc'];
					$Fila[12]=$laRow['nombreaul'];
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_cursos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, `taula_idaula`
					FROM `tcurso`, `tlapso`, `tgrupo` WHERE idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_cursos_iguales()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`
					FROM `tcurso` WHERE tlapso_idlapso = (SELECT tlapso_idlapso FROM tcurso WHERE idcurso='$this->lcIdcurso') AND tgrupo_idgrupo = (SELECT tgrupo_idgrupo FROM tcurso WHERE idcurso='$this->lcIdcurso') AND tasignatura_idasignatura = (SELECT tasignatura_idasignatura FROM tcurso WHERE idcurso='$this->lcIdcurso') AND idcurso<>'$this->lcIdcurso' AND estatuscur='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_cursos_lapso_participante($idparticipante)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`
					FROM `tcurso`,tcurso_tparticipante WHERE tlapso_idlapso='$this->lcLapso' AND tparticipante_idparticipante='$idparticipante' AND tcurso_idcurso=idcurso";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		

		function consultar_cursos_activos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso` as id, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, `taula_idaula`,(SELECT COUNT(tparticipante_idparticipante) FROM tcurso_tparticipante WHERE tcurso_idcurso=id AND estatus='1')as inscritos,nombreunodoc,apellidounodoc,iddocente
					FROM `tcurso`, `tlapso`, `tgrupo`,tdocente WHERE idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo AND tdocente_iddocente=iddocente AND estatuscur='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['id'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$Fila[$cont][10]=$laRow['inscritos'];					
					$Fila[$cont][11]=$laRow['nombreunodoc'];
					$Fila[$cont][12]=$laRow['apellidounodoc'];
					$Fila[$cont][13]=$laRow['iddocente'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_cursos_inactivos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso` as id, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, `taula_idaula`,(SELECT COUNT(tparticipante_idparticipante) FROM tcurso_tparticipante WHERE tcurso_idcurso=id)as inscritos,nombreunodoc,apellidounodoc,iddocente
					FROM `tcurso`, `tlapso`, `tgrupo`,tdocente WHERE idlapso = tlapso_idlapso AND tdocente_iddocente=iddocente AND idgrupo = tgrupo_idgrupo AND estatuscur='2'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['id'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$Fila[$cont][10]=$laRow['inscritos'];
					$Fila[$cont][11]=$laRow['nombreunodoc'];
					$Fila[$cont][12]=$laRow['apellidounodoc'];
					$Fila[$cont][13]=$laRow['iddocente'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_curso_bitacora()
		{
			$this->conectar();
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, `taula_idaula`
					FROM `tcurso`, `tlapso`, `tgrupo` WHERE idcurso='$this->lcIdcurso'
					AND idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					foreach ($laRow as $key => $value)
					{
						$Fila[$key]=$value;
					}
				}
			$this->desconectar();
			return $Fila;
		}

		function registrar_curso()
		{
			$this->conectar();
			$sql="INSERT INTO `tcurso`(`nombrecur`, `desgripcioncur`, `capacidadcur`
					, `estatuscur`, `tlapso_idlapso`, `tgrupo_idgrupo`, `tasignatura_idasignatura` ,`taula_idaula`,tdocente_iddocente) 
				VALUES (UPPER('$this->lcNombrecur'),UPPER('$this->lcDescripcioncur'),'$this->lcCapacidadcur','1'
					,'$this->lcLapso','$this->lcGrupo', '$this->lcAsignatura', '$this->lcAula', '$this->lcDocente')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_curso()
		{
			$this->conectar();
			$sql="UPDATE tcurso SET estatuscur='0' WHERE idcurso='$this->lcIdcurso'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function cerrar_curso($idcurso_nuevo)
		{
			$this->conectar();
			$this->begin();
			$sql="UPDATE `tcurso` SET estatuscur='2' WHERE idcurso='$this->lcIdcurso'";
			if($lnHecho=$this->ejecutar($sql))
			{
				$sql="UPDATE `tcurso_tparticipante` SET tcurso_idcurso='$idcurso_nuevo' WHERE tcurso_idcurso='$this->lcIdcurso'";
				if(!$lnHecho=$this->ejecutar($sql))
					$this->rollback();
			}
			else
				$this->rollback();

			if($lnHecho)
				$this->commit();

			$this->desconectar();
			return $lnHecho;
		}

		function editar_curso()
		{
			$this->conectar();
			$sql="UPDATE `tcurso` SET `nombrecur`=UPPER('$this->lcNombrecur'),`desgripcioncur`=UPPER('$this->lcDescripcioncur')
			,`capacidadcur`='$this->lcCapacidadcur',`estatuscur`='$this->lcEstatuscur',`tlapso_idlapso`='$this->lcLapso'
			,`tgrupo_idgrupo`='$this->lcGrupo' WHERE idcurso='$this->lcIdcurso'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function consultar_cursos_inscripcion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, nombreasi, 
						(SELECT count(idcurso_participante) 
							FROM tcurso_tparticipante 
							WHERE tcurso_idcurso=idcurso AND estatus='1') AS inscritos
					FROM `tcurso`, `tlapso`, `tgrupo`, tasignatura
					WHERE idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo
					AND tasignatura_idasignatura = idasignatura AND estatuscur='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$Fila[$cont][10]=$laRow['nombreasi'];
					$Fila[$cont][11]=(isset($laRow['inscritos']))?$laRow['inscritos']:"0";
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_cursos_inscritos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`, nombreasi, 
						(SELECT count(idcurso_participante) 
							FROM tcurso_tparticipante 
							WHERE tcurso_idcurso=idcurso AND estatus='1') AS inscritos
					FROM `tcurso`, `tlapso`, `tgrupo`, tasignatura,tcurso_tparticipante
					WHERE tcurso_idcurso=idcurso AND idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo
					AND tasignatura_idasignatura = idasignatura AND estatuscur='1' AND estatus='1' GROUP BY idcurso";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$Fila[$cont][10]=$laRow['nombreasi'];
					$Fila[$cont][11]=(isset($laRow['inscritos']))?$laRow['inscritos']:"0";
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_datos_inscripcion()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`,fechainilap, `nombregru`, `descripciongru`, nombreasi, idasignatura, (SELECT count(idcurso_participante) 
							FROM tcurso_tparticipante 
							WHERE tcurso_idcurso=idcurso AND estatus='1') AS inscritos
					FROM `tcurso`, `tlapso`, `tgrupo`, tasignatura
					WHERE idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo
					AND tasignatura_idasignatura = idasignatura AND idcurso='$this->lcIdcurso'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idcurso'];
					$Fila[1]=$laRow['nombrecur'];
					$Fila[2]=$laRow['desgripcioncur'];
					$Fila[3]=$laRow['capacidadcur'];
					$Fila[4]=$laRow['estatuscur'];
					$Fila[5]=$laRow['tlapso_idlapso'];
					$Fila[6]=$laRow['tgrupo_idgrupo'];
					$Fila[7]=$laRow['nombrelap'];
					$Fila[8]=$laRow['nombregru'];
					$Fila[9]=$laRow['descripciongru'];
					$Fila[10]=$laRow['nombreasi'];
					$Fila[11]=$laRow['idasignatura'];
					$Fila[12]=$laRow['inscritos'];
					$Fila[13]=$laRow['fechainilap'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participantes()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT  nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar, tparticipante.idparticipante,fotoins,(YEAR(CURDATE())-YEAR(tparticipante.fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(tparticipante.fechanacimientopar,5)) as edad,idcurso_participante
					FROM  tparticipante,tcurso_tparticipante,tinscripcion
					WHERE tparticipante.idparticipante=tinscripcion.idparticipante AND tparticipante_idparticipante=tparticipante.idparticipante AND tcurso_idcurso='$this->lcIdcurso' AND estatus='1'";

				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombreunopar'];
					$Fila[$cont][1]=$laRow['nombredospar'];
					$Fila[$cont][2]=$laRow['apellidounopar'];
					$Fila[$cont][3]=$laRow['apellidodospar'];
					$Fila[$cont][4]=$laRow['cedulapar'];
					$Fila[$cont][5]=$laRow['idparticipante'];
					$Fila[$cont][6]=$laRow['fotoins'];
					$Fila[$cont][7]=$laRow['edad'];
					$Fila[$cont][8]=$laRow['idcurso_participante'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		

		function consultar_participantes_noinscritos()
		{
			$this->conectar();
			$cont=0;

					 $sql="SELECT  nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar, tparticipante.idparticipante,fotoins,(YEAR(CURDATE())-YEAR(fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(fechanacimientopar,5)) as edad 
					FROM  tparticipante,tinscripcion
					WHERE  estatuspar='1' AND tparticipante.idparticipante=tinscripcion.idparticipante AND cedulapar IN 
					(select tp.cedulapar FROM tparticipante AS tp , tcurso, tgrupo  
						WHERE (YEAR(CURDATE())-YEAR(tp.fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(tp.fechanacimientopar,5))  BETWEEN edadmin AND edadmax
						AND idgrupo = tgrupo_idgrupo AND tcurso.idcurso='$this->lcIdcurso')
					AND tparticipante.idparticipante NOT IN (SELECT tparticipante_idparticipante FROM tcurso_tparticipante,tcurso,tasignatura WHERE tcurso_idcurso='$this->lcIdcurso' AND tparticipante_idparticipante=tparticipante.idparticipante AND tasignatura_idasignatura=idasignatura AND estatus='1')
					 ";

				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombreunopar'];
					$Fila[$cont][1]=$laRow['nombredospar'];
					$Fila[$cont][2]=$laRow['apellidounopar'];
					$Fila[$cont][3]=$laRow['apellidodospar'];
					$Fila[$cont][4]=$laRow['cedulapar'];
					$Fila[$cont][5]=$laRow['idparticipante'];
					$Fila[$cont][6]=$laRow['fotoins'];
					$Fila[$cont][7]=$laRow['edad'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participantes_inscritos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT  nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar, tparticipante.idparticipante,fotoins
					FROM  tparticipante,tinscripcion
					WHERE tparticipante.idparticipante  IN (SELECT p.idparticipante FROM tparticipante AS p, tcurso AS c, tcurso_tparticipante, tasignatura
					WHERE idasignatura = tasignatura_idasignatura
					AND tcurso_idcurso = '$this->lcIdcurso'
					AND p.idparticipante = tparticipante_idparticipante AND estatus='1') AND tparticipante.idparticipante=tinscripcion.idparticipante";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombreunopar'];
					$Fila[$cont][1]=$laRow['nombredospar'];
					$Fila[$cont][2]=$laRow['apellidounopar'];
					$Fila[$cont][3]=$laRow['apellidodospar'];
					$Fila[$cont][4]=$laRow['cedulapar'];
					$Fila[$cont][5]=$laRow['idparticipante'];
					$Fila[$cont][6]=$laRow['fotoins'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_participantes_retirados()
		{
			$this->conectar();
			$cont=0;
			$sql="SELECT  nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar, idparticipante  
				FROM  tparticipante
				WHERE idparticipante  IN (SELECT p.idparticipante FROM tparticipante AS p, tcurso AS c, tcurso_tparticipante, tasignatura
				WHERE idasignatura = tasignatura_idasignatura
				AND tcurso_idcurso = '$this->lcIdcurso'
				AND p.idparticipante = tparticipante_idparticipante AND estatus='2')";
			$pcsql=$this->filtro($sql);
			while($laRow=$this->proximo($pcsql))
			{
				$Fila[$cont][0]=$laRow['nombreunopar'];
				$Fila[$cont][1]=$laRow['nombredospar'];
				$Fila[$cont][2]=$laRow['apellidounopar'];
				$Fila[$cont][3]=$laRow['apellidodospar'];
				$Fila[$cont][4]=$laRow['cedulapar'];
				$Fila[$cont][5]=$laRow['idparticipante'];
				$cont++;
			}
			$this->desconectar();
			return $Fila;
		}

		function cursos_disponibles($edad,$idparticipante)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`,nombreasi,idasignatura
					FROM `tcurso`, `tlapso`, `tgrupo`,tasignatura WHERE idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo AND tasignatura_idasignatura=idasignatura AND estatuscur='1' AND $edad>=edadmin AND $edad<=edadmax AND idcurso NOT IN(SELECT tcurso_idcurso FROM tcurso_tparticipante WHERE tparticipante_idparticipante='$idparticipante' AND estatus='1')";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$Fila[$cont][10]=$laRow['idasignatura'];
					$Fila[$cont][11]=$laRow['nombreasi'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function cursos_inscritos($id)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idcurso`, `nombrecur`, `desgripcioncur`
					, `capacidadcur`, `estatuscur`, `tlapso_idlapso`
					, `tgrupo_idgrupo`, `nombrelap`, `nombregru`, `descripciongru`,nombreasi,idasignatura
					FROM `tcurso`, `tlapso`, `tgrupo`,tasignatura,tcurso_tparticipante WHERE tparticipante_idparticipante='$id' AND idcurso=tcurso_idcurso AND estatus='1' AND idlapso = tlapso_idlapso AND idgrupo = tgrupo_idgrupo AND tasignatura_idasignatura=idasignatura AND estatuscur='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idcurso'];
					$Fila[$cont][1]=$laRow['nombrecur'];
					$Fila[$cont][2]=$laRow['desgripcioncur'];
					$Fila[$cont][3]=$laRow['capacidadcur'];
					$Fila[$cont][4]=$laRow['estatuscur'];
					$Fila[$cont][5]=$laRow['tlapso_idlapso'];
					$Fila[$cont][6]=$laRow['tgrupo_idgrupo'];
					$Fila[$cont][7]=$laRow['nombrelap'];
					$Fila[$cont][8]=$laRow['nombregru'];
					$Fila[$cont][9]=$laRow['descripciongru'];
					$Fila[$cont][10]=$laRow['idasignatura'];
					$Fila[$cont][11]=$laRow['nombreasi'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function historial_participante($Participante)
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT nombrecur, nombrelap, nombreasi, nombreaul, nombregru 
				FROM tcurso, tlapso, tasignatura, taula,tgrupo 
				WHERE 
				tlapso.idlapso=tlapso_idlapso AND tgrupo.idgrupo = tgrupo_idgrupo 
				AND idasignatura = tasignatura_idasignatura AND idaula = taula_idaula AND idcurso IN
				 (SELECT c.tcurso_idcurso FROM tcurso_tparticipante AS c WHERE tparticipante_idparticipante='$Participante') ORDER BY tlapso_idlapso;";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombrecur'];
					$Fila[$cont][1]=$laRow['nombrelap'];
					$Fila[$cont][2]=$laRow['nombreasi'];
					$Fila[$cont][3]=$laRow['nombreaul'];
					$Fila[$cont][4]=$laRow['nombregru'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_instrumentos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT * FROM `tinstrumento`,tasignatura,tcurso WHERE idcurso='$this->lcIdcurso' AND tcurso.tasignatura_idasignatura=idasignatura AND idasignatura=tinstrumento.tasignatura_idasignatura AND estatusins='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idinstrumento'];
					$Fila[$cont][1]=$laRow['nombreins'];
					$Fila[$cont][2]=$laRow['nombreasi'];
					$Fila[$cont][3]=$laRow['estatusins'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function historial_cursos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT nombrecur, nombrelap, nombreasi, nombreaul, nombregru 
				, 
				(SELECT count(*) FROM tcurso_tparticipante WHERE tcurso_idcurso=idcurso AND estatus='1') AS cantidad_participantes
				,
				(SELECT count(*) FROM tcurso_tparticipante WHERE tcurso_idcurso=idcurso AND estatus='2') AS cantidad_retirados
				FROM tcurso, tlapso, tasignatura, taula,tgrupo 
				WHERE 
				tlapso.idlapso=tlapso_idlapso AND tgrupo.idgrupo = tgrupo_idgrupo 
				AND idasignatura = tasignatura_idasignatura AND idaula = taula_idaula AND idcurso IN
				 (SELECT tc.idcurso FROM tcurso AS tc WHERE tc.tlapso_idlapso='$this->lcLapso' );";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombrecur'];
					$Fila[$cont][1]=$laRow['nombrelap'];
					$Fila[$cont][2]=$laRow['nombreasi'];
					$Fila[$cont][3]=$laRow['nombreaul'];
					$Fila[$cont][4]=$laRow['nombregru'];
					$Fila[$cont][5]=$laRow['cantidad_participantes'];
					$Fila[$cont][6]=$laRow['cantidad_retirados'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function historial_curso()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT nombrecur, nombrelap, nombreasi, nombreaul, nombregru 
				, 
				(SELECT count(*) FROM tcurso_tparticipante WHERE tcurso_idcurso=idcurso AND estatus='1') AS cantidad_participantes
				,
				(SELECT count(*) FROM tcurso_tparticipante WHERE tcurso_idcurso=idcurso AND estatus='2') AS cantidad_retirados
				FROM tcurso, tlapso, tasignatura, taula,tgrupo 
				WHERE 
				tlapso.idlapso=tlapso_idlapso AND tgrupo.idgrupo = tgrupo_idgrupo 
				AND idasignatura = tasignatura_idasignatura AND idaula = taula_idaula AND idcurso IN
				 ('$this->lcIdcurso');";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila['nombrecur']=$laRow['nombrecur'];
					$Fila['nombrelap']=$laRow['nombrelap'];
					$Fila['nombreasi']=$laRow['nombreasi'];
					$Fila['nombreaul']=$laRow['nombreaul'];
					$Fila['nombregru']=$laRow['nombregru'];
					$Fila['cantidad_participantes']=$laRow['cantidad_participantes'];
					$Fila['cantidad_retirados']=$laRow['cantidad_retirados'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}


	}
?>