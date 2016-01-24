<?php
	session_start();
	require_once("../clases/clase_grupo.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjGrupo=new clsGrupo;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjGrupo->set_Idgrupo($_POST['idgrupo']);
	$lobjGrupo->set_Nombregrupo($_POST['nombregru']);
	$lobjGrupo->set_Descripciongrupo($_POST['descripciongru']);
	$lobjGrupo->set_Estatusgru($_POST['estatusgru']);
	$lobjGrupo->set_Edadminima($_POST['edadmin']);
	$lobjGrupo->set_Edadmaxima($_POST['edadmax']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_grupo':
			$hecho=$lobjGrupo->registrar_grupo();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tgrupo','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
		break;
		case 'editar_grupo':
			$lobjGrupo->set_Idgrupo($_POST['idgrupo']);
			$laGrupoAnterior=$lobjGrupo->consultar_grupo_bitacora();

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjGrupo->editar_grupo();
			if($hecho)
			{
				$cont=0;
				foreach ($laGrupoAnterior as $key2 => $value2) 
				{
					$value = $_POST[$key2];
					if($value)
					{
						if($value!=$value2)
						{
							$laValorNuevo[] = $value;
							$laValorAnterior[] = $value2;
							$laCampo[] 		= $key2;
							$cont++;
						}
					}
				}

				for($i=0;$i<$cont;$i++)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tgrupo',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
	   				$lnHecho=$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
   					if($lnHecho)
					{
						$_SESSION['msj']='Se ha modificado exitosamente';
					}
				}
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
		break;
		case 'eliminar_grupo':
			$hecho=$lobjGrupo->eliminar_grupo();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusgru','tgrupo','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/grupo');
		break;
		case 'restaurar_grupo':
			$hecho=$lobjGrupo->restaurar_grupo();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusgru','tgrupo','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el servicio';
			}
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/grupo');
		break;
	}

	header('location: ../vista/intranet.php?vista=archivo/grupo');
?>