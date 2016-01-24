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
    $operacion='registrar_docente';
    $titulo   ='Registrar docente';
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
                <label>Nacionalidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nacionalidad a la cual pertenece el docente."><i class="fa fa-question" ></i></span></label>
                <select name="nacionalidaddoc" id="cam_nacionalidaddoc">
                    <option value="V" <?php if($Datos_Docente['nacionalidaddoc']=="V"){print('SELECTED');}?>>VENEZOLANO/A</option>
                    <option value="E" <?php if($Datos_Docente['nacionalidaddoc']=="E"){print('SELECTED');}?>>EXTRANJERO/A</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Cédula <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cédula de identidad del docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" maxlength="9"  name="iddocente" id="cam_iddocente"  <?php print($OnKey); ?> value="<?php print($Datos_Docente['iddocente']);?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Primer Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Primer nombre del docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombreunodoc" id="cam_nombreunodoc" required value="<?php print($Datos_Docente['nombreunodoc']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Segundo Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Segundo nombre del docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombredosdoc" id="cam_nombredosdoc" value="<?php print($Datos_Docente['nombredosdoc']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Primer Apellido <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Primer apellido del docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="apellidounodoc" id="cam_apellidounodoc" required value="<?php print($Datos_Docente['apellidounodoc']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Segundo Apellido <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Segundo apellido del docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="apellidodosdoc" id="cam_apellidodosdoc" value="<?php print($Datos_Docente['apellidodosdoc']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Sexo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Sexo del docente."><i class="fa fa-question" ></i></span></label>
                <select name="sexodoc" id="cam_sexodoc" class="span12" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Docente['sexodoc']=="M"){print('SELECTED');}?> value="M">MASCULINO</option>
                    <option <?php if($Datos_Docente['sexodoc']=="F"){print('SELECTED');}?> value="F">FEMENINO</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha Nacimiento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha de nacimiento del docente."><i class="fa fa-question" ></i></span></label>
                <div class="span10 input-append date"  id="dp3" data-date="01-01-1991"  data-date-format="dd-mm-yyyy" data-date-viewmode="years">
                    <input type="text" class="span12"  name="fechanacimientodoc" size="16" id="cam_fechanacimientodoc" required value="<?php print($Datos_Docente['fechanacimientodoc']);?>"/>
                  <span class="add-on"><i class="icon-th"></i></span>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Dirección <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Dirección residencial del docente."><i class="fa fa-question" ></i></span></label>
                <textarea name="direcciondoc" id="cam_direcciondoc" class="span12" required><?php print($Datos_Docente['direcciondoc']);?></textarea>
            </div>
            <div class="col-lg-6 span6">
                <label>Localidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Localidad en la que reside el docente."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tlocalidad_idlocalidad" id="cam_tlocalidad_idlocalidad" required>
                    <option value="">-</option>
                    <?php 
                        require_once('../clases/clase_localidad.php');
                        $lobjLocalidad = new clsLocalidad;
                        $laLocalidades = $lobjLocalidad->consultar_localidades();
                        $tmpvar='';
                        for($i=0;$i<count($laLocalidades);$i++)
                        {
                            if($laLocalidades[$i][4]!=$tmpvar)
                            {
                                if($tmpvar)
                                {
                                    print('</optgroup>');
                                }
                                $tmpvar=$laLocalidades[$i][4];
                                print('<optgroup label="'.$laLocalidades[$i][4].'">');
                            }//Fin IF
                            ?><option value="<?php print($laLocalidades[$i][0])?>" <?php if($laLocalidades[$i][0]==$Datos_Docente['tlocalidad_idlocalidad']){print('SELECTED');}?>><?php print($laLocalidades[$i][1])?></option>
                        <?php 
                        } //Fin For?>
                </select>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Teléfono <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Telefono local o movil del docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="telefonodoc" minlength="11" maxlength="11" id="cam_telefonodoc" required value="<?php print($Datos_Docente['telefonodoc']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Título <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Título que posee el docente."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="titulodoc" id="cam_titulodoc" required value="<?php print($Datos_Docente['titulodoc']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Tipo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tipo de docente."><i class="fa fa-question" ></i></span></label>
                <select name="tipodoc" id="cam_tipodoc" class="span12" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Docente['tipodoc']=="ESPECIALISTA"){print('SELECTED');}?> value="ESPECIALISTA">ESPECIALISTA</option>
                    <option <?php if($Datos_Docente['tipodoc']=="AULA"){print('SELECTED');}?> value="AULA">AULA</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Condición Visual <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Condición visúal del docente."><i class="fa fa-question" ></i></span></label>
                <select name="tdiagnostico_iddiagnostico" id="cam_tdiagnostico_iddiagnostico" class="span12" required>
                    <option value="">-</option>
                    <?php 
                        include_once('../clases/clase_diagnostico.php');
                        $ObjDiagnostico = new clsDiagnostico();
                        $DatosDiagnostico = $ObjDiagnostico->consultar_diagnosticos();
                        for($i=0;$i<count($DatosDiagnostico);$i++)
                        {

                        ?>
                    <option <?php if($Datos_Docente['tdiagnostico_iddiagnostico']==$DatosDiagnostico[$i][0]){print('SELECTED');}?> value="<?php print($DatosDiagnostico[$i][0]);?>"><?php print($DatosDiagnostico[$i][1]);?></option>
                    <?php 
                        }
                        ?>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar" onclick="return validar();">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=persona/docente'">
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