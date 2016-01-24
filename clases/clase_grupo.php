<?php
	require_once('../nucleo/ModeloConect.php');
	class clsGrupo extends ModeloConect
	{
		private $lcIdgrupo;
		private $lcNombregru;
		private $lcDescripciongru;
		private $lcEstatusgru;
		private $lcEdadmin;
		private $lcEdadmax;

		function set_Idgrupo($pcIdgrupo)
		{
			$this->lcIdgrupo=$pcIdgrupo;
		}

		function set_Nombregrupo($pcNombreGrupo)
		{
			$this->lcNombregru=$pcNombreGrupo;
		}

		function set_Descripciongrupo($pcDescripciongrupo)
		{
			$this->lcDescripciongru=$pcDescripciongrupo;
		}

		function set_Estatusgru($pcEstatusgrupo)
		{
			$this->lcEstatusgru=$pcEstatusgrupo;
		}

		function set_Edadminima($pcEdadmin)
		{
			$this->lcEdadmin=$pcEdadmin;
		}

		function set_Edadmaxima($pcEdadmax)
		{
			$this->lcEdadmax=$pcEdadmax;
		}

		function consultar_grupo()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idgrupo`, `nombregru`, `descripciongru`, `estatusgru`, `edadmin`, `edadmax` FROM `tgrupo` WHERE idgrupo='$this->lcIdgrupo'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['idgrupo'];
					$Fila[1]=$laRow['nombregru'];
					$Fila[2]=$laRow['descripciongru'];
					$Fila[3]=$laRow['estatusgru'];
					$Fila[4]=$laRow['edadmin'];
					$Fila[5]=$laRow['edadmax'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_grupos_inactivo()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idgrupo`, `nombregru`, `descripciongru`, `estatusgru`, `edadmin`, `edadmax` FROM `tgrupo`";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idgrupo'];
					$Fila[$cont][1]=$laRow['nombregru'];
					$Fila[$cont][2]=$laRow['descripciongru'];
					$Fila[$cont][3]=$laRow['estatusgru'];
					$Fila[$cont][4]=$laRow['edadmin'];
					$Fila[$cont][5]=$laRow['edadmax'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_dependencia()
		{
			$this->conectar();
			$dependencia=false;			
				$sql="SELECT * FROM tcurso WHERE tgrupo_idgrupo='$this->lcIdgrupo'";
				$pcsql=$this->filtro($sql);
				if($laRow=$this->proximo($pcsql))
				{
					$dependencia=true;
				}
			
			$this->desconectar();
			return $dependencia;
		}

		function consultar_grupos()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT `idgrupo`, `nombregru`, `descripciongru`, `estatusgru`, `edadmin`, `edadmax` FROM `tgrupo` WHERE estatusgru='1'";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['idgrupo'];
					$Fila[$cont][1]=$laRow['nombregru'];
					$Fila[$cont][2]=$laRow['descripciongru'];
					$Fila[$cont][3]=$laRow['estatusgru'];
					$Fila[$cont][4]=$laRow['edadmin'];
					$Fila[$cont][5]=$laRow['edadmax'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_aspirantes()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT  edadmin, edadmax, nombregru, count(*) AS cantidad_aspirantes  FROM  tparticipante, tgrupo WHERE estatusgru='1' AND tgrupo.idgrupo='$this->lcIdgrupo' AND cedulapar IN (select tp.cedulapar FROM tparticipante AS tp WHERE (YEAR(CURDATE())-YEAR(tp.fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(tp.fechanacimientopar,5))  BETWEEN edadmin AND edadmax)";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[0]=$laRow['edadmin'];
					$Fila[1]=$laRow['edadmax'];
					$Fila[2]=$laRow['nombregru'];
					$Fila[3]=$laRow['cantidad_aspirantes'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

		function consultar_grupo_bitacora()
		{
			$this->conectar();
				$sql="SELECT `idgrupo`, `nombregru`, `descripciongru`, `estatusgru`, `edadmin`, `edadmax` FROM `tgrupo` WHERE idgrupo='$this->lcIdgrupo'";
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

		function registrar_grupo()
		{
			$this->conectar();
			$sql="INSERT INTO `tgrupo`(`nombregru`, `descripciongru`, `estatusgru`, `edadmin`, `edadmax`) 
				 VALUES (UPPER('$this->lcNombregru'),UPPER('$this->lcDescripciongru'),'1','$this->lcEdadmin','$this->lcEdadmax')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_grupo()
		{
			$this->conectar();
			$sql="UPDATE `tgrupo` 
				SET `nombregru`=UPPER('$this->lcNombregru'),`descripciongru`=UPPER('$this->lcDescripciongru')
				,`edadmin`='$this->lcEdadmin',`edadmax`='$this->lcEdadmax' WHERE idgrupo='$this->lcIdgrupo'";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function eliminar_grupo()
		{
			$this->conectar();
			$sql="UPDATE tgrupo SET estatusgru='0' WHERE idgrupo='$this->lcIdgrupo' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function restaurar_grupo()
		{
			$this->conectar();
			$sql="UPDATE tgrupo SET estatusgru='1' WHERE idgrupo='$this->lcIdgrupo' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function consultar_participantes()
		{
			$this->conectar();
			$cont=0;
				$sql="SELECT  nombreunopar, nombredospar, apellidounopar, apellidodospar, cedulapar  FROM  tparticipante, tgrupo WHERE estatusgru='1' AND tgrupo.idgrupo='$this->lcIdgrupo' AND cedulapar IN (select tp.cedulapar FROM tparticipante AS tp WHERE (YEAR(CURDATE())-YEAR(tp.fechanacimientopar)) - (RIGHT(CURDATE(),5)<RIGHT(tp.fechanacimientopar,5))  BETWEEN edadmin AND edadmax)";
				$pcsql=$this->filtro($sql);
				while($laRow=$this->proximo($pcsql))
				{
					$Fila[$cont][0]=$laRow['nombreunopar'];
					$Fila[$cont][1]=$laRow['nombredospar'];
					$Fila[$cont][2]=$laRow['apellidounopar'];
					$Fila[$cont][3]=$laRow['apellidodospar'];
					$Fila[$cont][4]=$laRow['cedulapar'];
					$cont++;
				}
			
			$this->desconectar();
			return $Fila;
		}

	}
?>