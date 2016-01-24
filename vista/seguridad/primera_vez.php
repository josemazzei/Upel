<!-- ESTE MODELO DE SEGURIDAD ESTÁ HECHO CON FINES ACADEMICOS, SU DISTRIBUCIÓN ES GRATUITA, CUALQUIER ADAPTACIÓN, MODIFICACIÓN O MEJORA QUE SE HAGA APARTIR DE ESTE CODIGO DEBE SER NOTIFICADA A LA COMUNIDAD DE LA CUAL FUE OBTENIDO Y/0 A SU CREADOR JAVIER MARTÍN AL CORREO RECUPERA.JAVIER@GMAIL.COM -->
<?php
include('../clases/clase_configuracion.php');
include('../clases/clase_pregunta.php');
$lobjConfiguracion = NEW clsConfiguracion();
$lobjPregunta = NEW clsPregunta();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjPregunta->set_Usuario($_SESSION['usuario']);
$Datos_Configuracion = $lobjConfiguracion->consultar_configuracion_bitacora();
$Datos_Pregunta     = $lobjPregunta->consultar_preguntas();

?>       

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Bienvenido</h3>
    <form class="formulario" action="../controlador/control_pregunta.php" method="POST" name="form_pregunta">
        <div class="alert">Su primera vez al sistema, debe Completar sus Preguntas y Respuestas de seguridad y cambiar su Clave de Acceso.</div>
        <input type="hidden" value="primera_vez" name="operacion" />
        <input type="hidden" value="<?php print($_SESSION['usuario']);?>" name="tusuario_idusuario" />
        <input type="hidden" value="<?php print($Datos_Configuracion['nropreguntas']);?>" name="nropreguntas" />
        <?php for($i=0;$i<$Datos_Configuracion['nropreguntas'];$i++)
                {?>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Pregunta <?php echo $i+1?> <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Pregunta de seguridad con la cual podrá recuperar los datos de su cuenta."><i class="fa fa-question" ></i></span></label>
                <input type="hidden" name="idpregunta[]" id="cam_idpregunta" value="<?php print($Datos_Pregunta[$i][0]);?>" required/>
                <input type="text" class="span12"  name="pregunta[]" id="cam_pregunta" value="<?php print($Datos_Pregunta[$i][1]);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Respuesta <?php echo $i+1?> <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Respuesta a la pregunta de seguridad, debe ser una respuesta confidencial."><i class="fa fa-question" ></i></span></label>
                <input type="password" class="span12"  name="respuesta[]" id="cam_respuesta" value="<?php print($Datos_Pregunta[$i][2]);?>" required>
            </div>
        </div>
        <?php }?>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Clave actual <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Clave que fue generada por el sistema."><i class="fa fa-question" ></i></span></label>
                <input type="password" class="span12"   name="clave_actual" id="cam_clave_actual" value="" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Clave Nueva <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Clave con la cual podrá acceder al sistema."><i class="fa fa-question" ></i></span></label>
                <input type="password" class="span12"   name="clave_nueva" id="cam_clave_nueva" value="" required/>
                
            </div>
            <div class="col-lg-6 span6">
                <label>Repita Clave Nueva <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Repetir clave para confirmar que la clave indicada es la correcta."><i class="fa fa-question" ></i></span></label>
                <input type="password" class="span12"  name="repita_clave_nueva" id="cam_repita_clave_nueva" value="" required/>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="ACEPTAR" onclick="return enviar();">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="REGRESAR" onclick="window.location.href='intranet.php';">
        </div>
    </form>
</div>

<script type="text/javascript">
$(function()
{
$("#cam_idpregunta").lemez_aceptar("texto_numero","btn_enviar");
$("#cam_respuesta").lemez_aceptar("texto_numero","btn_enviar");
$("#cam_clave_nueva").lemez_aceptar("contraseña","btn_enviar");
$("#cam_repita_clave_nueva").lemez_aceptar("contraseña","btn_enviar");
});
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