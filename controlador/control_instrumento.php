<?php
	session_start();
	require_once("../clases/clase_instrumento.php");
	require_once("../clases/clase_bitacora.php");
    require_once('../libreria/utilidades.php');
	$lobjInstrumento=new clsInstrumento;
	$lobjBitacora=new clsBitacora;
	$lobjUtil=new clsUtil;

	$lobjInstrumento->set_Instrumento($_POST['idinstrumento']);
	$lobjInstrumento->set_Nombre($_POST['nombreins']);
	$lobjInstrumento->set_Asignatura($_POST['tasignatura_idasignatura']);
	$lobjInstrumento->set_Item($_POST['item']);
	$lobjInstrumento->set_Espacio($_POST['espacio']);
	$lobjInstrumento->set_Estatus($_POST['estatusins']);

	$lcReal_ip=$lobjUtil->get_real_ip();
    $ldFecha=date('Y-m-d h:m');
	$operacion=$_POST['operacion'];

	switch ($operacion) 
	{
		case 'registrar_instrumento':
			$hecho=$lobjInstrumento->registrar_instrumento();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Registrar','Cargar datos','*','tinstrumento','','',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha registrado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error en el registro';
			}
			//header('location: ../vista/intranet.php?vista=archivo/instrumento');
		break;
		case 'editar_instrumento':
			$hecho=$lobjInstrumento->editar_instrumento();
			if($hecho)
			{
				$_SESSION['msj']='Se ha modificado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se realizarón cambios';
			}
			header('location: ../vista/intranet.php?vista=archivo/instrumento');
		break;
		case 'eliminar_instrumento':
			$hecho=$lobjInstrumento->eliminar_instrumento();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Eliminar',$_POST['razondesactiva'],'estatusasi','tinstrumento','1','0',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha eliminado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='Error al eliminar';
			}
			header('location: ../vista/intranet.php?vista=archivo/instrumento');
		break;
		case 'restaurar_instrumento':
			$hecho=$lobjInstrumento->restaurar_instrumento();
			if($hecho)
			{
				$lobjBitacora->set_Datos($_SERVER['HTTP_REFERER'],$ldFecha,$lcReal_ip,'Restaurar','No sé utiliza','estatusasi','tinstrumento','0','1',$_SESSION['usuario'],$operacion); //envia los datos a la clase bitacora
   				$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.
				$_SESSION['msj']='Se ha restaurado exitosamente';
			}
			else
			{	
				$_SESSION['msj']='No se pudo restaurar';
			}
			header('location: ../vista/intranet.php?vista=archivo/instrumento');
		break;
		case 'cargar_instrumento':
			$laitems=$lobjInstrumento->consultar_items_instrumento();
			if ($laitems) 
			{
				$f=0;
				for ($i=0; $i <count($laitems); $i++) 
				{
					$espacio=($laitems[$i][6]=='mitad')?'6':'12';
					if($laitems[$i][6]=='mitad')
					{
						if($f==0)					
	                    	$items.='<div class="row-fluid" style="margin-bottom:10px;">';
                    }
                    else
                    {
	                    $items.='<div class="row-fluid" style="margin-bottom:10px;">';

                    }

                    $items.='<div class="col-lg-'.$espacio.' span'.$espacio.'">';
                    $items.='<label>'.($i+1).'). '.$laitems[$i][1].' <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="'.$laitems[$i][4].'."><i class="fa fa-question" ></i></span></label>';
                    if($laitems[$i][2]=='text')
                    {
                    	$items.='<input type="hidden" name="'.$i.'_o" value="'.$laitems[$i][0].'" id="cam_'.$laitems[$i][0].'_o"/>';
                    	$items.='<input type="text" name="'.$i.'[]" id="cam_'.$laitems[$i][0].'" class="span12"/>';
                    }
                    elseif($laitems[$i][2]=='textarea')
                    {
                    	$items.='<input type="hidden" name="'.$i.'_o" value="'.$laitems[$i][0].'" id="cam_'.$laitems[$i][0].'_o"/>';
                    	$items.='<textarea name="'.$i.'[]" id="cam_'.$laitems[$i][0].'" class="span12"></textarea>';
                    }
                    elseif($laitems[$i][2]=='select')
                    {
                    	$items.='<input type="hidden" name="'.$i.'_o" value="'.$laitems[$i][0].'" id="cam_'.$laitems[$i][0].'_o"/>';
                    	$items.='<select name="'.$i.'" id="cam_'.$laitems[$i][0].'" class="span12">';
                    	$items.='<option></option>';
                    	for($j=0;$j<count($laitems[$i][5]);$j++)
                    	{
                    		$items.='<option value="'.$laitems[$i][5][$j].'">'.$laitems[$i][5][$j].'</option>';
                    	}
                    	$items.='</select>';
                    }
                    elseif($laitems[$i][2]=='radio')
                    {
                    	$items.='<input type="hidden" name="'.$i.'_o" value="'.$laitems[$i][0].'" id="cam_'.$laitems[$i][0].'_o"/>';
                    	for($j=0;$j<count($laitems[$i][5]);$j++)
                    	{
                    		$items.='<label style="display:inline;margin-left:10px;">'.$laitems[$i][5][$j].'<input type="radio" name="'.$i.'[]" title="'.$laitems[$i][5][$j].'" id="cam_'.$laitems[$i][5][$j].'_'.$j.'"  value="'.$laitems[$i][5][$j].'"></label>';
                    	}
                    }
                    elseif($laitems[$i][2]=='checkbox')
                    {
                    	$items.='<input type="hidden" name="'.$i.'_o" value="'.$laitems[$i][0].'" id="cam_'.$laitems[$i][4].'_o"/>';
                    	for($j=0;$j<count($laitems[$i][5]);$j++)
                    	{
                    		$items.='<label style="display:inline;margin-left:10px;">'.$laitems[$i][5][$j].'<input type="checkbox" name="'.$i.'[]" title="'.$laitems[$i][5][$j].'" id="cam_'.$laitems[$i][5][$j].'_'.$j.'"  value="'.$laitems[$i][5][$j].'"></label>';
                    	}
                    }

                    $items.='</div>';
                    if($laitems[$i][6]=='mitad')
					{
						if($f==0)
	                    {
	                    	$f++;
	                    }
	                    elseif($f==1)
	                    {
	                    	$f=0;
	                    	$items.='</div>';
	                    }

	                }
                    else
                    {
                    	$items.='</div>';

                    }


				}
                echo $items;
			}
			else
				echo '<p>No ha seleccionado un instrumento</p>';
		break;
		default:
			header('location: ../vista/intranet.php?vista=archivo/instrumento');
		break;
	}

?>