<?php
include('../clases/clase_configuracion.php');
$lObjConfiguracion = NEW clsConfiguracion();
$Datos_Configuracion = $lObjConfiguracion->consultar_configuracion_bitacora();

if($Datos_Configuracion)
{
    $operacion='editar_configuracion';
}
else
{
    $operacion='registrar_configuracion';
}
?>
<script type="text/javascript" src="../libreria/tinymce/tinymce.min.js"></script> <!-- TinyMCE -->
<script type="text/javascript">
tinymce.init({
    selector: "textarea",
    entities : "160,nbsp,162,cent,8364,euro,163,pound",
    language : 'es'
 });
</script>
<div class="col-lg-10 span10 pull-left">
    <h3>Configurar sistema</h3>
    <form class="formulario" action="../controlador/control_configuracion.php" method="POST" name="form_sistema">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Configuracion['idconfiguracion']);?>" name="idconfiguracion" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Introducción <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Instroducción de la pagina principal."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="introducion" id="cam_introducion" required><?php print($Datos_Configuracion['introducion']);?></textarea>
            </div>
            <div class="col-lg-6 span6">
                <label>Misión <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Misión de la pagina principal."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="mision" id="cam_mision" required><?php print($Datos_Configuracion['mision']);?></textarea>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Visión <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Visión de la organización."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="vision" id="cam_vision" required><?php print($Datos_Configuracion['vision']);?></textarea>
            </div>
            <div class="col-lg-6 span6">
                <label>Objetivos <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Objetivos de la organización."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="objetivos" id="cam_objetivos" required><?php print($Datos_Configuracion['objetivos']);?></textarea>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Historia <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Reseña Historica de la organización."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="historia" id="cam_historia" required><?php print($Datos_Configuracion['historia']);?></textarea>
            </div>
            <div class="col-lg-6 span6">
                <label>Dirección <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Dirección de la organización."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12" name="direccion" id="cam_direccion" required ><?php print($Datos_Configuracion['direccion']);?></textarea>
            </div>
            
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nro Preguntas <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nro de preguntas que los usuarios deben ingresar para recuperar su contraseña."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="nropreguntas" id="cam_nropreguntas" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Configuracion['nropreguntas']==1){ print('SELECTED');}?> value="1">1</option>
                    <option <?php if($Datos_Configuracion['nropreguntas']==2){ print('SELECTED');}?> value="2">2</option>
                    <option <?php if($Datos_Configuracion['nropreguntas']==3){ print('SELECTED');}?> value="3">3</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Nro Intentos <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nro de intentos permitidos para que los usuarios intenten acceder al sistema antes de que se les bloquee la cuenta."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="nrointentos" id="cam_nrointentos" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Configuracion['nrointentos']==2){ print('SELECTED');}?> value="2">2</option>
                    <option <?php if($Datos_Configuracion['nrointentos']==3){ print('SELECTED');}?> value="3">3</option>
                    <option <?php if($Datos_Configuracion['nrointentos']==4){ print('SELECTED');}?> value="4">4</option>
                    <option <?php if($Datos_Configuracion['nrointentos']==5){ print('SELECTED');}?> value="5">5</option>
                </select>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Caducidad de la clave <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tiempo en el cual caducará la clave."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tiempocaducida" id="cam_tiempocaducida" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Configuracion['tiempocaducida']==30){ print('SELECTED');}?> value="30">30 dias</option>
                    <option <?php if($Datos_Configuracion['tiempocaducida']==60){ print('SELECTED');}?> value="60">60 dias</option>
                    <option <?php if($Datos_Configuracion['tiempocaducida']==90){ print('SELECTED');}?> value="90">90 dias</option>
                    <option <?php if($Datos_Configuracion['tiempocaducida']==120){ print('SELECTED');}?> value="120">120 dias</option>
                    <option <?php if($Datos_Configuracion['tiempocaducida']==150){ print('SELECTED');}?> value="150">150 dias</option>
                    <option <?php if($Datos_Configuracion['tiempocaducida']==180){ print('SELECTED');}?> value="180">180 dias</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Clave predeterminada <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Clave predeterminada para los usuario nuevos."><i class="fa fa-question" ></i></span></label>
                <input class="span12" type="text" name="clavepredeterminada" id="cam_clavepredeterminada" value="<?php print($Datos_Configuracion['clavepredeterminada']);?>" required />
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Periodo Lapso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Los lapsos no pueden ser mayores a 365 días."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tiempolapso" id="cam_tiempolapso" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Configuracion['tiempolapso']==180){ print('SELECTED');}?> value="180">180 dias</option>
                    <option <?php if($Datos_Configuracion['tiempolapso']==210){ print('SELECTED');}?> value="210">210 dias</option>
                    <option <?php if($Datos_Configuracion['tiempolapso']==240){ print('SELECTED');}?> value="240">240 dias</option>
                    <option <?php if($Datos_Configuracion['tiempolapso']==270){ print('SELECTED');}?> value="270">270 dias</option>
                    <option <?php if($Datos_Configuracion['tiempolapso']==365){ print('SELECTED');}?> value="365">365 dias</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Tiempo de conexión <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tiempo máximo sin actividad en la conexión."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tiempoconexion" id="cam_tiempoconexion" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==10){ print('SELECTED');}?> value="10">10 Minutos</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==15){ print('SELECTED');}?> value="15">15 Minutos</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==20){ print('SELECTED');}?> value="20">20 Minutos</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==30){ print('SELECTED');}?> value="30">30 Minutos</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==40){ print('SELECTED');}?> value="40">40 Minutos</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==50){ print('SELECTED');}?> value="50">50 Minutos</option>
                    <option <?php if($Datos_Configuracion['tiempoconexion']==60){ print('SELECTED');}?> value="60">60 Minutos</option>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=sistema/configurar';">
        </div>
    </form>
</div>