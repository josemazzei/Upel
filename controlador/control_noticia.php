<?php
	session_start();
	require_once("../clases/clase_noticia.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjNoticia=new clsNoticia;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$Texto= addslashes($_POST['textonot']); //Funcion que permite cambiar las comillas simples o dobles.

	$lobjNoticia->set_Noticia($_POST['idnoticia']);
	$lobjNoticia->set_Titulo($_POST['titulonot']);
	$lobjNoticia->set_Texto($Texto);
	$nombreimagen = (basename($_FILES['imagennot']['name'])) ? basename($_FILES['imagennot']['name']) : "default.jpg";
	$lobjNoticia->set_Imagen($nombreimagen);
	$lobjNoticia->set_Fechanot($_POST['fechanot']);
	$lobjNoticia->set_Estatus($_POST['estatusnot']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_noticia':
			$hecho=$lobjNoticia->registrar_noticia();
			if($hecho)
			{
				$target_path = "../media/img/noticia/";
				$target_path = $target_path . basename($_FILES['imagennot']['name']); 
				move_uploaded_file($_FILES['imagennot']['tmp_name'], $target_path);

				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tnoticia','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=sistema/noticia');
		break;
		case 'editar_noticia':
			$lanoticiaAnterior=$lobjNoticia->consultar_noticia_bitacora();
			$nombreimagen = (basename($_FILES['imagennot']['name'])) ? basename($_FILES['imagennot']['name']) : $_POST['imagennot_ant'];
			$lobjNoticia->set_Imagen($nombreimagen);

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjNoticia->editar_noticia();
			$target_path = "../media/img/noticia/";
				$target_path = $target_path . basename($_FILES['imagennot']['name']); 
				move_uploaded_file($_FILES['imagennot']['tmp_name'], $target_path);
			if($hecho)
			{
				$cont=0;
				foreach ($lanoticiaAnterior as $key2 => $value2) 
				{
					$value = $_POST[$key2];
					if($value)
					{
						if($value!=$value2)
						{
							$laValorNuevo[] = $value;
							if($key2=='textonot')
								$value2= addslashes($value2);
							$laValorAnterior[] = $value2;
							$laCampo[] 		= $key2;
							$cont++;
						}
					}
				}

				for($i=0;$i<$cont;$i++)
				{
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tnoticia',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=sistema/noticia');
		break;
		case 'eliminar_noticia':
			$hecho=$lobjNoticia->eliminar_noticia();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusinst','tnoticia','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=sistema/noticia');
		break;
		case 'restaurar_noticia':
			$hecho=$lobjNoticia->restaurar_noticia();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusinst','tnoticia','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar la noticia';
			}

			header('location: ../vista/intranet.php?vista=sistema/noticia');
		break;
		default:
			header('location: ../vista/intranet.php?vista=sistema/noticia');
		break;
	}

?>