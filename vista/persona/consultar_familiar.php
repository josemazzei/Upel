<?php
    session_start();
    include('../clases/clase_familiar.php');
    $lobjFamiliar = NEW clsFamiliar();
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $cedula=(isset($_GET['cedula']))?$_GET['cedula']:"";
    $nombre=(isset($_GET['nombre']))?$_GET['nombre']:"";
    $lobjFamiliar->set_Familiar($id);
    $Datos_Familiar = $lobjFamiliar->consultar_familiar_2();

    if($msj)  //verifica si existe algún texto en el arreglo msj de la variable $_SESSION
    {
        echo '<script>alert("'.$msj.'");</script>';// si existia un mensaje este lo imprime mediante 
        unset($_SESSION['msj']);//borra lo que habia en la variable.
    }
?>
<div style="float: left" class="col-lg-11 span11 pull-left">
        <h3>Consultar Familiar</h3>
        <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el familiar del participante</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
        <form class="formulario" action="../controlador/control_familiar.php" method="POST" name="form_familiar">
            <input type="hidden" value="editar_familiar" name="operacion" />
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Nacionalidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nacionalidad a la cual pertenece el docente."><i class="fa fa-question" ></i></span></label>
                    <select name="nacionalidadfam" id="cam_nacionalidadfam">
                        <option value="V" <?php if($Datos_Familiar['nacionalidadfam']=="V"){print('SELECTED');}?>>VENEZOLANO/A</option>
                        <option value="E" <?php if($Datos_Familiar['nacionalidadfam']=="E"){print('SELECTED');}?>>EXTRANJERO/A</option>
                    </select>
                </div>
                <div class="col-lg-6 span6">
                    <label>Cédula <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cedula del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12" maxlength="8"  name="idfamiliar" id="cam_idfamiliar"  <?php print($OnKey); ?> value="<?php print($Datos_Familiar['idfamiliar']);?>" required/>
                    <div style="float:right" id="status"></div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Primer Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Primer nombre del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  name="nombreunofam" id="cam_nombreunofam" required value="<?php print($Datos_Familiar['nombreunofam']);?>"/>
                </div>
                <div class="col-lg-6 span6">
                    <label>Segundo Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Segundo nombre del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  name="nombredosfam" id="cam_nombredosfam" value="<?php print($Datos_Familiar['nombredosfam']);?>"/>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Primer Apellido <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Primer apellido del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  name="apellidounofam" id="cam_apellidounofam" required value="<?php print($Datos_Familiar['apellidounofam']);?>"/>
                </div>
                <div class="col-lg-6 span6">
                    <label>Segundo Apellido <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Segundo apellido del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  name="apellidodosfam" id="cam_apellidodosfam"  value="<?php print($Datos_Familiar['apellidodosfam']);?>"/>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Sexo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Sexo del familiar."><i class="fa fa-question" ></i></span></label>
                    <select name="sexofam" id="cam_sexofam" class="span12" required>
                        <option value="">-</option>
                        <option <?php if($Datos_Familiar['sexofam']=="M"){print('SELECTED');}?> value="M">MASCULINO</option>
                        <option <?php if($Datos_Familiar['sexofam']=="F"){print('SELECTED');}?> value="F">FEMENINO</option>
                    </select>
                </div>
                <div class="col-lg-6 span6">
                    <label>Fecha Nacimiento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha de nacimiento del familiar."><i class="fa fa-question" ></i></span></label>
                    <div class="span10 input-append date"  id="dp3" data-date="12-02-2012"  data-date-format="dd-mm-yyyy" data-date-viewmode="years">
                        <input type="text" class="span12"  name="fechanacimientofam" size="16" id="cam_fechanacimientofam" required value="<?php print($Datos_Familiar['fechanacimientofam']);?>"/>
                      <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Dirección <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Dirección del familiar."><i class="fa fa-question" ></i></span></label>
                    <textarea name="direccionfam" id="cam_direccionfam" required class="span12"><?php print($Datos_Familiar['direccionfam']);?></textarea>
                </div>
                <div class="col-lg-6 span6">
                    <label>Localidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Localidad en la que vive."><i class="fa fa-question" ></i></span></label>
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
                                ?><option value="<?php print($laLocalidades[$i][0])?>" <?php if($laLocalidades[$i][0]==$Datos_Familiar['tlocalidad_idlocalidad']){print('SELECTED');}?>><?php print($laLocalidades[$i][1])?></option>
                            <?php 
                            } //Fin For?>
                    </select>
                </div>                            
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Teléfono <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Telefono del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12" maxlength="11" name="telefonofam" id="cam_telefonofam" required value="<?php print($Datos_Familiar['telefonofam']);?>"/>
                </div>
                <div class="col-lg-6 span6">
                    <label>Ocupación <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Ocupación del familiar."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  name="ocupacionfam" id="cam_ocupacionfam" required value="<?php print($Datos_Familiar['ocupacionfam']);?>"/>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Grado Instrucción <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Grado de instrucción familiar."><i class="fa fa-question" ></i></span></label>
                    <select class="span12"  name="gradoinstrucfam" id="cam_gradoinstrucfam" required>
                        <option value="">-</option>
                        <option value="PRIMARIA" <?php echo ($Datos_Familiar['gradoinstrucfam']=='PRIMARIA')?'selected':'';?>>PRIMARIA</option>
                        <option value="BACHILLERATO" <?php echo ($Datos_Familiar['gradoinstrucfam']=='BACHILLERATO')?'selected':'';?>>BACHILLERATO</option>
                        <option value="TECNICO MEDIO" <?php echo ($Datos_Familiar['gradoinstrucfam']=='TECNICO MEDIO')?'selected':'';?>>TECNICO MEDIO</option>
                        <option value="TECNICO SUPERIOR" <?php echo ($Datos_Familiar['gradoinstrucfam']=='TECNICO SUPERIOR')?'selected':'';?>>TECNICO SUPERIOR</option>
                        <option value="INGENIERO" <?php echo ($Datos_Familiar['gradoinstrucfam']=='INGENIERO')?'selected':'';?>>INGENIERO</option>
                        <option value="LICENCIADO" <?php echo ($Datos_Familiar['gradoinstrucfam']=='LICENCIADO')?'selected':'';?>>LICENCIADO</option>
                        <option value="MASTER" <?php echo ($Datos_Familiar['gradoinstrucfam']=='MASTER')?'selected':'';?>>MASTER</option>
                        <option value="DOCTORADO" <?php echo ($Datos_Familiar['gradoinstrucfam']=='DOCTORADO')?'selected':'';?>>DOCTORADO</option>
                    </select>
                </div>
                 <div class="col-lg-6 span6">
                    <label>Ingreso Neto <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Ingreso neto del familiar en bolivares."><i class="fa fa-question" ></i></span></label>
                    <input type="text" class="span12"  name="ingresofam" id="cam_ingresofam" required value="<?php print($Datos_Familiar['ingresofam']);?>"/>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-lg-6 span6">
                    <label>Número de Hijos <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cantidad de hijos que tiene familiar."><i class="fa fa-question" ></i></span></label>
                    <select name="numhijofam" id="cam_numhijofam" class="span12" required>
                       <option value="">-</option>
                       <?php
                        for ($i=0; $i < 14; $i++)
                        {
                            $selected=($Datos_Familiar['numhijofam']==$i)?'selected':'';
                            echo '<option value="'.$i.'" '.$selected.'>'.$i.'</option>';
                        }
                       ?>
                    </select>
                </div>
                <div class="col-lg-6 span6">
                    <label>Condición Visual <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Diagnostico del familiar."><i class="fa fa-question" ></i></span></label>
                    <select name="tdiagnostico_iddiagnostico" required id="cam_tdiagnostico_iddiagnostico" class="span12">
                       <option value="">-</option>
                         <?php
                            include_once('../clases/clase_diagnostico.php');
                            $ObjDiagnostico = new clsDiagnostico();
                            $DatosDiagnostico = $ObjDiagnostico->consultar_diagnosticos();
                            for($i=0;$i<count($DatosDiagnostico);$i++)
                            {

                            ?>
                        <option <?php if($Datos_Familiar['tdiagnostico_iddiagnostico']==$DatosDiagnostico[$i][0]){print('SELECTED');}?> value="<?php print($DatosDiagnostico[$i][0]);?>"><?php print($DatosDiagnostico[$i][1]);?></option>
                        <?php 
                            }
                            ?>
                    </select>
                </div>
            </div>
            <div class="botonera">
                <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
                <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=persona/familiar';">
            </div>
        </form>
