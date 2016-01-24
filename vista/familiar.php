<?php
    session_start();
    include('../clases/clase_familiar.php');
    $lobjFamiliar = NEW clsFamiliar();
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $fila=(isset($_GET['f']))?$_GET['f']:"";
     $msj=(isset($_SESSION['msj']))?$_SESSION['msj']:"";
    $lobjFamiliar->set_Familiar($id);
    $Datos_Familiar = $lobjFamiliar->consultar_familiar_bitacora();
    $OnKey='';
    if($Datos_Familiar)
    {
        $operacion='editar_familiar';
        $titulo   ='Consultar familiar';
        $OnKey='readOnly';
    }
    else
    {
        $operacion='registrar_familiar';
        $titulo   ='Registrar familiar';
    }

?>
<html lang="es" class="no-js"> <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="SHORT ICON" href="../media/img/ico.png" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>CAIDV | Intranet</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="../bootstrap/css/main.css">
        <link rel="stylesheet" href="../media/css/style.css">
        <link href="../libreria/css/datatable/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
        <link href="../libreria/css/formularios.css" rel="stylesheet" type="text/css" />
        <link href="../libreria/datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
        <script src="../bootstrap/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../bootstrap/js/vendor/jquery-1.10.1.min.js"><\/script>')</script>

        <script src="../bootstrap/js/vendor/bootstrap.min.js"></script>
        <script src="../libreria/datepicker/js/bootstrap-datepicker.js"></script>
        <script src="../bootstrap/js/plugins.js"></script>
        <script src="../bootstrap/js/main.js"></script>

        <script type="text/javascript" language="javascript" src="../libreria/js/datatable/jquery.dataTables.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
                    <div class="container">        
                        <header class="navbar navbar-fixed-top" style="
                margin: 0 auto;position:absolute">
                            <div id="row"  style="height:115px">
                                <img style="width:100%; height:50px" src="../media/images/cintillo-caidv.jpg">
                                <a href="../vista/intranet.php"><img width="250" height="65" src="../media/images/CAIDV.png"></a>
                            </div>
                            <div class="navbar-inner">
                                <div class="container">
                                   

                                </div>
                            </div>
                        </header>

                        <section class="container-fluid">
                            
                            <script>
                             function buscar(id)
                             {
                                window.location.href="?vista=persona/registrar_familiar&id="+id;
                             }
                              function eliminar(id)
                              {
                                 if(confirm("¿Esta seguro que desea eliminar el familiar seleccionado?"))
                                {
                                  document.getElementById("cam_idfamiliar").value=id;
                                  document.form_familiar.submit();
                                }
                              }
                            </script>
                            <script type="text/javascript" charset="utf-8">
                                $(document).ready(function() {
                                    oTable = $('#filtro').dataTable({
                                        "bJQueryUI": true,
                                        "sPaginationType": "full_numbers",
                                        "iDisplayLength": 5                    
                                    });
                                } );
                            </script>  
                            <div class="span12" style="margin: 150px auto 0 auto;display:block;">
                            <div style="float: left" class="col-lg-8 span8 pull-left">
                                <h3>Listado de familiares</h3>
                                <form action="../controlador/control_familiar.php" method="POST" name="form_familiar">
                                    <input type="hidden" value="eliminar_familiar" name="operacion" />
                                    <input type="hidden"  name="idfamiliar" id="cam_idfamiliar"/>
                                    <a class="btn btn-success" id="btn_registrar" href="registrar_familiar.php?f=<?php echo $_GET['f'];?>"><i class="icon-plus icon-white"></i> Registrar familiar</a>
                                    <a class="btn btn-danger" onclick="window.close();"  name="btn_regresar" id="btn_registrar" ><i class="icon-remove icon-white"></i> Cerrar Ventana</a>

                                    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
                                        <thead>
                                            <th>Cédula</th><th>Apellido Nombre</th><th>Dirección</th><th>Teléfono</th><th>Acción</th>
                                        </thead>
                                        <tbody>
                                        <?php
                                                require_once('../clases/clase_familiar.php');
                                                $lobjfamiliar=new clsFamiliar;
                                                $lafamiliares=$lobjfamiliar->consultar_familiares();
                                                for($i=0;$i<count($lafamiliares);$i++)
                                                {
                                                    echo '<tr>';
                                                    echo '<td>'.$lafamiliares[$i][0].'</td>';
                                                    echo '<td>'.$lafamiliares[$i][3].' '.$lafamiliares[$i][1].'</td>';
                                                    echo '<td>'.$lafamiliares[$i][7].'</td>';
                                                    echo '<td>'.$lafamiliares[$i][8].'</td>';
                                                    echo '<td><a class="btn btn-info" onclick="';
                                                    echo "traer('".$lafamiliares[$i][0]."','".$lafamiliares[$i][3]." ".$lafamiliares[$i][1]."','".$fila."')";
                                                    echo '"><i class="icon-arrow-left icon-white"></i></a></td>';
                                                    echo '</tr>';
                                                }
                                            ?>
                                            </tbody>
                                    </table>
                                </form>
                                
                            </div>
                            </div>

            <footer style="text-align:center;background: #299042;margin: 0;padding: 0;width: 1100px;color:#fff;font-weight:bold;" class="col-lg-12 span12 pull-left" >
                <p >&copy; Todos los derechos reservados CAIDV <?php echo date('Y');?></p>
            </footer>

        </section> <!-- /container -->

    </div> 
    </body>
</html>
<script type="text/javascript">
    $('#dp3').datepicker();            
    function traer(cedula,nombre,fila)
    {   
        cam_cedulafam=opener.document.getElementById("cam_cedulafam"+fila);
        cam_representantefam=opener.document.getElementById("cam_representantefam"+fila);
        cam_cedulafam.value=cedula;
        cam_representantefam.value=cedula;
        cam_nombrefam=opener.document.getElementById("cam_nombrefam"+fila);
        cam_nombrefam.value=nombre;
        opener.validar_repetido(cam_cedulafam,cam_nombrefam);
        window.close();
    }
</script>