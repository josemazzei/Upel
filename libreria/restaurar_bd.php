<?php
session_start();
$link = mysql_connect('localhost','root','');
mysql_select_db('bd_caidv',$link);
// VALIDAR EL ARCHIVO Y INSERTAR TABLAS EN LA DB
$extension=explode(".",$_FILES['archivo']['name']);
$i=0;
while($extension[$i])
{
	$extension_lista=$extension[$i];
	$i++;
}

if($extension_lista!="sql") exit();
$file_content = file($_FILES['archivo']['tmp_name']);
$query = "";
foreach($file_content as $sql_line){
  if(trim($sql_line) != "" && strpos($sql_line, "--") === false && strpos($sql_line, "CREATE DATABASE") === false && strpos($sql_line, "USE") === false){
    $query .= $sql_line;
    if (substr(rtrim($query), -1) == ';'){
		mysql_query($query);
       $query = "";
    }
  }
 }
 echo "<script languaje='javascript' type='text/javascript'>alert('Se ha restaurado exitosamente la base de datos.');window.open();self.close();</script>";

//------------------------------------------------------------------
?>