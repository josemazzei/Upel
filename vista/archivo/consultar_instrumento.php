<?php
include('../clases/clase_instrumento.php');
$lobjInstrumento = NEW clsInstrumento();
$id=(isset($_GET['id']))?$_GET['id']:"";
$lobjInstrumento->set_Instrumento($id);
$Datos_Instrumento = $lobjInstrumento->consultar_instrumento_bitacora();

if($Datos_Instrumento)
{
    $operacion='editar_instrumento';
    $titulo   ='Consultar instrumento';
}
else
{
    $operacion='registrar_instrumento';
    $titulo   ='Registrar instrumento';
}
?>
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3><?php print($titulo); ?></h3>
    <div class="alert alert-info">
     <ul>
    <li>En este formulario podrá consultar y editar el instrumento que será aplicado en la evaluación.
    <li>Sí necesitas ayuda para usar este formulario haz clic en el botón <button class="btn btn-warning" type="button" onclick="javascript:introJs().start();"><i class="fa fa-question-circle"></i> Ayuda</button>.
    <ul>
    </div>    
    <form class="formulario" action="../controlador/control_instrumento.php" method="POST" name="form_instrumento">
        <input type="hidden" value="<?php print($operacion);?>" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Instrumento['idinstrumento']);?>" name="idinstrumento" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label>Nombre <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Nombre del instrumento."><i class="fa fa-question" ></i></span></label>
                <input type="text" class="span12"  name="nombreins" id="cam_nombreins" value="<?php print($Datos_Instrumento['nombreins']);?>" required/>
            </div>    
            <div class="col-lg-6 span6">
                <label>Asignatura <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Asignatura para la cual se usará el instrumento."><i class="fa fa-question" ></i></span></label>
                <select class="span12" name="tasignatura_idasignatura" id="cam_tasignatura_idasignatura" required>
                    <option value="">-</option>
                    <?php
                    require_once('../clases/clase_asignatura.php');
                    $lobjAsignatura= new clsAsignatura;
                    $laAsignaturas= $lobjAsignatura->consultar_asignaturas();
                    for ($i=0; $i <count($laAsignaturas) ; $i++) 
                    { 
                        $selected=($laAsignaturas[$i][0]==$Datos_Instrumento['tasignatura_idasignatura'])?'selected':'';
                        echo '<option value="'.$laAsignaturas[$i][0].'" '.$selected.'>'.$laAsignaturas[$i][1].'</option>';
                    }
                    ?>
                </select>
            </div>         
        </div>
        <div class="row-fluid">            
            <h4>Criterio de evaluación a usar</h4>            
            
            <div class="col-lg-12 span12" id="items_usar" >
                <table>
                    <thead>
                        <th>Criterio</th>
                        <th>Posición</th>
                        <th><button class="btn btn-success" type="button" onclick="agregar()"> <i class="fa fa-plus"></i> </button></th>
                    </thead>
                    <tbody id="tabla_items">
                        <?php 
                            $Datos_Instrumento_Item=$lobjInstrumento->consultar_items();
                            for($j=0;$j<count($Datos_Instrumento_Item);$j++)
                            {
                        ?>
                        <tr>
                            <td style="text-align:center">
                                <select name="item[]" id="cam_item<?php echo $j;?>" onchange="item_repetido(this);">
                                    <option value="">-</option>
                                    <?php
                                        require_once('../clases/clase_item.php');
                                        $lobjItem= new clsItem;
                                        $laItems=$lobjItem->consultar_items();
                                        for ($i=0; $i <count($laItems) ; $i++) 
                                        { 
                                            $selected=($laItems[$i][0]==$Datos_Instrumento_Item[$j][1])?'selected':'';

                                            echo '<option value="'.$laItems[$i][0].'" id="'.$laItems[$i][1].'-'.$laItems[$i][2].'-'.$laItems[$i][4].'-'.implode($laItems[$i][5],',').'" '.$selected.'>'.$laItems[$i][1].'</option>';
                                        }
                                    ?>
                                </select>
                            </td>
                            <td style="text-align:center">
                                <select name="espacio[]" id="cam_espacio<?php echo $j;?>">
                                    <option value="">-</option>
                                    <option value="mitad" <?php echo ('mitad'==$Datos_Instrumento_Item[$j][2])?'selected':'';?>>Media fila</option>
                                    <option value="completo" <?php echo ('completo'==$Datos_Instrumento_Item[$j][2])?'selected':'';?>>Toda la fila</option>
                                </select>
                            </td>
                            <td style="text-align:center">
                                <button class="btn btn-danger" id="quitar<?php echo $j;?>" type="button" onclick="quitar(this)" title="quitar item"><i class="fa fa-times"></i></button>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <input type="hidden" value="<?php echo $j;?>" name="contador" id="cam_contador">
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
            <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" onclick="return validar();" value="Guardar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=archivo/instrumento';">
        </div>
        <div style="display:none;">
            <select id="select_item" onchange="item_repetido(this);">
                <option value="">-</option>
                <?php
                    require_once('../clases/clase_item.php');
                    $lobjItem= new clsItem;
                    $laItems=$lobjItem->consultar_items();
                    for ($i=0; $i <count($laItems) ; $i++) 
                    { 
                        
                        echo '<option value="'.$laItems[$i][0].'" id="'.$laItems[$i][1].'-'.$laItems[$i][2].'-'.$laItems[$i][4].'-'.implode($laItems[$i][5],',').'">'.$laItems[$i][1].'</option>';
                    }
                ?>
            </select>
        </div>
    </form>
</div>
<script type="text/javascript">
$(function()
{
$("#cam_nombreins").lemez_aceptar("texto","btn_enviar");
});

function agregar()    
   {    

      cam_contador=document.getElementById('cam_contador');
      var contador=cam_contador.value;
      contador++;
      var filas = document.getElementById("tabla_items");
      var select = document.getElementById("select_item");
      var nueva_fila =document.createElement("tr");
      var columna1 =document.createElement("td");
      var columna2 =document.createElement("td");
      var columna3 =document.createElement("td");
      nuevo_select=select.cloneNode(true);
      nuevo_select.setAttribute("value","");
      nuevo_select.setAttribute("id","cam_item"+contador);
      nuevo_select.setAttribute("name","item[]");      
      columna1.setAttribute("style", "text-align:center");
      columna2.setAttribute("style", "text-align:center");
      columna3.setAttribute("style", "text-align:center");   
      columna2.innerHTML='<select name="espacio[]" id="cam_espacio'+contador+'"><option value="">-</option><option value="mitad">Mitad</option><option value="completo">Completo</option></select>';  
      columna3.innerHTML='<button class="btn btn-danger" id="quitar'+contador+'" type="button" onclick="quitar(this)" title="quitar item"><i class="fa fa-times"></i></button>';

      columna1.appendChild(nuevo_select);
      nueva_fila.appendChild(columna1);
      nueva_fila.appendChild(columna2);
      nueva_fila.appendChild(columna3);
      filas.appendChild(nueva_fila);

      cam_contador.value=contador;
   }

    function quitar(e)
     {
        var filas = document.getElementById("tabla_items");          
        var td = e.parentNode;
        var tr = td.parentNode;
        filas.removeChild(tr);
     }

     $("#btn_visualizar").click(function() {
        caja_visualizar=document.getElementById("caja_visualizar");
       if(caja_visualizar.hasChildNodes())
        {
            while (caja_visualizar.hasChildNodes())
                caja_visualizar.removeChild(caja_visualizar.firstChild);
        }
        item=document.getElementsByName('item[]');
        espacio=document.getElementsByName('espacio[]');
        $("#caja_visualizar").animate({ height: 'show', opacity: 'show' }, 'slow');
        var f=0;
        for(i=0;i<item.length;i++)
        {
            var indice = item[i].selectedIndex;
            var id = item[i].options[indice].id;
            id=id.split('-');
            var nombre=id[0];
            var tipo=id[1];
            var descripcion=id[2];
            var valores=id[3].split(',');

            div=document.createElement("div");
            elemento=document.createElement("div");
            label=document.createElement("label");
            if(espacio[i].value=='mitad')
            {
                if(f==0)
                {
                    fila=document.createElement("div");
                    fila.setAttribute('class','row-fluid');
                    fila.setAttribute('style','margin-bottom:10px;');

                    f++;
                }
                else if(f==1)
                {
                    f=0;
                }
                div.setAttribute('class','col-lg-6 span6');

            }
            else
            {
                fila=document.createElement("div");
                fila.setAttribute('class','row-fluid');
                fila.setAttribute('style','margin-bottom:10px;');

                div.setAttribute('class','col-lg-12 span12');
            }

            label.innerHTML=nombre+' <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="'+descripcion+'."><i class="fa fa-question" ></i></span>';

            if(tipo=='text')
                elemento.innerHTML='<input type="text" class="span12"/>';
            else if(tipo=='textarea')
                elemento.innerHTML='<textarea class="span12"></textarea>';
            else if(tipo=='select')
            {
                select=document.createElement('select');
                select.setAttribute('class','span12');
                    option=document.createElement('option');
                    option.innerHTML='-';
                    select.appendChild(option);
                    for(j=0;j<valores.length;j++)
                    {
                        option=document.createElement('option');
                        option.setAttribute('value',valores[j]);
                        option.innerHTML=valores[j];
                        select.appendChild(option);
                    }
                elemento.appendChild(select);

            }
            else if(tipo=='radio')
            {

                    for(j=0;j<valores.length;j++)
                    {
                        label_radio=document.createElement('label');
                        label_radio.setAttribute('style','display:inline;margin-left:10px;');
                        label_radio.innerHTML=valores[j]+'<input type="radio" title="'+valores[j]+'" value="'+valores[j]+'"/> ';
                        elemento.appendChild(label_radio);
                    }


            }
            else if(tipo=='checkbox')
            {

                    for(j=0;j<valores.length;j++)
                    {
                        label_checkbox=document.createElement('label');
                        label_checkbox.setAttribute('style','display:inline');
                        label_checkbox.innerHTML=valores[j]+'<input type="checkbox" title="'+valores[j]+'" value="'+valores[j]+'"/> ';
                        elemento.appendChild(label_checkbox);
                    }


            }

            div.appendChild(label);
            div.appendChild(elemento);
            fila.appendChild(div);
            caja_visualizar.appendChild(fila);            
        }

        
        
        $("[data-toggle='popover']").popover();

    });
function item_repetido(e)
{
    item=document.getElementsByName('item[]');
    valor=e.value;
    for(i=0;i<item.length;i++)
    {
        if(valor==item[i].value && e.id!=item[i].id)
        {
            e.value='';
            alert('Este item ya está seleccionado, por favor seleccione otro.');
        }
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