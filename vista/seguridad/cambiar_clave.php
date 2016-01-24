<?php
$operacion='cambiar_clave';
$titulo   ='Cambiar clave';
?>       

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <form class="formulario" action="../controlador/control_clave.php" method="POST" name="form_pregunta">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($_SESSION['usuario']);?>" name="tusuario_idusuario" />
        <div class="alert alert -warning">
        <p><i class="fa fa-exclamation-triangle"></i> Debe introducir una contraseña que contenga entre 8 a 20 caracteres y debe contener al menos 1 letra mayúscula, 1 letra minúscula, 1 número y 1 símbolo.</p>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Clave actual <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Clave actual, elegida por ud. o asignada pro el sistema."><i class="fa fa-question" ></i></span></label>
                <input type="password"  name="clave_actual" id="cam_clave_actual" value="" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Clave Nueva <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Clave nueva con la cual podrá acceder al sistema."><i class="fa fa-question" ></i></span></label>
                <input type="password"  name="clave_nueva" id="cam_clave_nueva" value="" required/>
                
            </div>
            <div class="col-lg-6 span6">
                <label>Repita Clave Nueva <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Debe repetir la clave nueva con la cual podrá acceder al sistema."><i class="fa fa-question" ></i></span></label>
                <input type="password"  name="repita_clave_nueva" id="cam_repita_clave_nueva" value="" required/>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar" onclick="return enviar();">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='intranet.php';">
        </div>
    </form>
</div>
<script>
function enviar()
{

    var clave_anterior =  <?php print($_SESSION['clave']);?>;
    var clave_actual = document.getElementById('cam_clave_actual').value;
    var clave_nueva = document.getElementById('cam_clave_nueva').value;
    var clave_nueva_repetir = document.getElementById('cam_repita_clave_nueva').value;

    if(clave_actual!=clave_anterior)
    {
        alert('La clave actual no coincide con su clave.');
        return false;
    }
    else if(clave_nueva!=clave_nueva_repetir)
    {
        alert('La nueva clave no coincide con su repetición');
        return false;
    }
    else
    {
        return true;
    }
}
</script>
<script type="text/javascript">
            $(function(){
            $("#cam_clave_nueva").lemez_aceptar("contraseña");
            $("#cam_repita_clave_nueva").lemez_aceptar("contraseña");
            });
        </script>