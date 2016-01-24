<?php

include('../clases/clase_inscripcion.php');
include('../clases/clase_participante.php');
include('../clases/clase_familiar.php');
$lobjInscripcion = NEW clsInscripcion();
$lobjParticipante = NEW clsParticipante();
$lobjFamiliar = NEW clsFamiliar();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjParticipante->set_Idparticipante($id);
$lobjInscripcion->set_Idparticipante($id);
$lobjFamiliar->set_Participante($id);

$Datos_Participante = $lobjParticipante->consultar_participante_bitacora();
$Datos_Inscripcion = $lobjInscripcion->consultar_inscripcion_bitacora();
$Datos_Participante_familiar = $lobjFamiliar->consultar_familiar_bitacora();

if($Datos_Participante)
{
    $operacion='editar_inscripcion';
    $titulo   ='Consultar hoja de vida del paricipante';
}
else
{
    $operacion='registrar_inscripcion';
    $titulo   ='Registrar hoja de vida del participante';
}
?>

<div style="float: left" class="col-lg-10 span10 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar la hoja de vida del participante.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form cla
    <form class="formulario" action="../controlador/control_inscripcion.php" method="POST" name="form_participante" enctype="multipart/form-data">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
       <div id="rootwizard">
            <div class="navbar">
              <div class="navbar-inner">
                <div class="container">
                    <ul>
                        <li><a href="#tab1" data-toggle="tab">DATOS DEL PARTICIPANTE</a></li>
                        <li><a href="#tab2" data-toggle="tab">DATOS DEL FAMILIAR</a></li>
                        <li><a href="#tab3" data-toggle="tab">DATOS DE LA INSCRIPCIÓN</a></li>
                    </ul>
                </div>
              </div>
            </div>
             <div class="tab-content">
                <div class="tab-pane" id="tab1">
                    <input type="hidden" value="<?php print($Datos_Participante['idparticipante']);?>" name="idparticipante" />
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Nacionalidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nacionalidad del participante."><i class="fa fa-question" ></i></span></label>
                            <select name="nacionalidadpar" id="cam_nacionalidadpar">
                                <option value="V" <?php if($Datos_Participante['nacionalidadpar']=="V"){print('SELECTED');}?>>VENEZOLANO/A</option>
                                <option value="E" <?php if($Datos_Participante['nacionalidadpar']=="E"){print('SELECTED');}?>>EXTRANJERO/A</option>
                            </select>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Cédula <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cedula del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12" maxlength="8" <?php if($Datos_Participante['nacionalidadpar']=="N"){print('readonly');}?>  name="cedulapar" id="cam_cedulapar" value="<?php print($Datos_Participante['cedulapar']);?>" required/>
                            <div style="float:right" id="status"></div>
                        </div>
                    </div>    
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Primer Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Primer nombre del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="nombreunopar" id="cam_nombreunopar" value="<?php print($Datos_Participante['nombreunopar']);?>" required/>
                            
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Segundo Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Segundo nombre del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="nombredospar" id="cam_nombredospar" value="<?php print($Datos_Participante['nombredospar']);?>"/>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Primer Apellido <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Primer apellido del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="apellidounopar" id="cam_apellidounopar" value="<?php print($Datos_Participante['apellidounopar']);?>" required/>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Segundo Apellido <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Segundo apellido del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="apellidodospar" id="cam_apellidodospar" value="<?php print($Datos_Participante['apellidodospar']);?>"/>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Sexo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Sexo del participante."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">Masculino
                                <input type="radio"   name="sexopar" id="cam_sexopar1" value="M" <?php if($Datos_Participante['sexopar']=='M'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">Femenino
                                <input type="radio"   name="sexopar" id="cam_sexopar2" value="F" <?php if($Datos_Participante['sexopar']=='F'){echo 'checked';}?>  required/>
                            </label>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Teléfono <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Telefono del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12" maxlength="11"  name="telefonopar" id="cam_telefonopar" value="<?php print($Datos_Participante['telefonopar']);?>" required/>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Correo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Correo del participante."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12" name="correopar" id="cam_correopar" value="<?php print($Datos_Participante['correopar']);?>"/>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Fecha Nacimiento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Fecha de nacimiento del participante."><i class="fa fa-question" ></i></span></label>
                            <div class="span10 input-append date"   id="dp3" data-date="12-02-2012"  data-date-format="dd-mm-yyyy" data-date-viewmode="years">
                              <input class="span12" name="fechanacimientopar" id="cam_fechanacimientopar" size="16" value="<?php print($Datos_Participante['fechanacimientopar']);?>" type="text" required>
                              <span class="add-on" ><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Lugar de nacimiento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Localidad donde vive el participante."><i class="fa fa-question" ></i></span></label>
                            <select class="span12" name="tlocalidad_idlugarnacimiento" id="cam_tlocalidad_idlugarnacimiento" required>
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
                                        ?><option value="<?php print($laLocalidades[$i][0])?>" <?php if($laLocalidades[$i][0]==$Datos_Participante['tlocalidad_idlugarnacimiento']){print('SELECTED');}?>><?php print($laLocalidades[$i][1])?></option>
                                    <?php 
                                    } //Fin For?>
                            </select>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Dirección <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Dirección del participante."><i class="fa fa-question" ></i></span></label>
                            <textarea class="span12"  name="direccionpar" id="cam_direccionpar" required><?php print($Datos_Participante['direccionpar']);?></textarea>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Localidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Localidad donde vive el participante."><i class="fa fa-question" ></i></span></label>
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
                        <div class="col-lg-6 span6">
                            <label>Tenencia de la vivienda <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tenencia de la vivienda."><i class="fa fa-question" ></i></span></label>
                           <select type="text" class="span12"  name="viviendapar" id="cam_viviendapar" required>
                                <option value="">-</option>
                                <option value="PROPIA" <?php if($Datos_Participante['viviendapar']=='PROPIA'){ echo 'selected';} ?>>PROPIA</option>
                                <option value="ALQUILADA" <?php if($Datos_Participante['viviendapar']=='ALQUILADA'){ echo 'selected';} ?>>ALQUILADA</option>
                                <option value="INVADIDA" <?php if($Datos_Participante['viviendapar']=='INVADIDA'){ echo 'selected';} ?>>INVADIDA</option>
                                <option value="OTRO" <?php if($Datos_Participante['viviendapar']=='OTRO'){ echo 'selected';} ?>>OTRO</option>
                            </select>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Medio <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Medio en el que vive el participante."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12"  name="medioviviendapar" id="cam_medioviviendapar" required>
                                <option value="">-</option>
                                <option value="RURAL" <?php if($Datos_Participante['medioviviendapar']=='RURAL'){ echo 'selected';} ?>>RURAL</option>
                                <option value="URBANO" <?php if($Datos_Participante['medioviviendapar']=='URBANO'){ echo 'selected';} ?>>URBANO</option>                            
                            </select>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Tipo de construcción <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tipo de construcción de la casa donde vive el participante."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12"  name="tipoconstruccionpar" id="cam_tipoconstruccionpar" required>
                                <option value="">-</option>
                                <option value="INAVI" <?php if($Datos_Participante['tipoconstruccionpar']=='INAVI'){ echo 'selected';} ?>>INAVI</option>
                                <option value="BLOQUES Y ZINC" <?php if($Datos_Participante['tipoconstruccionpar']=='BLOQUES Y ZINC'){ echo 'selected';} ?>>BLOQUES Y ZINC</option>
                                <option value="ADOBE" <?php if($Datos_Participante['tipoconstruccionpar']=='ADOBE'){ echo 'selected';} ?>>ADOBE</option>
                                <option value="BAHAREQUE" <?php if($Datos_Participante['tipoconstruccionpar']=='BAHAREQUE'){ echo 'selected';} ?>>BAHAREQUE</option>
                                <option value="CONSTRUCCIÓN RURAL" <?php if($Datos_Participante['tipoconstruccionpar']=='CONSTRUCCIÓN RURAL'){ echo 'selected';} ?>>CONSTRUCCIÓN RURAL</option>
                                <option value="EN ESTADO DE DETERIORO" <?php if($Datos_Participante['tipoconstruccionpar']=='EN ESTADO DE DETERIORO'){ echo 'selected';} ?>>EN ESTADO DE DETERIORO</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Nº de Hermanos <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Número de hermanos."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12"  name="numerohermanospar" id="cam_numerohermanospar" required>
                                <option value="">-</option>
                                <?php
                                    for ($i=1;$i<=10 ; $i++)
                                    {

                                        echo '<option value="'.$i.'"'; if($Datos_Participante['numerohermanospar']==$i){ echo 'selected';} echo '>'.$i.'</option>';
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Hijo Nº <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Lugar que ocupa entre los hermanos."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12"  name="numhijopar" id="cam_numhijopar" required>
                                <option value="">-</option>
                                <?php
                                    for ($i=1;$i<=10 ; $i++)
                                    {

                                        echo '<option value="'.$i.'"'; if($Datos_Participante['numhijopar']==$i){ echo 'selected';} echo '>'.$i.'</option>';
                                    }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Condición Visual <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Diagnostico general del participante."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12"  name="tdiagnostico_iddiagnostico" id="cam_tdiagnostico_iddiagnostico" required>
                                <option value="">-</option>
                                <?php
                                    require_once('../clases/clase_diagnostico.php');
                                    $lobjDiagnostico= new clsDiagnostico;
                                    $laDiagnosticos=$lobjDiagnostico->consultar_diagnosticos();
                                    for ($i=0; $i <count($laDiagnosticos) ; $i++) 
                                    {
                                         echo '<option value="'.$laDiagnosticos[$i][0].'"'; if($Datos_Participante['tdiagnostico_iddiagnostico']==$laDiagnosticos[$i][0]){ echo 'selected';} echo '>'.$laDiagnosticos[$i][1].'</option>';
                                    }
                                ?>
                            </select>
                        </div>
                         <div class="col-lg-6 span6 hide">
                            <label>Institución <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Institución de la que proviene el participante."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12"  name="tinstitucion_idinstitucion" id="cam_tinstitucion_idinstitucion1" >
                                <option value="">-</option>
                                <?php
                                    require_once('../clases/clase_institucion.php');
                                    $lobjInstitucion= new clsInstitucion;
                                    $laInstituciones=$lobjInstitucion->consultar_instituciones();
                                    for ($i=0; $i <count($laInstituciones) ; $i++) 
                                    {
                                         echo '<option value="'.$laInstituciones[$i][0].'"'; if($Datos_Participante['tinstitucion_idinstitucion']==$laInstituciones[$i][0]){ echo 'selected';} echo '>'.$laInstituciones[$i][1].'</option>';
                                    }
                                ?>
                            </select>                
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Braille <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica si el participante conoce BRAILLE."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"   name="braillepar" id="cam_braillepar1" value="1" <?php if($Datos_Participante['braillepar']=='1'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"   name="braillepar" id="cam_braillepar2" value="0" <?php if($Datos_Participante['braillepar']=='0'){echo 'checked';}?> required/>
                            </label>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Etnia <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica si el participante pertenece a alguna etnia indigena."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"   name="etniapar" id="cam_etniapar1" value="1" <?php if($Datos_Participante['etniapar']=='1'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"   name="etniapar" id="cam_etniapar2" value="0" <?php if($Datos_Participante['etniapar']=='0'){echo 'checked';}?> required/>
                            </label>
                        </div>                        
                    </div>
                </div>
            <!--FIN PARTICIPANTE-->
            <!--INSCRIPCIÓN-->
                <div class="tab-pane" id="tab3">
                    <div class="row-fluid">
                    <div class="col-lg-6 span6">
                        <label>Grado de instrucción <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Grado de instrucción."><i class="fa fa-question" ></i></span></label>
                        <select type="text" class="span12" name="grado_instruccion" id="cam_grado_instruccion" >
                            <option value="">-</option>
                            <option value="Ninguno" <?php echo ($Datos_Inscripcion['grado_instruccion']=='NINGUNO')?'selected':'';?>>Ninguno</option>
                            <option value="Pre-escolar" <?php echo ($Datos_Inscripcion['grado_instruccion']=='PRE-ESCOLAR')?'selected':'';?>>Pre-escolar</option>
                            <option value="Primaria" <?php echo ($Datos_Inscripcion['grado_instruccion']=='PRIMARIA')?'selected':'';?>>Primaria</option>
                            <option value="Bachiller" <?php echo ($Datos_Inscripcion['grado_instruccion']=='BACHILLER')?'selected':'';?>>Bachiller</option>
                            <option value="Técnico Medio" <?php echo ($Datos_Inscripcion['grado_instruccion']=='TÉCNICO MEDIO')?'selected':'';?>>Técnico Medio</option>
                            <option value="TÉCNICO SUPERIOR UNIVERSITARIO" <?php echo ($Datos_Inscripcion['grado_instruccion']=='Técnico Superior Universitario')?'selected':'';?>>Técnico Superior Universitario</option>
                            <option value="LICENCIADO/INGENIERO" <?php echo ($Datos_Inscripcion['grado_instruccion']=='Licenciado/Ingeniero')?'selected':'';?>>Licenciado/Ingeniero</option>
                        </select>
                    </div>
                    <div class="col-lg-6 span6">
                        <label>¿Estudia Actualmente? <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica sí el participante estudia actualmente."><i class="fa fa-question" ></i></span></label>
                        <label style="display:inline;margin-left:20px">SI
                            <input type="radio" name="estudia_actualmente" onclick="desplegar()" value="1" <?php echo ($Datos_Inscripcion['estudia_actualmente']=='1')?'checked':'';?>/>
                        </label>
                         <label style="display:inline;margin-left:30px">NO
                            <input type="radio" name="estudia_actualmente" onclick="ocultar()" value="0" <?php echo ($Datos_Inscripcion['estudia_actualmente']=='0')?'checked':'';?>/>
                        </label>
                    </div>
                </div>
                <div id="estudia" style="display:<?php if($Datos_Inscripcion['tinstitucion_idinstitucion']){echo 'block;';}else{echo 'none;';}?>">
                    <div class="row-fluid" >
                        <div class="col-lg-6 span6">
                             <label>Institución <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Institución de la cual proviene el participante."><i class="fa fa-question" ></i></span></label>
                            <select type="text" class="span12" name="idinstitucion" id="cam_tinstitucion_idinstitucion2" >
                                <option value="">-</option>
                                <?php
                                    require_once('../clases/clase_institucion.php');
                                    $lobjInstitucion= new clsInstitucion;
                                    $laInstituciones=$lobjInstitucion->consultar_instituciones();
                                    for ($i=0; $i <count($laInstituciones) ; $i++) 
                                    {
                                         echo '<option value="'.$laInstituciones[$i][0].'"'; if($Datos_Inscripcion['tinstitucion_idinstitucion']==$laInstituciones[$i][0]){ echo 'selected';} echo '>'.$laInstituciones[$i][1].'</option>';
                                    }
                                ?>
                            </select>    
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Grado <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Grado que cursaba el participante en su anterior institución."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="gradoins" id="cam_gradoins" value="<?php print($Datos_Inscripcion['gradoins']);?>"/>
                            
                        </div>
                    </div>
                    <div class="row-fluid">                    
                        <div class="col-lg-6 span6">
                            <label>Sección <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Sección del grado que cursaba el participante en su anterior institución."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="seccionins" id="cam_seccionins" value="<?php print($Datos_Inscripcion['seccionins']);?>"/>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Turno <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Turno en el cual el participante asistia a clases."><i class="fa fa-question" ></i></span></label>
                            <select class="span12"  name="turno" id="cam_turno" >
                                <option value="">-</option>
                                <option value="MAÑANA" <?php if($Datos_Inscripcion['turno']=='MAÑANA'){ echo 'selected';} ?>>MAÑANA
                                </option>
                                <option value="TARDE" <?php if($Datos_Inscripcion['turno']=='TARDE'){ echo 'selected';} ?>>TARDE
                                </option>
                            </select>
                        </div>
                    </div>
                </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Disponibilidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Horario en el cual el participante le es posible asistir."><i class="fa fa-question" ></i></span></label>
                            <select class="span12"  name="disponibilidadins" id="cam_disponibilidadins" >
                                <option value="">-</option>
                                <option value="MAÑANA" <?php if($Datos_Inscripcion['disponibilidadins']=='MAÑANA'){ echo 'selected';} ?>>MAÑANA
                                </option>
                                <option value="TARDE" <?php if($Datos_Inscripcion['disponibilidadins']=='TARDE'){ echo 'selected';} ?>>TARDE
                                </option>
                            </select>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Días de asistencia <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Días en los cuales el participante le es posible asistir."><i class="fa fa-question" ></i></span></label>
                             <label style="display:inline;margin-left:20px">LU
                                <input type="checkbox"   name="diasasistenciains[]" id="cam_diasasistenciains" value="LU" <?php $checked=''; $diasasistenciains=explode(",",$Datos_Inscripcion['diasasistenciains']); for ($i=0; $i <count($diasasistenciains); $i++){ 
                                    if($diasasistenciains[$i]=='LU')
                                    {
                                        $checked='checked';
                                    }
                                } 
                                echo $checked;?>/>
                            </label>
                             <label style="display:inline;margin-left:20px">MA
                                <input type="checkbox"   name="diasasistenciains[]" id="cam_diasasistenciains" value="MA" <?php $checked=''; $diasasistenciains=explode(",",$Datos_Inscripcion['diasasistenciains']); for($i=0; $i <count($diasasistenciains); $i++){ 
                                    if($diasasistenciains[$i]=='MA')
                                    {
                                        $checked='checked';
                                    }
                                } 
                                echo $checked;?>/>
                            </label>
                            <label style="display:inline;margin-left:20px">MI
                                <input type="checkbox"   name="diasasistenciains[]" id="cam_diasasistenciains" value="MI" <?php $checked=''; $diasasistenciains=explode(",",$Datos_Inscripcion['diasasistenciains']); for($i=0; $i <count($diasasistenciains); $i++){ 
                                    if($diasasistenciains[$i]=='MI')
                                    {
                                        $checked='checked';
                                    }
                                } 
                                echo $checked;?>/>
                            </label>
                            <label style="display:inline;margin-left:20px">JU
                                <input type="checkbox"   name="diasasistenciains[]" id="cam_diasasistenciains" value="JU" <?php $checked=''; $diasasistenciains=explode(",",$Datos_Inscripcion['diasasistenciains']); for($i=0; $i <count($diasasistenciains); $i++){ 
                                    if($diasasistenciains[$i]=='JU')
                                    {
                                        $checked='checked';
                                    }
                                } 
                                echo $checked;?>/>
                            </label>
                            <label style="display:inline;margin-left:20px">VI
                                <input type="checkbox"   name="diasasistenciains[]" id="cam_diasasistenciains" value="VI" <?php $checked=''; $diasasistenciains=explode(",",$Datos_Inscripcion['diasasistenciains']); for($i=0; $i <count($diasasistenciains); $i++){ 
                                    if($diasasistenciains[$i]=='VI')
                                    {
                                        $checked='checked';
                                    }
                                } 
                                echo $checked;?>/>
                            </label>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Observación <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Observación con respecto al participante."><i class="fa fa-question" ></i></span></label>
                            <textarea class="span12"  name="observacionins" id="cam_observacionins" ><?php print($Datos_Inscripcion['observacionins']);?> </textarea>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Foto <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Foto del participante."><i class="fa fa-question" ></i></span></label>
                            <img src="../media/img/participantes/<?php print(($Datos_Inscripcion['fotoins'])?$Datos_Inscripcion['fotoins']:'default.png');?>" width="80px" height="100px" >
                            <input type="file" class="span12"  name="fotoins" id="cam_fotoins" value=""/>
                            <input type="hidden" class="span12"  name="fotoins2" id="cam_fotoins2"  value="<?php echo $Datos_Inscripcion['fotoins'];?>"/>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Partida de Nacimiento <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Si presentó la partida de nacimiento del participante."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"   name="partidanacimientoins" id="cam_partidanacimientoins1" value="1" <?php if($Datos_Inscripcion['partidanacimientoins']=='1'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"   name="partidanacimientoins" id="cam_partidanacimientoins2" value="0" <?php if($Datos_Inscripcion['partidanacimientoins']=='0'){echo 'checked';}?> required/>
                            </label>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Copia de la Cédula <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Si presentó la cedula del participante."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"   name="copiacedulains" id="cam_copiacedulains1" value="1" <?php if($Datos_Inscripcion['copiacedulains']=='1'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"   name="copiacedulains" id="cam_copiacedulains2" value="0" <?php if($Datos_Inscripcion['copiacedulains']=='0'){echo 'checked';}?> required/>
                            </label>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Informe Médico <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Si presentó el informe medico del participante."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"   name="informemedico" id="cam_informemedico1" value="1" <?php if($Datos_Inscripcion['informemedico']=='1'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"   name="informemedico" id="cam_informemedico2" value="0" <?php if($Datos_Inscripcion['informemedico']=='0'){echo 'checked';}?> required/>
                            </label>
                        </div>
                        <div class="col-lg-6 span6">
                            <div class="col-lg-6 span6">
                            <label>Repitiente <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="En caso de que el participante sea un alumno repitiente en otra institución."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"   name="repitienteins" id="cam_repitienteins1" value="1" <?php if($Datos_Inscripcion['repitienteins']=='1'){echo 'checked';}?> required/>
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"   name="repitienteins" id="cam_repitienteins2" value="0" <?php if($Datos_Inscripcion['repitienteins']=='0'){echo 'checked';}?> required/>
                            </label>
                        </div>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Resumen del diagnóstico <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Resumen del diagnostico medico del participante."><i class="fa fa-question" ></i></span></label>
                            <textarea class="span12" rows="4"  name="resumendiagnosticoins" id="cam_resumendiagnosticoins" ><?php print($Datos_Inscripcion['resumendiagnosticoins']);?> </textarea>
                        </div>  
                        <div class="col-lg-6 span6 hide">
                            <label>Motivo de cambio <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Descripción del motivo de cambio del participante."><i class="fa fa-question" ></i></span></label>
                            <textarea class="span12"  name="motivocambioins" id="cam_motivocambioins" ><?php print($Datos_Inscripcion['motivocambioins']);?> </textarea>
                        </div>
                    </div>
                    <div class="row-fluid" id="docente_grado" <?php echo ($Datos_Inscripcion['estudia_actualmente']=='0')?'style="display:none"':'';?>>
                        <div class="col-lg-6 span6">
                            <label>Docente de Grado <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica el docente del grado."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="docente_grado" id="cam_docente_grado" value="<?php print($Datos_Inscripcion['docente_grado']);?>"/>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Teléfono <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica el teléfono del docente del grado."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12" maxlength="11" name="telefono_docente_grado" id="cam_telefono_docente_grado" value="<?php print($Datos_Inscripcion['telefono_docente_grado']);?>"/>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-lg-6 span6">
                            <label>Docente de Aula Integrada <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica el Docente de Aula Integrada."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12"  name="docente_aula_integrada" id="cam_docente_aula_integrada" value="<?php print($Datos_Inscripcion['docente_aula_integrada']);?>"/>
                        </div>
                        <div class="col-lg-6 span6">
                            <label>Teléfono <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica el teléfono del Docente de Aula Integrada."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span12" maxlength="11" name="telefono_docente_aula_integrada" id="cam_telefono_docente_aula_integrada" value="<?php print($Datos_Inscripcion['telefono_docente_aula_integrada']);?>"/>
                        </div>
                    </div>
                    <div class="botonera">
                        <input type="submit" class="btn btn-success" name="btn_enviar" onclick="return validar_vacio();" id="btn_enviar" value="Guardar">
                        <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=persona/participante';">
                    </div>
                </div>
            <!--FIN INSCRIPCIÓN-->
            <!--FAMILIARES-->
            <div class="tab-pane" id="tab2">
                <div class="row-fluid">
                    <table class="col-lg-10 span10" id="detalle">
                        <thead>
                            <th width="70px" align="center">CÉDULA <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="top" data-content="Cedula del familiar."><i class="fa fa-question" ></i></span></th>
                            <th width="20px" align="center"></th>
                            <th width="200px" align="center">NOMBRE Y APELLIDO <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="top" data-content="Nombre y apellido del familiar."><i class="fa fa-question" ></i></span></th>
                            <th width="120px" align="center">PARENTESCO <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="top" data-content="Parentesco del familiar con el participante."><i class="fa fa-question" ></i></span></th>
                            <th width="150px" align="center">REPRESENTANTE <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="top" data-content="Identifica el representante del participante."><i class="fa fa-question" ></i></span></th>
                            <th width="50px" align="center">OPERACIÓN</th>
                        </thead>
                        <tbody id="filas">
                            <tr>
                                <td width="70px">
                                    <input style="width:70px" type="text" name="cedulafam[]" value="<?php print($Datos_Participante_familiar[0]['idfamiliar']);?>" id="cam_cedulafam0"  readonly/>
                                </td>
                                <td>
                                    <button class="btn-mini btn-info" style="margin-bottom:10px" type="button" onclick="ventana('familiar.php?f=0')"><i class="icon-search icon-white"></i></button>
                                </td>
                                 <td width="200px">
                                    <input type="text" style="width:200px" value="<?php print($Datos_Participante_familiar[0]['apellidounofam'].' '.$Datos_Participante_familiar[0]['nombreunofam']);?>" name="nombrefam[]" id="cam_nombrefam0" readonly/>
                                </td>
                                 <td width="120px">
                                    <select  name="parentescofam[]" style="width:120px" onchange="validar_parentesco(this);" id="cam_parentescofam" >
                                        <option value="">-</option>
                                        <?php
                                            require_once('../clases/clase_parentesco.php');
                                            $lobjParentesco= new clsParentesco;
                                            $laParentescos=$lobjParentesco->consultar_parentescos();
                                            for ($i=0; $i <count($laParentescos) ; $i++) 
                                            {
                                                 echo '<option value="'.$laParentescos[$i][0].'"'; if($Datos_Participante_familiar[0]['idparentesco']==$laParentescos[$i][0]){ echo 'selected';} echo '>'.$laParentescos[$i][1].'</option>';
                                            }
                                        ?>
                                    </select>
                                </td>
                                <td width="150px" align="center">
                                    <input type="checkbox" name="representantefam[]" <?php if($Datos_Participante_familiar[0]['representante']=='1'){echo 'checked';}?> onclick="validar_representante(this);" value="<?php print($Datos_Participante_familiar[0]['idfamiliar']);?>" id="cam_representantefam0" />
                                </td>
                                <td  width="50px" align="center">
                                    <button type="button" class="btn btn-success" id="btn_sumar" onclick="agregar()" ><i class="icon-plus"></i></button>
                                </td>
                            </tr>
                            <?php
                                for ($j=1; $j <count($Datos_Participante_familiar) ; $j++)
                                { 
                            ?>
                                <tr>
                                <td width="70px">
                                    <input style="width:70px" type="text" name="cedulafam[]" value="<?php print($Datos_Participante_familiar[$j]['idfamiliar']);?>" id="cam_cedulafam0"  readonly/>
                                </td>
                                <td>
                                    <button class="btn-mini btn-info" style="margin-bottom:10px" type="button" onclick="ventana('familiar.php?f=0')"><i class="icon-search icon-white"></i></button>
                                </td>
                                 <td width="200px">
                                    <input type="text" style="width:200px" value="<?php print($Datos_Participante_familiar[$j]['apellidounofam'].' '.$Datos_Participante_familiar[$j]['nombreunofam']);?>" name="nombrefam[]" id="cam_nombrefam0" readonly/>
                                </td>
                                 <td width="120px">
                                    <select  name="parentescofam[]" style="width:120px" onchange="validar_parentesco(this);" id="cam_parentescofam" >
                                        <option value="">-</option>
                                        <?php
                                            require_once('../clases/clase_parentesco.php');
                                            $lobjParentesco= new clsParentesco;
                                            $laParentescos=$lobjParentesco->consultar_parentescos();
                                            for ($i=0; $i <count($laParentescos) ; $i++) 
                                            {
                                                 echo '<option value="'.$laParentescos[$i][0].'"'; if($Datos_Participante_familiar[$j]['idparentesco']==$laParentescos[$i][0]){ echo 'selected';} echo '>'.$laParentescos[$i][1].'</option>';
                                            }
                                        ?>
                                    </select>
                                </td>
                                <td width="150px" align="center">
                                    <input type="checkbox" name="representantefam[]" <?php if($Datos_Participante_familiar[$j]['representante']=='1'){echo 'checked';}?> onclick="validar_representante(this);" value="<?php print($Datos_Participante_familiar[$j]['idfamiliar']);?>" id="cam_representantefam0" />
                                </td>
                                <td  width="50px" align="center">
                                    <button type="button" class="btn btn-danger" onclick="quitar(this)"><i class="icon-remove"></i></button>
                                </td>
                            </tr>
                            <?php
                                }
                            ?>
                        </tbody>
                    </table>
                    <input type="hidden" name="contador" id="cam_contador" value="1"/>
                </div>
                <div style="margin-top: 20px;" class="row-fluid">
                    <div class="col-lg-3 span3">
                        <label>Ingreso fijo? <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Sí el responsable tiene otro tipo de ingreso."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"  onclick="desplegar_ingreso_fijo()" name="ingresofijomensual" id="cam_ingresomensual1" value="1" <?php if($Datos_Inscripcion['ingresomensual']!=''){echo 'checked';}?> />
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"  onclick="ocultar_ingreso_fijo()"  name="ingresofijomensual" id="cam_ingresomensual2" value="0" <?php if($Datos_Inscripcion['ingresomensual']==''){echo 'checked';}?> />
                            </label>
                    </div>
                    <div id="monto_fijo" class="col-lg-3 span3" style="<?php if($Datos_Inscripcion['ingresomensual']==''){echo 'display:none';}?>">
                        <label>Ingreso Mensual <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica la cantidad ingreso fijo del responsable del grupo familiar."><i class="fa fa-question" ></i></span></label>
                        <input type="text" class="span12"  name="ingresomensual" id="cam_ingresomensual" value="<?php print($Datos_Inscripcion['ingresomensual']);?>"/>
                    </div>
                    <div id="existe_otro_monto" class="col-lg-3 span3" style="<?php if($Datos_Inscripcion['otroingreso']==''){echo 'display:none';}?>">
                        <label>¿Exite otro tipo de ingreso? <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Sí el responsable tiene otro tipo de ingreso."><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"  onclick="desplegar_ingreso_otro()" name="otrotipoingreso" id="cam_otroingreso1" value="1" <?php if($Datos_Inscripcion['otroingreso']!=''){echo 'checked';}?> />
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"  onclick="ocultar_ingreso_otro()"  name="otrotipoingreso" id="cam_otroingreso2" value="0" <?php if($Datos_Inscripcion['otroingreso']==''){echo 'checked';}?> />
                            </label>
                    </div>
                    <div id="otro_monto" class="col-lg-3 span3" style="<?php if($Datos_Inscripcion['otroingreso']==''){echo 'display:none';}?>">
                         <label>Otro Monto <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Indica la cantidad de otro ingreso del responsable del grupo familiar."><i class="fa fa-question" ></i></span></label>
                        <input type="text" class="span12"  name="otroingreso" id="cam_otroingreso" value="<?php print($Datos_Inscripcion['otroingreso']);?>"/>
                    </div>
                </div>
                <div class="row-fluid">
                    <div id="sin_ingreso" class="col-lg-6 span6" <?php if($Datos_Inscripcion['ingresomensual']!=''){echo 'style="display:none"';}?>>
                        <label>Sin ingreso fijo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="En caso de no poseer ingreso fijo, ¿Cómo hace para cubrir las necesidades familiares?."><i class="fa fa-question" ></i></span></label>
                        <textarea class="span12"  name="noingreso" id="cam_noingreso"><?php print($Datos_Inscripcion['noingreso']);?></textarea>
                    </div>
                    <div class="col-lg-6 span6">
                        <label>Colaborar con el CAIDV <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="¿De qué manera esta dispuesto a colaborar con el CAIDV?."><i class="fa fa-question" ></i></span></label>
                        <textarea class="span12"  name="colaborarcaidv" id="cam_noingreso"><?php print($Datos_Inscripcion['colaborarcaidv']);?></textarea>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="col-lg-6 span6">
                        <label>Aprenderia BRAILLE? <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="¿Estaría dispuesto a aprender BRAILLE?"><i class="fa fa-question" ></i></span></label>
                            <label style="display:inline;margin-left:20px">SI
                                <input type="radio"  onclick="desplegar_aprender_braille()" name="aprenderbraille" id="cam_aprenderbraille1" value="1" <?php if($Datos_Inscripcion['aprenderbraille']=='1'){echo 'checked';}?> />
                            </label>
                             <label style="display:inline;margin-left:30px">NO
                                <input type="radio"  onclick="ocultar_aprender_braille()" name="aprenderbraille" id="cam_aprenderbraille2" value="0" <?php if($Datos_Inscripcion['aprenderbraille']=='0'){echo 'checked';}?> />
                            </label>
                    </div>
                    <div id="tiempo_braile" class="col-lg-6 span6"  style="<?php if($Datos_Inscripcion['tiempo']=='' || $Datos_Inscripcion['aprenderbraille']=='0'){echo 'display:none';}?>">
                        <label>¿De que tiempo dispone? <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="¿De que tiempo dispone?."><i class="fa fa-question" ></i></span></label>
                        <textarea class="span12"  name="tiempo" id="cam_tiempo"><?php print($Datos_Inscripcion['tiempo']);?></textarea>
                    </div>
                </div>
            </div>
            <ul class="pager wizard">
                    <li class="salir" ><a href="#" class="btn btn-danger" onclick="window.location.href='?vista=persona/participante';" id="btn_salir"><i class="fa-arrow-left fa"></i> Regresar</a></li>
                    <li class="previous"><a href="#" class="btn btn-danger"  style="display:none;" id="btn_atras" ><i class="fa-arrow-left fa"></i> Atrás</a></li>
                    <li class="next"><a href="#" id="btn_siguiente" class="btn btn-success">Siguiente <i class="fa-arrow-right fa"></i></a></li>
            </ul>
            <!--FIN FAMILIARES-->
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#dp3').datepicker();
</script>
<script type="text/javascript">
function desplegar_ingreso_fijo()
    {
        document.getElementById("monto_fijo").style.display="block";
        document.getElementById("existe_otro_monto").style.display="block";
        document.getElementById("sin_ingreso").style.display="none";

    }
    function ocultar_ingreso_fijo()
    {
        document.getElementById("monto_fijo").style.display="none";
        document.getElementById("existe_otro_monto").style.display="none";
        document.getElementById("otro_monto").style.display="none";
        document.getElementById("sin_ingreso").style.display="block";

    }
function desplegar_ingreso_otro()
    {
        document.getElementById("otro_monto").style.display="block";
    }
    function ocultar_ingreso_otro()
    {
        document.getElementById("otro_monto").style.display="none";
    }

    function desplegar_aprender_braille()
    {
        document.getElementById("tiempo_braile").style.display="block";
    }
    function ocultar_aprender_braille()
    {
        document.getElementById("tiempo_braile").style.display="none";
    }
    function agregar()    
   {     
        var contador=document.getElementById('cam_contador').value;
      contador++;
      var filas = document.getElementById("filas");
      var parentesco = document.getElementById("cam_parentescofam");
      var nueva_fila =document.createElement("tr");
       var select_parentesco = parentesco.cloneNode(true);
      var columna1 =document.createElement("td");
      var columna2 =document.createElement("td");
      var columna3 =document.createElement("td");
      var columna4 =document.createElement("td");
      var columna5 =document.createElement("td");
      var columna6 =document.createElement("td");
      nueva_fila.setAttribute("id", "fila");
      columna1.setAttribute("width", "70px");
      columna3.setAttribute("width", "200px");
      columna4.setAttribute("width", "120px");
      columna5.setAttribute("width", "150px");
      columna6.setAttribute("width", "50px");

      columna3.setAttribute("align", "center");
      columna4.setAttribute("align", "center");
      columna5.setAttribute("align", "center");
      columna6.setAttribute("align", "center");
    
    var direccion="'familiar.php?f="+contador+"'";
      columna1.innerHTML='<input style="width:70px" type="text" name="cedulafam[]" onclick="ventana('+direccion+')"  id="cam_cedulafam'+contador+'" readonly/>';
      columna2.innerHTML='<button class="btn-mini btn-info" style="margin-bottom:10px" type="button" onclick="ventana('+direccion+')"><i class="icon-search icon-white"></i></button>';
      
      columna3.innerHTML='<input type="text" style="width:200px" name="nombrefam[]" id="cam_nombrefam'+contador+'" readonly/>';
      columna5.innerHTML='<input type="checkbox" name="representantefam[]" onclick="validar_representante(this);" value="1" id="cam_representantefam'+contador+'" />';
      columna6.innerHTML='<button type="button" class="btn btn-danger" onclick="quitar(this)"><i class="icon-remove"></i></button>';


      columna4.appendChild(select_parentesco);
      nueva_fila.appendChild(columna1);
      nueva_fila.appendChild(columna2);
      nueva_fila.appendChild(columna3);
      nueva_fila.appendChild(columna4);
      nueva_fila.appendChild(columna5);
      nueva_fila.appendChild(columna6);
      filas.appendChild(nueva_fila);

      document.getElementById('cam_contador').value=contador
   }

    function quitar(e)
     {
        var filas = document.getElementById("filas");          
        var td = e.parentNode;
        var tr = td.parentNode;
        filas.removeChild(tr);
     }
 function desplegar()
    {
        document.getElementById("estudia").style.display="block";
        document.getElementById("docente_grado").style.display="block";  
    }
    function ocultar()
    {
        document.getElementById("estudia").style.display="none";
        document.getElementById("docente_grado").style.display="none";  
        
    }
    function ventana(e)
    {
       window.open(e, 'window', 'width=1000,height=600');
    }

    function validar_representante(e)
    {
        representante=document.getElementsByName("representantefam[]");
        var cont=0;
        for (var i = 0; i < representante.length; i++) 
        {
            if(representante[i].checked==true)
            {
                cont++;
            }
            if(cont==2)
            {
                alert('Solo un familiar puede ser representante del participante');
                e.checked=false;
                break;
            }
        };
    }

    function validar_parentesco(e)
    {
        parentescofam=document.getElementsByName("parentescofam[]");
        var cont=0;
        for (var i = 0; i < parentescofam.length; i++) 
        {
            if(parentescofam[i].value==e.value)
            {
                cont++;
            }
            if(cont==2)
            {
                alert('No se pueden repetir los parentescos');
                    e.value='';
                break;
            }
        };
    }

    function validar_repetido(c,n)
    {
        cedulafam=document.getElementsByName("cedulafam[]");
        var cont=0;
        for (var i = 0; i < cedulafam.length; i++) 
        {
            if(cedulafam[i].value==c.value)
            {
                cont++;
            }
            if(cont==2)
            {
                alert('No se pueden repetir los familiares');
                c.value='';
                n.value='';
                break;
            }
        };
    }

    function validar_vacio()
    {
        diasasistenciains=document.getElementsByName("diasasistenciains[]");
        cedulafam=document.getElementsByName("cedulafam[]");
        parentescofam=document.getElementsByName("parentescofam[]");
        representantefam=document.getElementsByName("representantefam[]");
        if(($('#cam_provieneinstitucion1').prop('checked')==false)&&($('#cam_provieneinstitucion2').prop('checked')==false)) {
                        alert('Debe seleccionar si el participante proviene de alguna institución.');
                        $('#cam_provieneinstitucion1').focus();
                        return false;
                    }
                    if(($('#cam_provieneinstitucion1').prop('checked')==true))
                    {
                         if(!$('#cam_tinstitucion_idinstitucion2').val()) {
                        alert('Debe seleccionar la institución de la cual proviene el participante.');
                        $('#cam_tinstitucion_idinstitucion2').focus();
                        return false;
                        }
                         if(!$('#cam_gradoins').val()) {
                            alert('Debe seleccionar el grado que cursaba el participante en la institución de la cual proviene.');
                            $('#cam_gradoins').focus();
                            return false;
                        }
                         if(!$('#cam_seccionins').val()) {
                            alert('Debe seleccionar la sección del grado que cursaba el participante en la institución de la cual proviene.');
                            $('#cam_seccionins').focus();
                            return false;
                        }
                    }
                    if(!$('#cam_disponibilidadins').val()) {
                            alert('Debe seleccionar la dispoiblidad del participante para asistir.');
                            $('#cam_disponibilidadins').focus();
                            return false;
                        }
                    bueno=true;                        
                    var cont=0;
                    for (var i = 0; i < diasasistenciains.length; i++) 
                    {
                        if(diasasistenciains[i].checked==true)
                        {
                            cont++;
                        }

                    };
                     if(cont<1)
                        {
                            alert('Debe haber seleccionar almenos un dia para asistir Lu/Ma/Mi/Ju/Vi.');
                            bueno=false;
                            return bueno;
                        }
                    if(($('#cam_partidanacimientoins1').prop('checked')==false)&&($('#cam_partidanacimientoins2').prop('checked')==false)) {
                        alert('Seleccione si el participante presentó partida de nacimiento.');
                        $('#cam_partidanacimientoins1').focus();
                        return false;
                    }
                    if(($('#cam_copiacedulains1').prop('checked')==false)&&($('#cam_copiacedulains2').prop('checked')==false)) {
                        alert('Seleccione si el participante presentó copia de la cédula.');
                        $('#cam_copiacedulains1').focus();
                        return false;
                    }
                    if(($('#cam_informemedico1').prop('checked')==false)&&($('#cam_informemedico2').prop('checked')==false)) {
                        alert('Seleccione si el participante presentó informe médico.');
                        $('#cam_informemedico1').focus();
                        return false;
                    }
                    if(($('#cam_repitienteins1').prop('checked')==false)&&($('#cam_repitienteins2').prop('checked')==false)) {
                        alert('Seleccione si el participante es repitiente.');
                        $('#cam_repitienteins1').focus();
                        return false;
                    }
    }


    $("#cam_cedulapar").change(function() { 

    var valor = $("#cam_cedulapar").val();

            $("#status").html('<img src="../media/img/loader.gif" align="absmiddle">&nbsp;Analizando...');

                $.ajax({  
                    type: "POST",  
                    url: "../controlador/control_inscripcion.php",  
                    data: {cedulapar:valor,operacion:"verificar"},  
                    success: function(msg){
                            if(msg == '1')
                            {
                                $("#status").hide();
                                $("#cam_cedulapar").val('');
                                $("#btn_enviar").prop( "disabled", true );
                                alert('Ya existe un participante con esta cedula.');                              
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

function calcular_edad(fecha) 
{
    var fechaActual = new Date()
    var diaActual = fechaActual.getDate();
    var mmActual = fechaActual.getMonth() + 1;
    var yyyyActual = fechaActual.getFullYear();
    FechaNac = fecha.split("-");
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

    if ((mmActual < mmCumple) || (mmActual == mmCumple && diaActual < diaCumple)) {
    edad--;
    }
    return edad;
}

$(function(){
    $("#cam_cedulapar").lemez_aceptar("numero","btn_enviar");
    $("#cam_nombreunopar").lemez_aceptar("texto","btn_enviar");
    $("#cam_nombredospar").lemez_aceptar("texto");
    $("#cam_apellidounopar").lemez_aceptar("texto","btn_enviar");
    $("#cam_apellidodospar").lemez_aceptar("texto");
    $("#cam_fechanacimientopar").lemez_aceptar("fecha","btn_enviar");
    $("#cam_direccionpar").lemez_aceptar("todo","btn_enviar");
    $("#cam_telefonopar").lemez_aceptar("numero","btn_enviar");
    $("#cam_numhijopar").lemez_aceptar("numero","btn_enviar");
    $("#cam_correopar").lemez_aceptar("correo","btn_enviar");
    $("#cam_viviendapar").lemez_aceptar("texto","btn_enviar");
    $("#cam_medioviviendapar").lemez_aceptar("texto","btn_enviar");
    $("#cam_tipoconstruccionpar").lemez_aceptar("texto","btn_enviar");
    $("#cam_tdiagnostico_iddiagnostico").lemez_aceptar("numero","btn_enviar");
    $("#cam_nacionalidadpar").lemez_aceptar("texto","btn_enviar");
     $("#cam_telefono_docente_grado").lemez_aceptar("numero","btn_enviar");
    $("#cam_telefono_docente_aula_integrada").lemez_aceptar("numero","btn_enviar");

    $("#cam_docente_grado").lemez_aceptar("texto","btn_enviar");
    $("#cam_docente_aula_integrada").lemez_aceptar("texto","btn_enviar");

    $("#cam_gradoins").lemez_aceptar("texto_numero");
    $("#cam_seccionins").lemez_aceptar("texto_numero");
    $("#cam_disponibilidadins").lemez_aceptar("texto","btn_enviar");
    $("#cam_observacionins").lemez_aceptar("texto_especial");
    $("#cam_motivocambioins").lemez_aceptar("texto_especial");
    $("#cam_resumendiagnosticoins").lemez_aceptar("texto_especial","btn_enviar");
    });
</script>
<script>
diasasistenciains=document.getElementsByName("diasasistenciains[]");
        cedulafam=document.getElementsByName("cedulafam[]");
        parentescofam=document.getElementsByName("parentescofam[]");
        representantefam=document.getElementsByName("representantefam[]");
    $(document).ready(function() {
        $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) 
            {
                if(index==1) 
                {
                    cedula=$('#cam_cedulapar').val();
                    telefono=$('#cam_telefonopar').val();
                    // Make sure we entered the name
                    if(!$('#cam_cedulapar').val()) {
                        alert('Debe ingresar la cedula del participante');
                        $('#cam_cedulapar').focus();
                        return false;
                    }
                    if(cedula.length<6)
                    {
                        alert('Cédula invalida, debe ingresar una cédula valida.');
                        $("#cam_cedulapar").focus();
                        return false;
                    }
                    if(!$('#cam_nombreunopar').val()) {
                        alert('Debe ingresar el primer nombre del participante');
                        $('#cam_nombreunopar').focus();
                        return false;
                    }
                    if(!$('#cam_apellidounopar').val()) {
                        alert('Debe ingresar el primer apellido del participante');
                        $('#cam_apellidounopar').focus();
                        return false;
                    }
                    if(($('#cam_sexopar1').prop('checked')==false)&&($('#cam_sexopar2').prop('checked')==false)) {
                        alert('Debe seleccionar el sexo del participante');
                        $('#cam_sexopar1').focus();
                        return false;
                    }
                    if(!$('#cam_telefonopar').val()) {
                        alert('Debe ingresar el nro de teléfono del participante');
                        $('#cam_telefonopar').focus();
                        return false;
                    }
                    if(telefono.length<11)
                    {
                        alert('Teléfono invalido, debe ingresar un teléfono valido de 11 caracteres.');
                        $("#cam_telefonopar").focus();
                        return false;
                    }
                    if(!$('#cam_fechanacimientopar').val()) {
                        alert('Debe ingresar la fecha de nacimiento del participante');
                        $('#cam_fechanacimientopar').focus();
                        return false;
                    }
                    edad=calcular_edad($('#cam_fechanacimientopar').val());
                    if(edad<4)
                    {
                        alert('Por favor retifique la fecha de nacimiento.');
                        $('#cam_fechanacimientopar').focus();
                        return false;                        
                    }
                    if(!$('#cam_direccionpar').val()) {
                        alert('Debe ingresar la dirección del participante');
                        $('#cam_direccionpar').focus();
                        return false;
                    }
                    if(!$('#cam_tlocalidad_idlocalidad').val()) {
                        alert('Debe seleccionar la localidad donde vive el participante.');
                        $('#cam_tlocalidad_idlocalidad').focus();
                        return false;
                    }
                    if(!$('#cam_viviendapar').val()) {
                        alert('Debe seleccionar cual es el estus de vivienda en el cual se encuentra el participante.');
                        $('#cam_viviendapar').focus();
                        return false;
                    }
                    if(!$('#cam_medioviviendapar').val()) {
                        alert('Debe seleccionar el medio en el cual el participante vive.');
                        $('#cam_medioviviendapar').focus();
                        return false;
                    }

                    if(!$('#cam_numhijopar').val()) {
                        alert('Debe seleccionar el nro de hijo del participante dentro de su familia.');
                        $('#cam_numhijopar').focus();
                        return false;
                    }                    
                    if(($('#cam_braillepar1').prop('checked')==false)&&($('#cam_braillepar2').prop('checked')==false)) {
                        alert('Debe seleccionar si el participante conoce braille.');
                        $('#cam_braillepar').focus();
                        return false;
                    }
                    if(!$('#cam_tdiagnostico_iddiagnostico').val()) {
                        alert('Debe seleccionar el diagnostico del participante.');
                        $('#cam_tdiagnostico_iddiagnostico').focus();
                        return false;
                    }                    
                    if(($('#cam_etniapar1').prop('checked')==false)&&($('#cam_etniapar2').prop('checked')==false)) 
                    {
                        alert('Debe seleccionar si el participante pertenece a alguna etnia indigena.');
                        $('#cam_etniapar1').focus();
                        return false;
                    }
                     document.getElementById('btn_salir').style.display="none";
                    document.getElementById('btn_atras').style.display="block";
                    
                }
                if(index==2) 
                {
                    bueno=true;

                    for (var i = 0; i < cedulafam.length; i++) 
                    {
                        bueno=false;

                        if(cedulafam[i].value=='')
                        {
                            alert('La cedula del familiar de la fila: '+(i+1)+' está vacia.');
                            return bueno;
                        }
                    };

                    for (var i = 0; i < parentescofam.length; i++) 
                    {
                        bueno=false;
                        if(parentescofam[i].value=='')
                        {
                            alert('El parentesco de la fila: '+(i+1)+' está vacio.');
                            return bueno;
                        }
                    };
                    var cont=0;
                    for (var i = 0; i < representantefam.length; i++) 
                    {
                        if(representantefam[i].checked==true)
                        {
                            cont++;
                        }

                    };
                     if(cont<1)
                        {
                            alert('Debe haber almenos un representante.');
                            bueno=false;
                            
                            return bueno;
                        }
                    document.getElementById('btn_siguiente').style.display="none";

                }

                
                // Set the name for the next tab
                
            },onPrevious:function(tab, navigation, index) 
            {
                if(index==0)
                {
                    document.getElementById('btn_atras').style.display="none";
                    document.getElementById('btn_salir').style.display="inline";
                }
                if(index==1)
                {
                   document.getElementById('btn_siguiente').style.display="block";
                }
                

            },onTabClick: function(tab, navigation, index) {
                        alert('Debe continuar mediante el botón de SIGUIENTE');
                        $('#btn_siguiente').focus();
                        return false;
            }, onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
            }});    
        window.prettyPrint && prettyPrint()
    }); 
    </script>