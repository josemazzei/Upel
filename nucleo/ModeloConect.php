<?php
include_once('../libreria/constantes.php');
class ModeloConect
{
	private $servidor='Localhost';
	private $usuario='root';
	private $clave='iutep';
	public $bd=BD;
	protected $laRow = array();
	private $con;
	private $res;


	protected function conectar()
	{
		$this->con=mysql_connect($this->servidor,$this->usuario,$this->clave);
		mysql_select_db($this->bd,$this->con);
	}

	protected function desconectar()
	{
		mysql_close($this->con);
	}

	  
	  //FUNCION PROTEGIDA FILTRO DE BUSQUEDA
      protected function filtro($sql)
      {
      	 $lrTb=mysql_query($sql,$this->con) OR die(mysql_error());
      	 return $lrTb;
      }
	  
      //FUNCION PROTEGIDA CIERRAFILTRO DE BUSQUEDA
      protected function cierrafiltro($result)
      {
         mysql_free_result($result);
      }

	protected function ejecutar($sql)
	{
		$this->res=mysql_query($sql,$this->con) or die(mysql_error());
		if (mysql_affected_rows($this->con)==0)
		    return false;
		 return true;
	}

	//FUNCION PROXIMO PARA RECORRER result PROXIMA POSICION DEL ARRAY
      protected function proximo($result)
      {
      	 $laRow=mysql_fetch_array($result);
      	 return $laRow;
      }
      
	  //FUNCION PROTEGIDA NUMERO DE REGISTROS PARA SABER LA CANTIDAD DE REGISTROS EXISTENTES
      protected function num_registros($result)
      {  
 	     $lnRegistros=mysql_num_rows($result);
 	     return $lnRegistros;
      }

	//FUNCION BEGIN
      protected function begin()
	  {
	     mysql_query("BEGIN",$this->con);
	  }
	  
	  //FUNCION COMMIT
	  protected function commit()
	  {
	     mysql_query("COMMIT",$this->con);
	  }
	  
	  //FUNCION ROLLBACK
	  protected function rollback()
	  {
	     mysql_query("ROLLBACK",$this->con);
	  }

	  protected function fecha_bd($pcFecha)
		  {
		  	 return $fecha=date("Y-m-d",strtotime($pcFecha));
		  }

}
?>