<?php
include('../clases/clase_docente.php');
$lobjDocente = NEW clsDocente();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjDocente->set_Docente($id);
$Datos_Docente = $lobjDocente->consultar_docente_bitacora();
$OnKey='';
if($Datos_Docente)
{
    $operacion='editar_docente';
    $titulo   ='Consultar docente';
    $OnKey='readOnly';
}
else
{
    $operacion='registrar_articulocmb';
    $titulo   ='Registrar Consumibles';
}

?>

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá registrar el docente que dictará el curso.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
     <form class="formulario" action="../controlador/control_docente.php" method="POST" name="form_docente">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Seleccione Tipo de Artículo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tipo de Artículo del Artículo Consumible."><i class="fa fa-question" ></i></span></label>
                <select name="nacionalidaddoc" id="cam_nacionalidaddoc">
                    <option value="" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>Seleccione</option>
                    <option value="V" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>Portería</option>
                    <option value="V" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>Mesa</option>
                    <option value="E" <?php if($Datos_Docente['nacionalidaddoc']=="E"){print('SELECTED');}?>>Silla</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Seleccione Marca <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Modelo del Artículo Consumible."><i class="fa fa-question" ></i></span></label>
                <select name="nacionalidaddoc" id="cam_nacionalidaddoc">
                    <option value="" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>Seleccione</option>
                    <option value="V" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>mesaD2</option>
                    <option value="E" <?php if($Datos_Docente['nacionalidaddoc']=="E"){print('SELECTED');}?>>sillaXe2</option>
                    <option value="E" <?php if($Datos_Docente['nacionalidaddoc']=="E"){print('SELECTED');}?>>4561</option>
                </select>
            </div>

        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Seleccione Presentación <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Presentación del Artículo Consumible."><i class="fa fa-question" ></i></span></label>
                <select name="nacionalidaddoc" id="cam_nacionalidaddoc">
                    <option value="" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>Seleccione</option>
                    <option value="V" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>mesaD2</option>
                    <option value="E" <?php if($Datos_Docente['nacionalidaddoc']=="E"){print('SELECTED');}?>>sillaXe2</option>
                    <option value="E" <?php if($Datos_Docente['nacionalidaddoc']=="E"){print('SELECTED');}?>>4561</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Existencia <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Existencia del Artículo Consumible."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="9"  name="iddocente" id="cam_iddocente"  <?php print($OnKey); ?> value="<?php print($Datos_Docente['iddocente']);?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Stock Mínimo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Stock Mínimo del Artículo Consumible."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="9"  name="iddocente" id="cam_iddocente"  <?php print($OnKey); ?> value="<?php print($Datos_Docente['iddocente']);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Stock Máximo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Stock Máximo del Artículo Consumible."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="9"  name="iddocente" id="cam_iddocente"  <?php print($OnKey); ?> value="<?php print($Datos_Docente['iddocente']);?>" required/>
            </div>
        </div>
       
       
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar" onclick="return validar();">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=inv_bienesnacionales/ver_inventario'">
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#dp3').datepicker();
    $(function(){
    $("#cam_iddocente").lemez_aceptar("numero","btn_enviar");
    $("#cam_nombreunodoc").lemez_aceptar("texto","btn_enviar");
    $("#cam_nombredosdoc").lemez_aceptar("texto","btn_enviar");
    $("#cam_apellidounodoc").lemez_aceptar("texto","btn_enviar");
    $("#cam_apellidodosdoc").lemez_aceptar("texto","btn_enviar");
    $("#cam_fechanacimientodoc").lemez_aceptar("fecha","btn_enviar");
    $("#cam_direcciondoc").lemez_aceptar("todo","btn_enviar");
    $("#cam_telefonodoc").lemez_aceptar("numero","btn_enviar");
    $("#cam_titulodoc").lemez_aceptar("texto","btn_enviar");
    });

    function validar()
    {

        var fecha_nacimiento = $("#cam_fechanacimientodoc").val();
        var cedula = $("#cam_iddocente").val();
        var telefono = $("#cam_telefonodoc").val();
        var fechaActual = new Date()
        var diaActual = fechaActual.getDate();
        var mmActual = fechaActual.getMonth() + 1;
        var yyyyActual = fechaActual.getFullYear();
        FechaNac = fecha_nacimiento.split("-");
        var diaCumple = FechaNac[0];
        var mmCumple = FechaNac[1];
        var yyyyCumple = FechaNac[2];
        //retiramos el primer cero de la izquierda
        if (mmCumple.substr(0,1) == 0) {
        mmCumple= mmCumple.substring(1, 2);
        }
        //retiramos el primer cero de la izquierda
        if (diaCumple.substr(0, 1) == 0) {
        diaCumple = diaCumple.substring(1, 2);
        }
        var edad = yyyyActual - yyyyCumple;

        //validamos si el mes de cumpleaños es menor al actual
        //o si el mes de cumpleaños es igual al actual
        //y el dia actual es menor al del nacimiento
        //De ser asi, se resta un año
        if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
        edad--;
        }

         if(cedula.length<7)
        {
            alert('Cédula invalida, debe ingresar una cédula valida.');
            $("#cam_iddocente").focus();
            return false;
        }
        else if(telefono.length<11)
        {
            alert('Telefono invalido, debe ingresar un telefono valido de 11 caracteres.');
            $("#cam_telefonodoc").focus();
            return false;
        }
        else if((edad>=18) && (edad<=90))
        {
            return true;
        }
        else
        {
            alert('El docente es menor de edad o tiene una fecha de nacimiento incorrecta, debe indicar una fecha de nacimiento valida.');
            $("#cam_fechanacimientodoc").focus();
            return false;
        }
    }
</script>