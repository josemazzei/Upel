<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='seguridad/consultar_usuario')
            {
                $consultar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=seguridad/consultar_usuario&id="+id;
 }

</script>
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
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Auditoria de Usuario</h3>
    <form action="../controlador/control_servicio.php" method="POST" name="form_servicio">
        <input type="hidden" value="eliminar_servicio" name="operacion" />
        <input type="hidden"  name="idservicio" id="cam_idservicio"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Usuario</th><th>Nombre</th><th>Rol</th><th>Último Acceso</th><th>Caduca Clave</th><?php if($consultar){echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    $laUsuarios=$lobjUsuario->listado_usuarios();
                    for($i=0;$i<count($laUsuarios);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laUsuarios[$i]['idusuario'].'</td>';
                        echo '<td>'.$laUsuarios[$i]['nombreusu'].'</td>';
                        echo '<td>'.$laUsuarios[$i]['nombrerol'].'</td>';
                        echo '<td>'.$laUsuarios[$i]['ultimo_acceso'].'</td>';
                        echo '<td>'.$laUsuarios[$i]['caduca_clave'].'</td>';
                        if($consultar)
                        {
                            echo '<td><a class="btn btn-info" href="#" onclick="buscar(';
                                echo "'";echo $laUsuarios[$i]['idusuario'];echo "'";echo ')"><i class="icon-search icon-white"></i></a></td>';
                        }
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>