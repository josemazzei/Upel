<?php
    require_once("../clases/clase_bitacora.php");
    $lobjBitacora=new clsBitacora;
    
    $id=(isset($_GET['id']))?$_GET['id']:"";

    $lobjBitacora->set_IdBitacora($id);
    $laBitacora=$lobjBitacora->consultar_bitacora();
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
        <div class="row-fluid" style="display:<?php if($laBitacora[8]=='Modificar'){echo 'block"';}else{echo 'none';}?>">
            <div class="col-lg-6 span6">
                <label>Valor nuevo</label>
                <input class="span12" type="text" name="valornuevobit" id="cam_valornuevobit" value="<?php echo $laBitacora[7];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Valor viejo</label>
                <input class="span12" type="text" name="valoranteriorbit" id="cam_valoranteriorbit" value="<?php echo $laBitacora[6];?>" required/>
                
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Servicio</label>
                <input class="span12" type="text" name="serviciobit" id="cam_serviciobit" value="<?php echo $laBitacora[5];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Operación</label>
                <input class="span12" type="text" name="operacionbit" id="cam_operacionbit" value="<?php echo $laBitacora[8];?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6" <?php if($laBitacora[8]=='Consultar'|| $laBitacora[8]=='Navegar'){echo 'style="display:none"';}?>>
                <label>Tabla</label>
                <input class="span12" type="text" name="tablabit" id="cam_tablabit" value="<?php echo $laBitacora[11];?>" required/>
            </div>
            <div class="col-lg-6 span6" <?php if($laBitacora[8]=='Registrar' || $laBitacora[8]=='Consultar' || $laBitacora[8]=='Navegar'){echo 'style="display:none"';}?>>
                <label>Campo</label>
                <input class="span12" type="text" name="campobit" id="cam_campobit" value="<?php echo $laBitacora[10];?>" required/>
            </div>
        </div>
        <div class="row-fluid" <?php if($laBitacora[8]=='Consultar'|| $laBitacora[8]=='Navegar'){echo 'style="display:none"';}?>>
            <div class="col-lg-6 span6">
                <label>Motivo</label>
                <input class="span12" type="text" name="motivobit" id="cam_motivobit" value="<?php echo $laBitacora[9];?>" required/>
            </div>
        </div>
        <div class="botonera">
            <?php if($laBitacora[8]=='Modificar' || $laBitacora[8]=='Revertir los cambios'){echo '<input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Revertir operación">';}?>
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=seguridad/bitacora';">
        </div>
    </form>
</div>