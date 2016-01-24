<?php
include('../clases/clase_institucion.php');
$lobjInstitucion = NEW clsInstitucion();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjInstitucion->set_Institucion($id);
$Datos_Institucion = $lobjInstitucion->consultar_institucion_bitacora();
$Instituciones= $lobjInstitucion->consultar_instituciones_activas();
if($Datos_Institucion)
{
    $operacion='editar_institucion';
    $titulo   ='Consultar institución';
}
else
{
    $operacion='registrar_institucion';
    $titulo   ='Registrar institución';
}
?>       

<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá registrar la institución en el sistema.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_institucion.php" method="POST" name="form_institucion">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Institucion['idinstitucion']);?>" name="idinstitucion" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre de la institución."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" data-step="1" data-intro="Ingrese el nombre de la institución" data-position="right"  name="descripcioninst" id="cam_descripcioninst"onchange="validar_nombre();"  value="<?php print($Datos_Institucion['descripcioninst']);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Dirección <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Dirección de la institución."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12" data-step="2" data-intro="Ingrese la dirección de la institución" data-position="right" name="direccioninst" id="cam_direccioninst" required><?php print($Datos_Institucion['direccioninst']);?></textarea>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Director(a) <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del Director/a de la institución."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12" data-step="3" data-intro="Ingrese el nombre del director de la institución" data-position="right" name="directorinst" id="cam_directorinst" required value="<?php print($Datos_Institucion['directorinst']);?>"/>
            </div>
            <div class="col-lg-6 span6">
                <label>Localidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Localidad a la cual pertenece la institución."><i class="fa fa-question" ></i></span></label>
                <select class="span12" data-step="4" data-intro="Seleccione la localidad a la que pertenece la institución" data-position="right" name="tlocalidad_idlocalidad" id="cam_tlocalidad_idlocalidad" required>
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
                            ?><option value="<?php print($laLocalidades[$i][0])?>" <?php if($laLocalidades[$i][0]==$Datos_Institucion['tlocalidad_idlocalidad']){print('SELECTED');}?>><?php print($laLocalidades[$i][1])?></option>
                        <?php 
                        } //Fin For?>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" data-step="5" data-intro='Haga clic en <button class="btn btn-success">Aceptar</button> para guardar la institución ingresada' data-position="top" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" data-step="6" data-intro='Haga clic en <button class="btn btn-danger">Regresar</button> para regresar al listado de instituciones' data-position="top" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/institucion';">
        </div>
    </form>
</div>
<?php
            for($i=0;$i<count($Instituciones);$i++)
            {
                ?>
                    <input type="hidden" value="<?php print($Instituciones[$i][1]);?>" name="nombres[]" />
                <?php
            }
        ?>
<script type="text/javascript">
$(function(){
$("#cam_descripcioninst").lemez_aceptar("texto_numero","btn_enviar");
$("#cam_direccioninst").lemez_aceptar("todo","btn_enviar");
$("#cam_directorinst").lemez_aceptar("texto","btn_enviar");
$("#cam_tlocalidad_idlocalidad").lemez_aceptar("numero","btn_enviar");
});
function validar_nombre()
{
    nombre_Institucione=document.getElementById('cam_descripcioninst');
    nom_Instituciones = document.getElementsByName('nombres[]');
        for(i=0;i<nom_Instituciones.length;i++)
        {
            if(nom_Instituciones[i].value==nombre_Institucione.value.toUpperCase())
            {
                alert('Debe ingresar un nombre distinto, este ya se encuentra registrado.');
                nombre_Institucione.value='';
                nombre_Institucione.focus();
            }
        }
}
</script>