<?php
$Datos_Usuario = $lobjUsuario->consultar_bloqueados();

?>
<script>
 function desbloquear(id)
 {
    document.getElementById('tusuario_idusuario').value=id;
    if(confirm('¿Desea desbloquear este usuario?'))
    {
        document.form_sistema.submit();
    }
 }
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script>
<!--datatable-->  
<div class="col-lg-8 span8 pull-left">
    <h3>Desbloquear Usuario</h3>
    <form class="formulario" action="../controlador/control_pregunta.php" method="POST" name="form_sistema">
        <input type="hidden" value="desbloquear_usuario" name="operacion" />
        <input type="hidden" value="" name="tusuario_idusuario" id="tusuario_idusuario"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Correo</th><th>Cuenta</th><th>Estatus</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    for($i=0;$i<count($Datos_Usuario);$i++)
                    {
                        if($Datos_Usuario[$i][4])
                        {
                            $Datos_Usuario[$i][4]='Activo';
                        }
                        elseif(!$Datos_Usuario[$i][4]) 
                        {
                            $Datos_Usuario[$i][4]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$Datos_Usuario[$i][3].'</td>';
                        echo '<td>'.$Datos_Usuario[$i][1].'</td>';
                        echo '<td>'.$Datos_Usuario[$i][2].'</td>';
                        echo '<td>'.$Datos_Usuario[$i][0].'</td>';
                        echo '<td>'.$Datos_Usuario[$i][4].'</td>';
                            echo '<td>';
                                echo '<a class="btn btn-warning" href="#" title="Desbloquear" onclick="desbloquear('.$Datos_Usuario[$i][0].')"><i class="fa fa-unlock icon-white"></i></a> ';
                           
                            echo "</td>";
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="ACEPTAR">
        </div>
    </form>
</div>