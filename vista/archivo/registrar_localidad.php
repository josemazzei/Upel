
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Registrar localidad</h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá registrar la localidad de los municipios.</li>
            <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.</li>
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_localidad.php" method="POST" name="form_localidad">
        <input type="hidden" value="registrar_localidad" name="operacion" />
        <input type="hidden"  name="idlocalidad" id="cam_idlocalidad"/>
        <div style="float:right" id="status"></div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre de la localidad."><i class="fa fa-question" ></i></span></label>
                <input class="span12" type="text" data-step="1" data-intro="Ingrese el nombre de la localidad" data-position="right" name="descripcionloc" id="cam_descripcionloc" required />
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
                            ?><option value="<?php print($listado_municipio[$i][0])?>"><?php print($listado_municipio[$i][1])?></option>
                        <?php }?>
                </select>
            </div>
        </div>
        <div class="botonera">
            <input type="submit" data-step="3" data-intro='Haga clic en <button class="btn btn-success">Aceptar</button> para guardar la localidad ingresada' data-position="top" class="btn btn-success" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" data-step="4" data-intro='Haga clic en <button class="btn btn-danger">Regresar</button> para regresar al listado de localidades' data-position="top" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/localidad';">
        </div>
    </form>
</div>
<script type="text/javascript">
$(function(){
$("#cam_descripcionloc").lemez_aceptar("texto","btn_enviar");
$("#cam_tmunicipio_municipio").lemez_aceptar("numero","btn_enviar");
});

$("#cam_tmunicipio_municipio").change(function() { 

    var valor = $("#cam_descripcionloc").val();
    var valor_municipio = $("#cam_tmunicipio_municipio").val();

            $("#status").html('<img src="../media/img/loader.gif" align="absmiddle">&nbsp;Analizando...');

                $.ajax({  
                    type: "POST",  
                    url: "../controlador/control_localidad.php",  
                    data: {descripcionloc:valor,tmunicipio_municipio:valor_municipio,operacion:"verificar"},  
                    success: function(msg){
                            if(msg == '1')
                            {
                                $("#status").hide();
                                $("#cam_descripcionloc").val('');
                                $("#btn_enviar").prop( "disabled", true );
                                alert('Ya existe una localidad con ese nombre es ese Municipio.');                              
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
</script>