</div>
<script type="text/javascript">
    $('#dp3').datepicker();

            
    function traer(cedula,nombre,fila)
    {
        cam_cedulafam=opener.document.getElementById("cam_cedulafam"+fila);
        cam_representantefam=opener.document.getElementById("cam_representantefam"+fila);
        cam_cedulafam.value=cedula;
        cam_representantefam.value=cedula;
        cam_nombrefam=opener.document.getElementById("cam_nombrefam"+fila);
        cam_nombrefam.value=nombre;
        opener.validar_repetido(cam_cedulafam,cam_nombrefam);
        window.close();
    }


$(function()
{
$("#cam_idfamiliar").lemez_aceptar("numero","btn_enviar");
$("#cam_nombreunofam").lemez_aceptar("texto","btn_enviar");
$("#cam_nombredosfam").lemez_aceptar("texto","btn_enviar");
$("#cam_apellidounofam").lemez_aceptar("texto","btn_enviar");
$("#cam_apellidodosfam").lemez_aceptar("texto","btn_enviar");
$("#cam_sexofam").lemez_aceptar("texto","btn_enviar");
$("#cam_fechanacimientofam").lemez_aceptar("fecha","btn_enviar");
$("#cam_direccionfam").lemez_aceptar("todo","btn_enviar");
$("#cam_telefonofam").lemez_aceptar("numero","btn_enviar");
$("#cam_ocupacionfam").lemez_aceptar("texto","btn_enviar");
$("#cam_gradoinstrucfam").lemez_aceptar("texto","btn_enviar");
$("#cam_numhijofam").lemez_aceptar("numero","btn_enviar");
$("#cam_ingresofam").lemez_aceptar("numero","btn_enviar");
$("#cam_tdiagnostico_iddiagnostico").lemez_aceptar("numero","btn_enviar");
});

