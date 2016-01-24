<?php
include('../clases/clase_personal.php');
$lobjPersonal = NEW clsPersonal();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjPersonal->set_Personal($id);
$Datos_Personal = $lobjPersonal->consultar_persona_bitacora();
$OnKey='';
if($Datos_Personal)
{
    $lobjUsuario->set_Usuario($Datos_Personal['idpersonal']);
    $Datos_Usuario=$lobjUsuario->consultar_usuario();
    $operacion='editar_personal';
    $titulo   ='Consultar personal';
    $OnKey='readOnly';
}
else
{
    $operacion='registrar_personal';
    $titulo   ='Registrar personal';
}

?> 
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el personal que utilizará el sistema.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_personal.php" method="POST" name="form_personal">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Cédula </label>
                <input type="text" class="span12" maxlength="9"  name="idpersonal" id="cam_idpersonal"  <?php print($OnKey); ?> value="<?php print($Datos_Personal['idpersonal']);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <div style="float:right" id="status"></div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Primer Nombre</label>
                <input type="text" class="span12"  name="nombreunoper" id="cam_nombreunoper" required value="<?php print($Datos_Personal['nombreunoper']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Segundo Nombre </label>
                <input type="text" class="span12"  name="nombredosper" id="cam_nombredosper" value="<?php print($Datos_Personal['nombredosper']);?>"/>
            </div>
        </div> 
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Primer Apellido</label>
                <input type="text" class="span12"  name="apellidounoper" id="cam_apellidounoper" required value="<?php print($Datos_Personal['apellidounoper']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Segundo Apellido </label>
                <input type="text" class="span12"  name="apellidodosper" id="cam_apellidodosper" value="<?php print($Datos_Personal['apellidodosper']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Sexo</label>
                <select name="sexoper" id="cam_sexoper" class="span12" required>
                    <option value="">-</option>
                    <option <?php if($Datos_Personal['sexoper']=="M"){print('SELECTED');}?> value="M">MASCULINO</option>
                    <option <?php if($Datos_Personal['sexoper']=="F"){print('SELECTED');}?> value="F">FEMENINO</option>
                </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha Nacimiento</label>
                <div class="span10 input-append date"  id="dp3" data-date="12-02-2012"  data-date-format="dd-mm-yyyy" data-date-viewmode="years">
                    <input type="text" class="span12"  name="fechanacimientoper" size="16" id="cam_fechanacimientoper" required value="<?php print($Datos_Personal['fechanacimientoper']);?>"/>
                  <span class="add-on"><i class="icon-th"></i></span>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Dirección</label>
                <textarea name="direccionper" id="cam_direccionper" class="span12" required><?php print($Datos_Personal['direccionper']);?></textarea>
            </div>
            <div class="col-lg-6 span6">
                <label>Localidad </label>
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
                            ?><option value="<?php print($laLocalidades[$i][0])?>" <?php if($laLocalidades[$i][0]==$Datos_Participante['tlocalidad_idlocalidad']){print('SELECTED');}?>><?php print($laLocalidades[$i][1])?></option>
                        <?php 
                        } //Fin For?>
                </select>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Teléfono </label>
                <input type="text" class="span12"  name="telefonoper" maxlength="11" id="cam_telefonoper" required value="<?php print($Datos_Personal['telefonoper']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Correo</label>
                <input type="text" class="span12"  name="correoper" maxlength="60" id="cam_correoper" required value="<?php print($Datos_Personal['correoper']);?>"/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Cargo</label>
                <input type="text" class="span12"  name="cargoper" id="cam_cargoper" required value="<?php print($Datos_Personal['cargoper']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Condición Visual</label>
                <select name="tdiagnostico_iddiagnostico" id="cam_tdiagnostico_iddiagnostico" class="span12" required>
                    <option value="">-</option>
                    <?php 
                        include_once('../clases/clase_diagnostico.php');
                        $ObjDiagnostico = new clsDiagnostico();
                        $DatosDiagnostico = $ObjDiagnostico->consultar_diagnosticos();
                        for($i=0;$i<count($DatosDiagnostico);$i++)
                        {

                        ?>
                    <option <?php if($Datos_Personal['tdiagnostico_iddiagnostico']==$DatosDiagnostico[$i][0]){print('SELECTED');}?> value="<?php print($DatosDiagnostico[$i][0]);?>"><?php print($DatosDiagnostico[$i][1]);?></option>
                    <?php 
                        }
                        ?>
                </select>
            </div>
        </div>
        <div class="row-fluid">
            
            <?php
                 include_once('../clases/clase_rol.php');
                 $ObjRol = new clsRol();
                 $DatosRoles = $ObjRol->consultar_roles();
            ?>
            <div class="col-lg-6 span6">
                <label>Rol</label>
                <select name="idrol" id="cam_idrol" class="span12" required>
                    <option value="">-</option>
                    <?php 
                        for($i=0;$i<count($DatosRoles);$i++)
                        {

                        ?>
                    <option <?php if($Datos_Usuario[2]==$DatosRoles[$i][0]){print('SELECTED');}?> value="<?php print($DatosRoles[$i][0]);?>"><?php print($DatosRoles[$i][1]);?></option>
                    <?php 
                        }
                        ?>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar" onclick="return validar();">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=persona/personal';">
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#dp3').datepicker();
    $(function(){
    $("#cam_idpersonal").lemez_aceptar("numero","btn_enviar");
    $("#cam_nombreunoper").lemez_aceptar("texto","btn_enviar");
    $("#cam_nombredosper").lemez_aceptar("texto","btn_enviar");
    $("#cam_apellidounoper").lemez_aceptar("texto","btn_enviar");
    $("#cam_apellidodosper").lemez_aceptar("texto","btn_enviar");
    $("#cam_fechanacimientoper").lemez_aceptar("fecha","btn_enviar");
    $("#cam_direccionper").lemez_aceptar("todo","btn_enviar");
    $("#cam_telefonoper").lemez_aceptar("numero","btn_enviar");
    $("#cam_cargoper").lemez_aceptar("texto","btn_enviar");
    $("#cam_correoper").lemez_aceptar("correo","btn_enviar");
    });

    $("#cam_idpersonal").change(function() { 

    var valor = $("#cam_idpersonal").val();

            $("#status").html('<img src="../media/img/loader.gif" align="absmiddle">&nbsp;Analizando...');

                $.ajax({  
                    type: "POST",  
                    url: "../controlador/control_personal.php",  
                    data: {idpersonal:valor,operacion:"verificar"},  
                    success: function(msg){
                            if(msg == '1')
                            {
                                $("#status").hide();
                                $("#cam_idpersonal").val('');
                                $("#btn_enviar").prop( "disabled", true );
                                alert('Ya existe una persona del personal con esta cedula.');                              
                            }
                            else
                            {
                                $("#status").hide();
                                $("#btn_enviar").prop( "disabled", false );
                                $(this).html(msg);
                            }
                       
                    }
                });
        });

    function validar()
    {
        var fecha_nacimiento = $("#cam_fechanacimientoper").val();
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
        if((edad>=18) && (edad<=90))
        {
            return true;
        }
        else
        {
            alert('El personal es menor de edad o tiene una fecha de nacimiento incorrecta, debe indicar una fecha de nacimiento valida.');
            $("#cam_fechanacimientoper").focus();
            return false;
        }
    }
</script>