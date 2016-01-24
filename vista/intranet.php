<?php  
    session_start(); //inicia la session, la cual permite trabajar con la variable $_SESSION
    
    $usuario=(isset($_SESSION['usuario']))?$_SESSION['usuario']:"";//toma el valor que se guarda en la variable usuario que está en la variable $_SESSION
    $prueba=(isset($_SESSION['prueba']))?$_SESSION['prueba']:"";//toma el valor que se guarda en la variable usuario que está en la variable $_SESSION
    $msj=(isset($_SESSION['msj']))?$_SESSION['msj']:"";//toma el valor que se guarda en la variable mensaje que está en la variable $_SESSION
    $vista=(isset($_GET['vista']))?$_GET['vista']:"Panel_inicio";//toma el valor que se guarda en la variable vista que está en la URL.
    $operacion=(isset($_GET['o']))?$_GET['o']:"Navegar";//toma el valor que se guarda en la variable vista que está en la URL.

    if((!$usuario)&&($_prueba==''))  //verifica si existe algún usuario logueado en el arreglo usuario de la variable $_SESSION
    {
        echo '<script>alert("Acceso Denegado! Usted no tiene una sesión iniciada en el sistema.");window.location.href="index.php?vista=acceso_intranet";</script>'; // Si no existe un usuario logeado entonces le mostraŕa un mensaje y lo sacará para el inicio! 
    }
    if($msj)  //verifica si existe algún texto en el arreglo msj de la variable $_SESSION
    {
        echo '<script>alert("'.$msj.'");</script>';// si existia un mensaje este lo imprime mediante 
        unset($_SESSION['msj']);//borra lo que habia en la variable.
    }

    require_once('../clases/clase_rol.php');//Trae el archivo clase_rol.php para instanciarlo
    require_once('../clases/clase_usuario.php');//Trae el archivo clase_usuario.php para instanciarlo
    require_once('../libreria/utilidades.php');//Trae el archivo utilidades.php para luego instanciarlo
    require_once('../clases/clase_bitacora.php');//Trae el archivo utilidades.php para luego instanciarlo
    $lobjRol=new clsRol;//Instancia la clase clsRol en $lobjRol, para poder usar sus metodos y atributos 
    $lobjUtil=new clsUtil;//Instancia la clase clsUtil en $lobjRol, para poder usar sus metodos 
    $lobjBitacora=new clsBitacora;//Instancia la clase clsUtil en $lobjRol, para poder usar sus metodos
    $lobjUsuario=new clsUsuario;//Instancia la clase clsUsuario en $lobjUsuario, para poder usar sus metodos
    $menu='';//Declaro la variable $menu
    $lobjUsuario->set_Usuario($_SESSION['usuario']);
    $tiempo_conexion=$lobjUsuario->consultar_tiempo_conexion(); // 
    $lobjRol->set_Rol($_SESSION['idrol']);//Aquí se envia  mediante un metodo SET a la clase rol el idrol del usuario (que se guardo cuando se logueo en el sistema).
    $laModulos=$lobjRol->consultar_modulos_menu();//Se consultan y se guardan en la variable $laModulos los módulos que tiene asignado el rol del usuario,

    if((!$tiempo_conexion)&&($prueba==''))
    {
        $lobjUsuario->cerrar_accesos_activos();
        session_destroy();
        echo '<script>alert("Acceso Denegado! Usted a superado el tiempo de inactividad en esta conexión.");window.location.href="index.php?vista=acceso_intranet";</script>';

    }
    $Acceso_servicio=false;//Para verificar que el usuario no entre a un servicio que no tiene asignado declaro una variable como false, y luego la cambiaré a true si alguno de los servicios que tiene asignado el usuario es igual a la direccion a la que está entrando.

    for($i=0;$i<count($laModulos);$i++) //Se recorre un ciclo para poder extraer los datos de cada uno de los módulos que tiene asignado el rol
    {
        $g=($k>1)?$g+$k:1;
        // se arma en la variable $menu todo el menu que se le mostrará al usuario
        $menu.='<li class="dropdown">'; 
        $menu.='<a href="#" tabindex="'.$g.'" title="'.$laModulos[$i][1].'" class="dropdown-toggle" data-toggle="dropdown">'.$laModulos[$i][1].'<b class="caret"></b></a>';//Aquí se guar el nombre del módulo y los servicios de este modulo se van a ir anidando a partir de aquí.
        $menu.='<ul class="dropdown-menu">';

        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); // aquí se consultan y guardan en la variable $laServicios los servicios que tiene registrado este módulo.
        for ($k=$g,$j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        { 
             if($laServicios[$j][3]==true && $laServicios[$j][2]=='ayuda/manual_usuario')//Sí el servicio es visible para el menú lo agrega, sino no
            {    
                $k++;
                $menu.='<li><a tabindex="'.$k.'"  title="'.$laServicios[$j][1].'" href="'.$laServicios[$j][2].'.pdf" target="_blank">'.$laServicios[$j][1].'</a></li>'; //aqui se van agregando cada uno de los servicios al menú.
            }
            elseif($laServicios[$j][3]==true && $laServicios[$j][2]=='ayuda/terminos_condiciones')//Sí el servicio es visible para el menú lo agrega, sino no
            {    
                $k++;
                $menu.='<li><a tabindex="'.$k.'"  title="'.$laServicios[$j][1].'" href="'.$laServicios[$j][2].'.pdf" target="_blank">'.$laServicios[$j][1].'</a></li>'; //aqui se van agregando cada uno de los servicios al menú.
            }
             elseif($laServicios[$j][3]==true && $laServicios[$j][2]=='ayuda/normas_procedimientos')//Sí el servicio es visible para el menú lo agrega, sino no
            {    
                $k++;
                $menu.='<li><a tabindex="'.$k.'"  title="'.$laServicios[$j][1].'" href="'.$laServicios[$j][2].'.pdf" target="_blank">'.$laServicios[$j][1].'</a></li>'; //aqui se van agregando cada uno de los servicios al menú.
            }
            elseif($laServicios[$j][3])//Sí el servicio es visible para el menú lo agrega, sino no
            {    
                $k++;
                $menu.='<li><a tabindex="'.$k.'"  title="'.$laServicios[$j][1].'" href="?vista='.$laServicios[$j][2].'">'.$laServicios[$j][1].'</a></li>'; //aqui se van agregando cada uno de los servicios al menú.
            }

            if($vista=="Panel_inicio" || $vista==$laServicios[$j][2])//aquí voy comparando los servicios del usuario con la direccion a la cual a entrado.
            {
                $Acceso_servicio=true;

            }                                
        } 
        $menu.='</ul>'; 
        $menu.='</li>'; //se cierra la construccion del menú
    }
                                    


    $lcReal_ip=$lobjUtil->get_real_ip();//Ejecuta el función get_real_ip para saber la IP de el usuario.
    $lcDireccion=$_SERVER['REQUEST_URI'];//obtiene la direccion en la que se encuentra el usuario
    $ldFecha=date('Y-m-d h:m');//obtiene la fecha actual

    $lobjBitacora->set_Datos($lcDireccion,$ldFecha,$lcReal_ip,$operacion,'-','-','-','','',$_SESSION['usuario'],$vista); //envia los datos a la clase bitacora
    $lnHecho=$lobjBitacora->registrar_bitacora();//registra los datos en la tabla tbitacora.

    if((!$Acceso_servicio)&&($_SESSION['prueba']==''))  //verifica si existe algún usuario logueado en el arreglo usuario de la variable $_SESSION
    {
         if((!$usuario)&&($_prueba==''))  //verifica si existe algún usuario logueado en el arreglo usuario de la variable $_SESSION
        {
            echo '<script>alert("Acceso Denegado! Usted no tiene una sesión iniciada en el sistema.");window.location.href="index.php?vista=acceso_intranet";</script>'; // Si no existe un usuario logeado entonces le mostraŕa un mensaje y lo sacará para el inicio! 
        }
        echo '<script>alert("Acceso Denegado! Usted no tiene el acceso permitido a este servicio del sistema.");window.location.href="intranet.php";</script>'; // Si no tiene asignado el servicio al cual intentó entrar, entonces lo manda al inicio de la intranet.! 
    }
    $lobjUsuario->actualizar_actividad($_SESSION['idacceso']);
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html lang="es" class="no-js"> <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="SHORT ICON" href="../media/img/ico.png" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>CAIDV | Intranet</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="../bootstrap/css/bootstrap<?php echo $_SESSION['prueba'];?>.min.css">
        <style>
            body {
                padding-top: 150px;
                padding-bottom: 40px;
            }

        </style>
        <link rel="stylesheet" href="../bootstrap/css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="../bootstrap/css/main.css">
        <link rel="stylesheet" href="../media/css/style<?php echo $_SESSION['prueba'];?>.css">
        <link href="../libreria/css/datatable/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
        <link href="../libreria/css/formularios.css" rel="stylesheet" type="text/css" />
            <link href="../bootstrap/css/prettify.css" rel="stylesheet">
          <link href="../libreria/datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
          <link href="../media/font-awesome-4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="screen">
        <link href="../libreria/calendar/css/bic_calendar.css" rel="stylesheet">
        <link href="../libreria/intro.js-1.0.0/introjs.css" rel="stylesheet">

        <script>window.jQuery || document.write('<script src="../bootstrap/js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
        <script src="../bootstrap/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

        <script src="../bootstrap/js/vendor/bootstrap.min.js">
        </script>
        <script src="../bootstrap/js/jquery.bootstrap.wizard.js"></script>

        <script src="../bootstrap/js/prettify.js"></script>
        <script src="../libreria/datepicker/js/bootstrap-datepicker.js"></script>
        <script src="../bootstrap/js/plugins.js"></script>
        <script src="../bootstrap/js/main.js"></script>
        <!--Validación-->
        <script type="text/javascript" src="../libreria/validacion/js/lemez_validacion1.1.js"></script>
        <script type="text/javascript" src="../libreria/intro.js-1.0.0/intro.js"></script>
        <!--datatable-->
        <script type="text/javascript" language="javascript" src="../libreria/js/datatable/jquery.dataTables.js"></script>
        <script type="text/javascript">
            $(function () {
                $("[data-toggle='popover']").popover();
            });

        </script>
        <script src="../libreria/mousetrap/mousetrap.min.js"></script>
        <script src="../libreria/calendar/js/bic_calendar.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
    <div class="container">        
        <header class="navbar navbar-fixed-top" style="width: 1100px;
margin: 0 auto;position:absolute">
            <div id="row"  style="height:115px">
                <img style="width:100%; height:50px" title="Logo caidv" src="../media/images/cintillo-caidv.jpg">
                <a href="../vista/intranet.php"><img width="250" height="65" src="../media/images/CAIDV.png"></a>
                <div class="span8 pull-right">
                        <table id="datos_usuario" class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable">
                                <tr>
                                    <?php
                                    if($_SESSION['prueba']!='')
                                    {
                                        echo '<td style="background:#297C90"><h6>M.P.</h6></td>';
                                    }
                                    ?>
                                    <td>
                                        <h6>Usuario: </h6>
                                    </td>
                                    <td style="padding-top:12px;">
                                        <?php echo strtoupper($_SESSION['nombreusu']); ?>
                                    </td>
                                    <td>
                                        <h6>Rol: </h6>
                                    </td>
                                    <td style="padding-top:12px;">
                                        <?php echo strtoupper($_SESSION['nombrerol']); ?>
                                    </td>
                                    <td>
                                        <h6>Clave Caduca: </h6>
                                    </td>
                                    <td style="padding-top:12px;">
                                        <?php echo strtoupper($_SESSION['caduca_clave']); ?> Días
                                    </td>
                                    <td>
                                        <form class="navbar-form" action="../controlador/control_acceso.php" method="POST">
                                            <button type="submit" tabindex="<?php echo $k+1;?>" name="salir" class="btn btn-danger" value="Cerrar Sesión"><i class="fa fa-sign-out"></i> Cerrar Sesión</button>
                                        </form>
                                    </td>
                                </tr>
                        </table>

                </div>
            </div>
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a href="intranet.php"><i class="fa fa-home"></i> Inicio</a></li>
                            <?php
                                echo $menu; //se imprime el menú construido
                            ?>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </header>

        <section class="container-fluid" style="width: 1100px;
margin: 0 auto;">
            
            <div class="span12" style="width: 1100px;margin: 0 auto;display:block;">
                    <?php
                         if(file_exists($vista.'.php')) //verifica el contenido de la variable vista.
                    {
                            include($vista.'.php');// y si exite el archivo que trae este incluirá el cintenido
                    }   
                        
                    ?>
            </div>
            <?php
            if(strtoupper($_SESSION['nombrerol'])=='ADMINISTRADOR')
            {
                ?>
                <div id="modo_prueba" >
                    <p class="vertical" onclick="window.location.href='modo_prueba.php'"><i class="fa fa-cog icono_vertical"></i><?php if($_SESSION['prueba']==''){echo 'Modo Prueba';}else{echo 'Modo Normal';}?></p>
                </div>
                <?php
            }
            ?>
            <footer id="pie" class="col-lg-12 span12 pull-left" >
                <p >&copy; Todos los derechos reservados CAIDV / UPTP "J.J. Montilla" 2014 / 2015 - info.caidv@gmail.com</p>
            </footer>

        </section> <!-- /container -->

    </div> 
    </body>
    <script>
    // single keys
        Mousetrap.bind('ctrl+g', function(){ alert(1); });
        function SoloNumeros(e){
        var tecla = (document.all) ? e.keyCode : e.which;
        if((tecla==8)||(tecla==0))return true;
        patron = /[1234567890]/;
        te = String.fromCharCode(tecla);
        return patron.test(te);
        
    }
    function SoloAlfaNumerico(e){
    var tecla = (document.all) ? e.keyCode : e.which;
    if((tecla==8)||(tecla==0))return true;
    patron = /[A-ZáéíóúÁÉÍÓÚa-zñÑ\s1234567890,.]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}
    </script>
</html>

