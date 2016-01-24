<?php
$Datos_Usuario = $lobjUsuario->consultar_usuarios();
?>
<script>
 function desbloquear(id)
 {
    document.getElementById('operacion').value='desbloquear_usuario';
    document.getElementById('tusuario_idusuario').value=id;
    if(confirm('¿Desea desbloquear este usuario?'))
    {
        document.form_sistema.submit();
    }
 }
 function bloquear(id)
 {
    document.getElementById('operacion').value='bloquear_usuario';
    document.getElementById('tusuario_idusuario').value=id;
    if(confirm('¿Desea bloquear este usuario?'))
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
    <h3>Bloquear / desbloquear usuario</h3>
    <form class="formulario" action="../controlador/control_pregunta.php" method="POST" name="form_sistema">
        <input type="hidden" value="" name="operacion" id="operacion" />
        <input type="hidden" value="" name="tusuario_idusuario" id="tusuario_idusuario"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Correo</th><th>Cuenta</th><th>Estatus</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    for($i=0;$i<count($Datos_Usuario);$i++)
                    {
                        if($Datos_Usuario[$i]['estatususu'])
                        {
                            $operacion='<a class="btn btn-danger" href="#" title="bloquear" onclick="bloquear('.$Datos_Usuario[$i]['idusuario'].')"><i class="fa fa-lock icon-white"></i></a>';
                            $Datos_Usuario[$i]['estatususu']='<label class="label label-success" title="Activo"><i class="fa fa-unlock"></i> Activo</label>';
                        }
                        elseif(!$Datos_Usuario[$i]['estatususu']) 
                        {
                            $operacion='<a class="btn btn-warning" href="#" title="Desbloquear" onclick="desbloquear('.$Datos_Usuario[$i]['idusuario'].')"><i class="fa fa-unlock icon-white"></i></a>';
                            $Datos_Usuario[$i]['estatususu']='<label class="label label-important" title="Bloqueado"><i class="fa fa-lock"></i> Bloqueado</label>';
                        }
                        echo '<tr>';
                        echo '<td>'.$Datos_Usuario[$i]['cedula'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['nombreusu'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['emailusu'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['idusuario'].'</td>';
                        echo '<td>'.$Datos_Usuario[$i]['estatususu'].'</td>';
                            echo '<td>';
                                echo $operacion;
                           
                            echo "</td>";
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="botonera">
              <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='intranet.php';">
        </div>
    </form>
</div>