<?php
	session_start();
	define(BD,($_SESSION['base_datos'])?$_SESSION['base_datos']:'bd_caidv');
?>