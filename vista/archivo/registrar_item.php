<?php
include('../clases/clase_item.php');
$lobjItem = NEW clsItem();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjItem->set_Item($id);
$Datos_Item = $lobjItem->consultar_item_bitacora();

if($Datos_Item)
{
    $operacion='editar_item';
    $titulo   ='Consultar Criterio de evaluación';
}
else
{
    $operacion='registrar_item';
    $titulo   ='Registrar Criterio de evaluación';
}
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
        <ul>
            <li>En este formulario podrá registrar el criterio de evaluación que se utilizará en el instrumento para aplicar la evaluación.
            Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.
        </ul>
    </div>
    <form class="formulario" action="../controlador/control_item.php" method="POST" name="form_item">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Item['iditem']);?>" name="iditem" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del item."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombreite" id="cam_nombreite" value="<?php print($Datos_Item['nombreite']);?>" required/>
            </div>
            <div class="col-lg-6 span6">
                <label>Descripción <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Descripción del item."><i class="fa fa-question" ></i></span></label>
                <textarea class="span12"  name="descripcionite" id="cam_descripcionite" value="<?php print($Datos_Item['descripcionite']);?>" required></textarea>
            </div>
        </div>
        <div class="row-fluid">        
            <div class="col-lg-6 span6">
                <label>Tipo de campo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Tipo de campo."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tipoite" id="cam_tipoite" required>
                    <option value="">-</option>
                    <option value="text">Campo de texto</option>
                    <option value="textarea">Area de texto</option>
                    <option value="select">Lista de selección</option>
                    <option value="radio">Circulo Selección simple</option>
                    <option value="checkbox">Cuadro Selección Multiple</option>
                   
                </select>
            </div>
            <div class="col-lg-6 span6" id="caja_cantidad" style="display:none">
                <label>Cantidad <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Cantidad de opciones para el radio o checkbox."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="cantidad" id="cam_cantidad">
                    <option value="">-</option>
                    <?php
                        for ($i=1; $i <=10 ; $i++)
                        { 
                            echo '<option>'.$i.'</option>';
                        }
                    ?>
                   
                </select>
            </div>            
        </div>
        <div class="row-fluid">            
            <div class="col-lg-6 span6" id="caja_valores"  style="display:none">
                <label>Valor <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Valores de cada elemento."><i class="fa fa-question" ></i></span></label>
                <table>
                    <tbody id="tabla_valores">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row-fluid">
            <div class="botonera">
                <button type="button" class="btn btn-info" name="btn_visualizar" id="btn_visualizar" value="VISUALIZAR" ><i class="fa fa-eye"></i> Visualizador</button>      
            </div>
        </div>
        <div class="row-fluid">
            <h4>Visualizador</h4>            
        </div>
         <div class="row-fluid" id="caja_visualizar" style="display:none">

        </div>
        <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" onclick="return validar();" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/item';">
        </div>
    </form>
</div>
<script type="text/javascript">
$(function()
{
$("#cam_nombreite").lemez_aceptar("texto","btn_enviar");
$("#cam_tipoite").lemez_aceptar("texto","btn_enviar");
});
$("#cam_tipoite").change(function() {
    var valor = $("#cam_tipoite").val();
    if(valor=='radio' || valor=='checkbox' || valor=='select')
    {
        $("#caja_cantidad").animate({ height: 'show', opacity: 'show' }, 'slow');
    }
    else
    {
        $("#caja_cantidad").animate({ height: 'hide', opacity: 'hide' }, 'slow');
        $("#caja_valores").animate({ height: 'hide', opacity: 'hide' }, 'slow');
        $("#cam_cantidad").val('');
        eliminar_valores();
    }
});

$("#cam_cantidad").change(function() {
    var valor = $("#cam_cantidad").val();
    eliminar_valores();
    if(valor>='1')
    {
        $("#caja_valores").animate({ height: 'show', opacity: 'show' }, 'slow');
        for(i=0;i<valor;i++)
        {
            tabla=document.getElementById('tabla_valores');
            tr=document.createElement('tr');
            td1=document.createElement('td');
            td2=document.createElement('td');
            td1.innerHTML="<b>"+(i+1)+"</b>";
            td2.innerHTML='<input type="text" name="valor[]" class="span12" />';
            tr.appendChild(td1);
            tr.appendChild(td2);
            tabla.appendChild(tr);
        }
    }
    else if(valor<1)
    {
        $("#caja_valores").animate({ height: 'hide', opacity: 'hide' }, 'slow');

    }
});
$("#btn_visualizar").click(function() {
        caja_visualizar=document.getElementById("caja_visualizar");
       if(caja_visualizar.hasChildNodes())
        {
            while (caja_visualizar.hasChildNodes())
                caja_visualizar.removeChild(caja_visualizar.firstChild);
        }
        tipo=$("#cam_tipoite").val();
        nombre=$("#cam_nombreite").val();
        descripcion=$("#cam_descripcionite").val();
        $("#caja_visualizar").animate({ height: 'show', opacity: 'show' }, 'slow');
        div=document.createElement("div");
        elemento=document.createElement("div");
        label=document.createElement("label");
        div.setAttribute('class','col-lg-12 span12');
        label.innerHTML=nombre+' <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="'+descripcion+'."><i class="fa fa-question" ></i></span>';
        if(tipo=='text')
            elemento.innerHTML='<input type="text" class="span6"/>';
        else if(tipo=='textarea')
            elemento.innerHTML='<textarea class="span6"></textarea>';
        else if(tipo=='select')
        {
            select=document.createElement('select');
            select.setAttribute('class','span6');
                valores=document.getElementsByName('valor[]');
                option=document.createElement('option');
                option.innerHTML='-';
                select.appendChild(option);
                for(i=0;i<valores.length;i++)
                {
                    option=document.createElement('option');
                    option.setAttribute('value',valores[i].value);
                    option.innerHTML=valores[i].value;
                    select.appendChild(option);
                }
            elemento.appendChild(select);

        }
        else if(tipo=='radio')
        {

                valores=document.getElementsByName('valor[]');
                for(i=0;i<valores.length;i++)
                {
                    label_radio=document.createElement('label');
                    label_radio.setAttribute('style','display:inline');
                    label_radio.innerHTML=valores[i].value+'<input type="radio" title="'+valores[i].value+'" value="'+valores[i].value+'"/> ';
                    elemento.appendChild(label_radio);
                }


        }
        else if(tipo=='checkbox')
        {

                valores=document.getElementsByName('valor[]');
                for(i=0;i<valores.length;i++)
                {
                    label_checkbox=document.createElement('label');
                    label_checkbox.setAttribute('style','display:inline');
                    label_checkbox.innerHTML=valores[i].value+'<input type="checkbox" title="'+valores[i].value+'" value="'+valores[i].value+'"/> ';
                    elemento.appendChild(label_checkbox);
                }


        }

        div.appendChild(label);
        div.appendChild(elemento);
        caja_visualizar.appendChild(div);
        $("[data-toggle='popover']").popover();

    });
function eliminar_valores()
{
    tabla=document.getElementById('tabla_valores');
    if(tabla.hasChildNodes())
    {
        while (tabla.hasChildNodes())
            tabla.removeChild(tabla.firstChild);
    }
}
/*function validar()
{
    horas_teoricas = document.getElementById('cam_horasteoricas');
    horas_practicas = document.getElementById('cam_horaspracticas');
    if((horas_teoricas.value>=1) && (horas_practicas.value>=0))
    {
        return true;
    }
    if((horas_teoricas.value>=0) && (horas_practicas.value>=1))
    {
        return true;
    }
    else
    {
        return false;
    }
}*/
</script>