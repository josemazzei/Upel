<?php
	session_start();

	if($_SESSION['prueba']=='')
	{
		$_SESSION['prueba']='-prueba';
		$_SESSION['base_datos']='bd_caidv_prueba';
	}
	elseif($_SESSION['prueba']=='-prueba')
	{
		$_SESSION['prueba']='';
		$_SESSION['base_datos']='bd_caidv';
	}

	header('location: intranet.php');
?>