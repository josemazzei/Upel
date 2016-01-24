<?php
$Datos_Usuario = $lobjUsuario->listado_usuarios();

?>
<script>
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script>
<script>
 function consultar(id)
 {
    window.location.href="?vista=seguridad/consultar_claves&id="+id;
 }

</script>
<!--datatable-->  
<div class="col-lg-8 span8 pull-left">
    <h3>Listado de cambios de claves</h3>
    <form class="formulario" action="" name="">
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Usuario</th><th>Apellido Nombre</th><th>Rol</th><th>Ultimo acceso</th><th>Caduca clave</th><th>Estatus</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    for($i=0;$i<count($Datos_Usuario);$i++)
                    {
                        if($Datos_Usuario[$i]['estatususu'])
                        {
                            $Datos_Usuario[$i]['estatususu']='Activo';
                        }
                        elseif(!$Datos_Usuario[$i]['estatususu']) 
                        {
                            $Datos_Usuario[$i]['estatususu']='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$Datos_Usuario[$i]['idusuario'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['nombreusu'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['nombrerol'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['ultimo_acceso'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['caduca_clave'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['estatususu'].'</td>';
                        echo '<td>';
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="consultar(\''.$Datos_Usuario[$i]['idusuario'].'\')"><i class="fa fa-search"></i></a> ';
                           
                            echo "</td>";    
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>