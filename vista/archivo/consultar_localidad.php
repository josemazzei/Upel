<?php
    require_once("../clases/clase_localidad.php");
    $lobjLocalidad=new clsLocalidad;
    
    $id=(isset($_GET['id']))?$_GET['id']:"";

    $lobjLocalidad->set_Localidad($id);
    $laLocalidad=$lobjLocalidad->consultar_localidad();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar localidad</h3>
    <div class="alert alert-info">
        <ul>
            <li>En este módulo podrá consultar y editar la localidad de los municipios.</li>
            <li>Sí necesitas ayuda para usar este módulo haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_localidad.php" method="POST" name="form_localidad">
        <input type="hidden" value="editar_localidad" name="operacion" />
        <input type="hidden"  name="idlocalidad" id="cam_idlocalidad" value="<?php echo $laLocalidad[0];?>"/>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre de la localidad."><i class="fa fa-question" ></i></span></label>
                <input class="span12" type="text" data-step="1" data-intro="Ingrese el nombre de la localidad" data-position="right" name="descripcionloc" id="cam_descripcionloc" value="<?php echo $laLocalidad[1];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Municipio <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Municipio al cual pertenece la localidad."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tmunicipio_municipio" data-step="2" data-intro="Seleccione el municipio al que pertenece la localidad" data-position="right" id="cam_tmunicipio_municipio" required>
                    <option value="">-</option>
                    <?php 
                        include('../clases/clase_municipio.php');
                        $objMunicipio = new clsMunicipio();
                        $listado_municipio = $objMunicipio->consultar_municipios();
                        for($i=0;$i<count($listado_municipio);$i++)
                        {
                            ?><option <?php if($laLocalidad[3]==$listado_municipio[$i][0]){print('SELECTED');}?> value="<?php print($listado_municipio[$i][0])?>"><?php print($listado_municipio[$i][1])?></option>
                        <?php }?>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" data-step="3" data-intro='Haga clic en <button class="btn btn-success">Aceptar</button> para guardar la localidad ingresada' data-position="top" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" data-step="4" data-intro='Haga clic en <button class="btn btn-danger">Regresar</button> para regresar al listado de localidades' data-position="top" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/localidad';">
        </div>
    </form>
</div>
<script type="text/javascript">
$(function(){
$("#cam_descripcionloc").lemez_aceptar("texto","btn_enviar");
$("#cam_tmunicipio_municipio").lemez_aceptar("numero","btn_enviar");
});
</script>