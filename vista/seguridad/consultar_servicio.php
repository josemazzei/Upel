<?php

    require_once("../clases/clase_servicio.php");
    $lobjServicio=new clsServicio;
    
    $id=(isset($_GET['id']))?$_GET['id']:"";

    $lobjServicio->set_Servicio($id);
    $laServicio=$lobjServicio->consultar_servicio();
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Consultar Servicio</h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá consultar y editar el servicio en el sistema.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_servicio.php" method="POST" name="form_servicio">
        <input type="hidden" value="editar_servicio" name="operacion" />
        <input type="hidden"  name="idservicio" id="cam_idservicio" value="<?php echo $laServicio[0];?>"/>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del servicio."><i class="fa fa-question" ></i></span></label>
                <input class="span12" type="text" name="nombreser" id="cam_nombreser" value="<?php echo $laServicio[1];?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Enlace <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Enlace del archivo."><i class="fa fa-question" ></i></span></label>
                <input class="span12" type="text" name="enlaceser" id="cam_nombreser" value="<?php echo $laServicio[2];?>" required/>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Módulo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Modulo al cual pertenece el servicio."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="idmodulo" id="cam_idmodulo" required>
                    <option value="">Seleccione un módulo</option>
                    <?php
                        require_once('../clases/clase_modulo.php');
                            $lobjModulo=new clsModulo;
                            $laModulos=$lobjModulo->consultar_modulos();
                            for($i=0;$i<count($laModulos);$i++)
                            {
                                if($laServicio[3]==$laModulos[$i][0])
                                {
                                    echo '<option value="'.$laModulos[$i][0].'" selected>'.$laModulos[$i][1].'</option>';
                                }
                                else
                                {
                                    echo '<option value="'.$laModulos[$i][0].'" >'.$laModulos[$i][1].'</option>';
                                }
                            }
                    ?>
                 </select>
            </div>
            <div class="col-lg-6 span6">
                <label>Tipo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tipo de servicio."><i class="fa fa-question" ></i></span></label>
                <div class="row-fluid">
                    <div class="span2">
                        <label>
                            Sub-Módulo
                            <input type="radio" name="visibleser" value="1" id="cam_visibleser" <?php if($laServicio[4]=='1'){echo 'checked';}?> />
                        </label>
                    <div class="span2">
                        <label>
                            Operación
                            <input type="radio" name="visibleser" value="0" id="cam_visibleser" <?php if($laServicio[4]=='0'){echo 'checked';}?>/>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <br>
        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=seguridad/servicio';">
        </div>
    </form>
</div>