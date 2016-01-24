<?php
	session_start();
	require_once("../clases/clase_slider.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjSlider=new clsSlider;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;	 

	$nombreimagen = (basename($_FILES['imagensli']['name'])) ? basename($_FILES['imagensli']['name']) : "default.jpg";

	$lobjSlider->set_Slider($_POST['idslider']);
	$lobjSlider->set_Titulo($_POST['titulosli']);
	$lobjSlider->set_Texto($_POST['textosli']);
	$lobjSlider->set_Imagen($nombreimagen);
	$lobjSlider->set_Estatus($_POST['estatussli']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_slider':
			$hecho=$lobjSlider->registrar_slider();
			if($hecho)
			{
				$target_path = "../media/img/slider/";
				$target_path = $target_path . basename($_FILES['imagensli']['name']); 
				move_uploaded_file($_FILES['imagensli']['tmp_name'], $target_path);

				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tslider','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			header('location: ../vista/intranet.php?vista=sistema/slider');
		break;
		case 'editar_slider':

			$lasliderAnterior=$lobjSlider->consultar_slider_bitacora();

			$nombreimagen = (basename($_FILES['imagensli']['name'])) ? basename($_FILES['imagensli']['name']) : $_POST['imagensli_ant'];
			$lobjSlider->set_Imagen($nombreimagen);

			$laValorNuevo=$laValorAnterior=$laCampo=array();

			$hecho=$lobjSlider->editar_slider();
			if($hecho)
			{
				$target_path = "../media/img/slider/";
				$target_path = $target_path . basename($_FILES['imagensli']['name']); 
				move_uploaded_file($_FILES['imagensli']['tmp_name'], $target_path);

				$cont=0;
				foreach ($lasliderAnterior as $key2 => $value2) 
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
					$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Modificar','Error en los datos',$laCampo[$i],'tslider',$laValorAnterior[$i],$laValorNuevo[$i],$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
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
			header('location: ../vista/intranet.php?vista=sistema/slider');
		break;
		case 'eliminar_slider':
			$hecho=$lobjSlider->eliminar_slider();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar','No sé utiliza','estatusinst','tslider','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha desactivado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=sistema/slider');
		break;
		case 'restaurar_slider':
			$hecho=$lobjSlider->restaurar_slider();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusinst','tslider','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar el slider';
			}

			header('location: ../vista/intranet.php?vista=sistema/slider');
		break;
		default:
			header('location: ../vista/intranet.php?vista=sistema/slider');
		break;
	}

?>