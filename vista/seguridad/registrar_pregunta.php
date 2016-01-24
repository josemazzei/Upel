<?php
include('../clases/clase_configuracion.php');
include('../clases/clase_pregunta.php');
$lobjConfiguracion = NEW clsConfiguracion();
$lobjPregunta = NEW clsPregunta();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjPregunta->set_Usuario($_SESSION['usuario']);
$Datos_Configuracion = $lobjConfiguracion->consultar_configuracion_bitacora();
$Datos_Pregunta     = $lobjPregunta->consultar_preguntas();

if($Datos_Pregunta)
{
    $operacion='editar_pregunta';
    $titulo   ='Editar preguntas de seguridad';
}
else
{
    $operacion='registrar_pregunta';
    $titulo   ='Registrar pregunta de seguridad';
}
?>       

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <form class="formulario" action="../controlador/control_pregunta.php" method="POST" name="form_pregunta">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($_SESSION['usuario']);?>" name="tusuario_idusuario" />
        <input type="hidden" value="<?php print($Datos_Configuracion['nropreguntas']);?>" name="nropreguntas" />
        <?php for($i=0;$i<$Datos_Configuracion['nropreguntas'];$i++)
                {?>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Pregunta <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Pregunta secreta con la que podrá recuperar su cuenta, debe ser personal."><i class="fa fa-question" ></i></span></label>
                <input type="hidden"  name="idpregunta[]" id="cam_idpregunta" value="<?php print($Datos_Pregunta[$i][0]);?>" required/>
                <input type="text" class="span12"  name="pregunta[]" id="cam_pregunta" value="<?php print($Datos_Pregunta[$i][1]);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Respuesta <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Respuesta secreta con la que podrá recuperar su cuenta, debe concordar con la pregunta escogida."><i class="fa fa-question" ></i></span></label>
                <input type="password" class="span12"  name="respuesta[]" id="cam_respuesta" value="<?php print($Datos_Pregunta[$i][2]);?>" required/>
            </div>
        </div>
        <?php }?>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='intranet.php';">
        </div>
    </form>
</div>