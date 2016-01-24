<?php
  require_once("../clases/clase_acceso.php");
    $lobjAcceso= new clsAcceso;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjUsuario->set_Usuario($id);
    $lobjAcceso->set_Usuario($id);
   $datos_usuario=$lobjUsuario->consultar_datos_usuario();
    $datos_cambios_clave=$lobjUsuario->listado_cambio_clave();

?>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
             "aaSorting": [[ 0, "desc" ]],
            "iDisplayLength": 10                    
        });
    } );
</script>   
<div style="float: left" class="col-lg-10 span10 pull-left">
    <h3>Datos de Usuario</h3>
        <div class="row-fluid">
            <div class="col-lg-12 span12">
                <table  class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable">
                    <tbody>
                        <tr>
                            <th> Usuario: </th>
                            <td> <?php echo $datos_usuario['idusuario'];?></td>
                            <th> Nombre: </th>
                            <td> <?php echo $datos_usuario['nombreusu'];?></td>
                            <th> Rol: </th>
                            <td> <?php echo $datos_usuario['nombrerol'];?></td>
                        </tr>
                        <tr>
                            <th> Último Acceso: </th>
                            <td> <?php echo $datos_usuario['ultimo_acceso'];?></td>
                            <th> Caduca Clave: </th>
                            <td> <?php echo $datos_usuario['caduca_clave'];?></td>
                            <th> Estatus: </th>
                            <td> <?php echo $datos_usuario['estatususu'];?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
        <h3>Listado de accesos</h3>
        <div class="row-fluid">
            <table  class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
                <thead>
                    <th> Id clave: </th>
                    <th> Fecha Inicio: </th>                        
                    <th> Fecha Fin: </th>                        
                    <th> Caducidad: </th>                        
                    <th> Estatus: </th>                        
                </thead>
                <tbody>
                    <?php
                    for($i=0;$i<count($datos_cambios_clave);$i++)
                    {
                        echo '
                        <tr>
                            <td> '.$datos_cambios_clave[$i]['idclave'].'</td>
                            <td> '.$datos_cambios_clave[$i]['fechainiciocla'].'</td>
                            <td> '.$datos_cambios_clave[$i]['fechafincla'].'</td>
                            <td> '.$datos_cambios_clave[$i]['caduca_clave'].'</td>
                            <td> '.$datos_cambios_clave[$i]['estatuscla'].'</td>
                        </tr>
                        ';
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <div class="botonera">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="REGRESAR" onclick="window.location.href='?vista=seguridad/listado_cambio_clave';">
        </div>
            
</div>
