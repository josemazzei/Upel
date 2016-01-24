<?php
	require_once('../nucleo/ModeloConect.php');
	class clsGrupoParticipante extends ModeloConect
	{
		private $lcIdcurso;
		private $lcIdParticipante;
		private $lcMotivo;
		private $ldFecha;
		private $lnIdResponsable;

		function set_Idcurso($pcIdcurso)
		{
			$this->lcIdcurso=$pcIdcurso;
		}

		function set_Idparticipante($pcIdparticipante)
		{
			$this->lcIdParticipante=$pcIdparticipante;
		}

		function set_Motivo($pcMotivo)
		{
			$this->lcMotivo=$pcMotivo;
		}

		function set_Fecha($ldFecha)
		{
			$this->ldFecha=$this->fecha_bd($ldFecha);
		}

		function set_IdResponsable($IdResponsable)
		{
			$this->lnIdResponsable=$IdResponsable;
		}

		function registrar_inscripcion()
		{
			$this->conectar();
			$sql="INSERT INTO `tcurso_tparticipante`
			(`tcurso_idcurso`, `tparticipante_idparticipante`,fecha_inscripcion,idresponsable_ing) 
			VALUES ('$this->lcIdcurso','$this->lcIdParticipante','$this->ldFecha','$this->lnIdResponsable')";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}

		function editar_inscripcion()
		{
			$this->conectar();
			$sql="UPDATE `tcurso_tparticipante` SET estatus='2',motivo='$this->lcMotivo',fecha_egreso='$this->ldFecha',idresponsable_egr='$this->lnIdResponsable' WHERE tcurso_idcurso='$this->lcIdcurso' AND idcurso_participante='$this->lcIdParticipante' ";
			$lnHecho=$this->ejecutar($sql);			
			$this->desconectar();
			return $lnHecho;
		}


	}
?>