$("#cam_idfamiliar").change(function() { 

    var valor = $("#cam_idfamiliar").val();

            $("#status").html('<img src="../media/img/loader.gif" align="absmiddle">&nbsp;Analizando...');

                $.ajax({  
                    type: "POST",  
                    url: "../controlador/control_familiar.php",  
                    data: {idfamiliar:valor,operacion:"verificar"},  
                    success: function(msg){
                            if(msg == '1')
                            {
                                $("#status").hide();
                                $("#cam_idfamiliar").val('');
                                $("#btn_enviar").prop( "disabled", true );
                                alert('Ya existe un familiar con esta cedula.');                              
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
        var fecha_nacimiento = $("#cam_fechanacimientofam").val();
        var cedula = $("#cam_idfamiliar").val();
        var telefono = $("#cam_telefonofam").val();
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

         if(cedula.length<6)
        {
            alert('Cédula invalida, debe ingresar una cédula valida.');
            $("#cam_idfamiliar").focus();
            return false;
        }
        else if(telefono.length<11)
        {
            alert('Telefono invalido, debe ingresar un telefono valido de 11 caracteres.');
            $("#cam_telefonofam").focus();
            return false;
        }
        else if((edad>=18) && (edad<=90))
        {
            return true;
        }
        else
        {
            alert('El familiar es menor de edad o tiene una fecha de nacimiento incorrecta, debe indicar una fecha de nacimiento valida.');
            $("#cam_fechanacimientofam").focus();
            return false;
        }
    }
</script>