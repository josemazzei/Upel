<?php
	session_start();//inicia la session, la cual permite trabajar con la variable $_SESSION
	require_once('../clases/clase_usuario.php');//Trae el archivo clase_usuario.php para instanciarlo
	require_once('../clases/clase_acceso.php');
	require_once('../clases/clase_configuracion.php');
	require_once('../libreria/utilidades.php');
	$lobjUsuario= new clsUsuario;//Instancia la clase clsUsuario en $lobjUsuario, para poder usar sus metodos y atributos 
	$lobjAcceso= new clsAcceso;
	$lobjConfiguracion= new clsConfiguracion;
	$lobjUtil=new clsUtil;

	$usuario=$_POST['usuario'];//Captura los datos enviados desde el campo USUARIO en la vista del acceso_intranet.php
	$clave=$_POST['clave'];//Captura los datos enviados desde el campo CLAVE en la vista del acceso_intranet.php
	
	$lcReal_ip=$lobjUtil->get_real_ip();

	$lobjUsuario->set_Usuario($usuario);//Envia el dato USUARIO a la clase clsUsuario Mediante el metodo SET_Usuario
	$lobjUsuario->set_Clave($clave);//Envia el dato CLAVE a la clase clsUsuario Mediante el metodo SET_Clave

	$lobjAcceso->set_Ip($lcReal_ip);
	//En esta serie de IF() se intenta determinar desde donde fue accionado o llamado este archivo, si desde el acceso_intranet con el botón ENTRAR o desde la intranet con el botón SALIR.
	if($_POST['entrar'])//Sí el botón ENTRAR es accionado ingresa en la condición.
	{	

		$datosUsuario=$lobjUsuario->login();//Como los datos ya fueron enviados a la clase, el solo tiene que ejecutar la funcion login() de la clase ClsUsuario, para verificar los datos del usuario.
		$lobjAcceso->set_Usuario($usuario); //envia a la clase Acceso el usuario ingresado
		if($datosUsuario[0])// sí los datos del usuario y clave son correctos entonces entra en la condición para verificar otras cosas
		{
			$sesion_activa=$lobjAcceso->consultar_acceso_activo(); // Consulta sí el usuario tienen una sesión activa.
			
				if($datosUsuario[5]=='1') //Sí el usuario está activo entonces entra en la condición
				{
					if($sesion_activa['acceso']) //sí el usuario no tiene una sesión activa entonces entra en la condición para guardar los datos en variables $_SESSION
					{
						$lobjAcceso->set_Exito('1'); // Envia a la clase Acceso que el usuario tuvo acceso al sistema con éxito
						$llAcceso=$lobjUsuario->consultar_primer_acceso(); // verifica sí este es el primer acceso del usuario
						$lobjAcceso->registrar_acceso(); // registra el acceso del usuario en la tabla tacceso
						$idacceso=$lobjAcceso->consultar_acceso(); // trae el id del acceso actual
						$lobjUsuario->eliminar_accesos_fallidos(); // elimina los acceso fallidos anteriores.
						$_SESSION['usuario']=$datosUsuario[0]; //Se guarda el usuario con el cual ingresó.
						$_SESSION['nombrerol']=$datosUsuario[1];//Se guarda el nombre del rol que tiene asignado ese usuario.
						$_SESSION['idrol']=$datosUsuario[2];//Se guarda el ID del rol.
						$_SESSION['nombreusu']=$datosUsuario[3]; // Se guarda el nombre del usuario
						$_SESSION['idacceso']=$idacceso; // Se guarda el id del acceso actual
						$_SESSION['caduca_clave']=$datosUsuario[4]; // se guarda cuando cáduca la clave actual del usuario
						$_SESSION['estatususu']=$datosUsuario[5]; // se guarda el estatus del usuario
						$_SESSION['ultimo_acceso']=$datosUsuario[6]; // se guarda la fecha del ultimo acceso del usuario
						$_SESSION['tiempo']=$datosUsuario[7]; // se guarda cuanto tiempo estuvo conectado el usuario en su ultimo acceso
						$_SESSION['prueba']=''; // se limpia el valor para la navegación en modo de prueba del sistema
						$_SESSION['clave']=$clave; //Se guarda la clave actual del usuario para validarla en caso de que quiera hacer cambio de clave
	    				$lobjUsuario->actualizar_actividad($_SESSION['idacceso']); // se actualiza la actividad del usuario
						$lobjUsuario->cerrar_accesos_activos(); // se cierran todos los accesos activos por el usuario
						require_once('../controlador/start_lapso.php'); //chequea las fechas y estatus de los lapsos académicos actuales, los apertura y/o cierra de ser necesario
						
						if($_SESSION['caduca_clave']<=0)// Sí la clave ha caducado mostrará un mensaje y redireccionará al usuario directamente al cambio de clave.
						{
							$_SESSION['msj']='Bienvenido al sistema '.$datosUsuario[3].'. Su clave a caducado, debe ingresar una nueva.';//Se guarda un mensaje, que posterior mente será borrado.
							header('location: ../vista/intranet.php?vista=seguridad/cambiar_clave');//Y se redirecciona al archivo intranet.php
							
						}
						else if(!$llAcceso) // Sí no es su primer acceso le dará un mensaje de bienvenida y lo llevará directamente al inicio de la intranet.
						{
							$_SESSION['msj']='Bienvenido al sistema '.$datosUsuario[3].'.';//Se guarda un mensaje, que posterior mente será borrado.
							header('location: ../vista/intranet.php');//Y se redirecciona al archivo intranet.php
						}
						else // Sí es la primera vez que el usuario accede al sistema le mostrará un mensaje de bienvenida con una serie de indicaciones y lo redireccionará a una vista especial
						{
							$_SESSION['msj']='Bienvenido al sistema '.$datosUsuario[3].'. Como es tu primera vez en el sistema debes ingresar tus preguntas de seguridad y colocar tu clave.';//Se guarda un mensaje, que posterior mente será borrado.
							header('location: ../vista/intranet.php?vista=seguridad/primera_vez');//Y se redirecciona al archivo intranet.php
						}
					}
					else //sí el usuario tiene una sesión activa entonces entrará aquí
					{
						if($sesion_activa['ipacc']==$lcReal_ip)//sí la dirección ip de la cual está accediendo el usuario es igual a la del sesión activa entonces entrará aquí
						{
							$lobjAcceso->set_Exito('1');
							$llAcceso=$lobjUsuario->consultar_primer_acceso();
							$lobjAcceso->registrar_acceso();
							$idacceso=$lobjAcceso->consultar_acceso();
							$lobjUsuario->eliminar_accesos_fallidos();
							$_SESSION['usuario']=$datosUsuario[0]; //Se guarda el nombre de usuario con el cual ingresó.
							$_SESSION['nombrerol']=$datosUsuario[1];//Se guarda el nombre del rol que tiene asignado ese usuario.
							$_SESSION['idrol']=$datosUsuario[2];//Se guarda el ID del rol.
							$_SESSION['nombreusu']=$datosUsuario[3];
							$_SESSION['idacceso']=$idacceso;
							$_SESSION['caduca_clave']=$datosUsuario[4];
							$_SESSION['estatususu']=$datosUsuario[5];
							$_SESSION['ultimo_acceso']=$datosUsuario[6];
							$_SESSION['tiempo']=$datosUsuario[7];
							$_SESSION['prueba']='';
							$_SESSION['clave']=$clave;
		    				$lobjUsuario->actualizar_actividad($_SESSION['idacceso']);
							$lobjUsuario->cerrar_accesos_activos();
							$_SESSION['msj']='Hemos detectado una sesión activa desde esta misma dirección IP.';
							header('location: ../vista/intranet.php');//Y se redirecciona al archivo intranet.php

						}
						else // sí el usuario con el que intenta acceder al sistema tienen una sesión activa desde otro equipo se le mostrará un mensaje y se redireccionará a acceso_intranet.php
						{
							$_SESSION['msj']='El usuario con el que intenta ingresar está en una sesión activa con otra dirección IP.';
							header('location: ../vista/index.php?vista=acceso_intranet');//Y se redirecciona al archivo index.php					
						}

					}

				}
				elseif ($datosUsuario[5]=='0') //sí la cuenta de usuario está bloqueada se mostrará un mensaje indicando la situación y se redireccionará a acceso_intranet.php
				{
					$_SESSION['msj']='Esta cuenta de usuario está bloqueada actualmente.\n Debe comunicarse con el administrador del sistema para que procesa a desbloquear su cuenta.';
					header('location: ../vista/index.php?vista=acceso_intranet');
				}

		}
		else//Si el usuario no existe o es incorrecto el usuario y/o clave este es sacado del sistema
		{

			$lobjAcceso->set_Exito('0'); 
			$lobjAcceso->registrar_acceso(); //se registra un intento sin éxito de acceso al sistema
			if($datosUsuario=$lobjUsuario->consultar_usuario()) //Sí el usuario ingresado para iniciar sesión existe en el sistema, entonces entra en la condición
			{
					$lobjUsuario->cantidad_intentos(); //actualiza la cantidad de intentos fallidos
					$cantidad_intentos=$lobjUsuario->consultar_accesos_fallidos(); //consulta la cantidad de accesos fallidos del usuario
					$laConfiguracion=$lobjConfiguracion->consultar_configuracion_bitacora(); //consulta la cantidad máxima de accesos fallidos en el sistema
					if($cantidad_intentos<=$laConfiguracion['nrointentos']) // Sí la cantidad de accesos fallidos es menor a las intentos máximos entonces mostrará un mensaje indicando la situación y la cantidad de intentos realizados
					{
						$_SESSION['msj']='El usuario y/o clave que ingresó son incorrectos.\n Intentos '.$cantidad_intentos.'/'.$laConfiguracion['nrointentos'].' .'; //Se guarda un mensaje, que posterior mente será borrado.
					}
					elseif ($cantidad_intentos>$laConfiguracion['nrointentos']) // Sí la cantidad de accesos fallidos es mayor a las intentos máximos entonces mostrará un mensaje indicando la situación
					{
						$lobjUsuario->bloquear_usuario(); // se bloquea el usuario
						$_SESSION['msj']='El usuario y/o clave que ingresó son incorrectos.\n Su cuenta ha sido bloqueada, ya que ha excedido el número de intentos maximos permitidos por el sistema. \n Debe comunicarse con el administrador del sistema para que procesa a desbloquear su cuenta.';
					}
			}
			else //sí el usuario y la clave ingresadas son incorrectas entonces mostrará un mensaje indicandolo
			{
				$_SESSION['msj']='El usuario y/o clave que ingresó son incorrectos.';
			}
			header('location: ../vista/index.php?vista=acceso_intranet');//Y se redirecciona al archivo acceso_intranet.php
		}
		
	}
	elseif($_POST['salir'])// Si el usuario ingresó aquí a traves de la intranet por medio del botón SALIR, entonces entrará en esta condicion.
	{
		$lobjAcceso->set_IdAcceso($_SESSION['idacceso']);
		$lobjAcceso->set_Usuario($_SESSION['usuario']);
		$llHecho=$lobjAcceso->registrar_salida();

		if($llHecho)
		{
			session_destroy();//Desctruye los datos de la sessión que guardamos cuando ENTRÓ en el sistema.
			session_start();//Se crea una session solo para que pueda ser guardado el mensaje de despedida.
			$_SESSION['msj']='Hasta pronto! Su sesión ha sido cerrada.';//Se guarda un mensaje, que posterior mente será borrado.
			header('location: ../index.php');//Y se redirecciona al archivo index.php
		}
		else //Si no entro por ningun botón o hubo un error entonces lo va a sacar.
		{ 
			$_SESSION['msj']='Disculpe ha habido un error al cerrar la sesión.';//Se guarda un mensaje, que posterior mente será borrado.
			header('location: ../vista/intranet.php');//Y se redirecciona al archivo intranet.php
		}
	}
	else //Si no entro por ningun botón o hubo un error entonces lo va a sacar.
	{ 
			$_SESSION['msj']='Disculpe ha habido un error.';//Se guarda un mensaje, que posterior mente será borrado.
			header('location: ../index.php');//Y se redirecciona al archivo index.php
	}
?>