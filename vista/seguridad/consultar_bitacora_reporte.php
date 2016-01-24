<?php
    require_once("../clases/clase_bitacora.php");
    $lobjBitacora=new clsBitacora;
    $id=(isset($_GET['id']))?$_GET['id']:"";
    $lobjBitacora->set_IdBitacora($id);
    $laBitacora=$lobjBitacora->consultar_bitacora_reporte();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar bitacora</h3>
    <form class="formulario" action="../controlador/control_bitacora.php" method="POST" name="form_servicio">
        <input type="hidden" value="revertir" name="operacion" />
        <input type="hidden"  name="idbitacora" id="cam_idbitacora" value="<?php echo $laBitacora[0];?>"/>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Dirección</label>
                <input class="span12" type="text" name="direccionbit" id="cam_direccionbit" value="<?php echo $laBitacora[1];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Fecha y Hora</label>
                <input class="span12" type="text" name="fechahorabit" id="cam_fechahorabit" value="<?php echo $laBitacora[2];?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Ip</label>
                <input class="span12" type="text" name="ipbit" id="cam_ipbit" value="<?php echo $laBitacora[3];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Usuario</label>
                <input class="span12" type="text" name="idusuario" id="cam_idusuario" value="<?php echo $laBitacora[4];?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Campo</label>
                <input class="span12" type="text" name="campobit" id="cam_campobit" value="<?php echo $laBitacora[10];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Valor nuevo</label>
                <input class="span12" type="text" name="valornuevobit" id="cam_valornuevobit" value="<?php echo $laBitacora[7];?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Reporte</label>
                <input class="span12" type="text" name="serviciobit" id="cam_serviciobit" value="<?php echo $laBitacora[5];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Código</label>
                <input class="span12" type="text" name="valorviejobit" id="cam_valorviejobit" value="<?php echo $laBitacora[6];?>" required/>
            </div>
        </div>
        <div class="botonera">
        <a class="btn btn-success" name="btn_reporte" id="btn_reporte" href="../reporte/<?php echo $laBitacora[5];?>.php?<?php echo $laBitacora[10];?>=<?php echo $laBitacora[7];?>" target="_blank" ><i class="fa fa-file-text"></i> Generar</a>
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=seguridad/bitacora_reporte';">
        </div>
    </form>
</div>