<?php
    require_once('../clases/clase_asistencia.php');
    require_once('../clases/clase_asignatura.php');
    $lobjAsistencia=new clsAsistencia;
    $lobjAsignatura=new clsAsignatura;
                    
    $pcIdCurso=($_GET['id']!='')?$_GET['id']:'';
    $pcFecha=($_GET['fecha']!='')?$_GET['fecha']:'';
    $pcIdAsignatura=($_GET['idasignatura']!='')?$_GET['idasignatura']:'';
    $fecha=date("d-m-Y",strtotime($pcFecha));
    $lobjAsignatura->set_Asignatura($pcIdAsignatura);
    $lobjAsistencia->set_Curso($pcIdCurso);
    $laAsistencia=$lobjAsistencia->consultar_asistencia($pcFecha);
    $laUnidades=$lobjAsignatura->consultar_unidades();
    $operacion=($laAsistencia[0][10])?'editar_asistencia':'registrar_asistencia';


?>

<div style="float: left;overflow-x: scroll;margin-left:0px;width:1050px;" class="col-lg-11 span11 pull-left">
    <h4>Listado de asistencia <?php echo $fecha; echo ' <a href="../reporte/asistencia.php?id='.$pcIdCurso.'&fecha='.$fecha.'" target="_blank" class="btn btn-success"><i class="fa fa-file-text-o"></i></a>';?> </h4>
        <input type="hidden" value="<?php echo $operacion;?>" name="operacion" id="cam_operacion">
        <input type="hidden" name="fechaasi" value="<?php echo $fecha;?>" id="cam_fecha">
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" style="width:1200px" id="filtro">
            <thead>
                <th>Foto</th><th>Cédula</th><th>Apellido Nombre</th><th>Asistió</th><th >Unidad</th><th>Objetivos</th><th>Observación</th>
            </thead>
            <tbody>
            <?php
                    
                    for($i=0;$i<count($laAsistencia);$i++)
                    {
                        if((($operacion=='registrar_asistencia')&&($laAsistencia[$i][14]==1))||(($operacion=='editar_asistencia')&&($laAsistencia[$i][9]!='')))
                        {
                            $laAsistencia[$i][6]=($laAsistencia[$i][6])?$laAsistencia[$i][6]:'default.png';
                            echo '<tr>';
                            echo '<td><img style="width:52px;height:52px;" src="../media/img/participantes/'.$laAsistencia[$i][6].'"/></td>';
                            echo '<td>'.$laAsistencia[$i][4].'</td>';
                            echo '<td>'.$laAsistencia[$i][0].' '.$laAsistencia[$i][1].' '.$laAsistencia[$i][2].' '.$laAsistencia[$i][3].'</td>';
                            echo '<td style="text-align:center;"><input onclick="activar_unidad('.$i.')" type="checkbox" id="cam_asistencia'.$i.'" style=" -ms-transform: scale(2);-moz-transform: scale(2);-webkit-transform: scale(2);-o-transform: scale(2);" name="asistencia['.$i.']" value="1" ';
                            if($laAsistencia[$i][9]=='1'){echo 'checked';} echo '/><input type="hidden" id="cam_idcurso_participante'.$i.'" name="idcurso_participante['.$i.']" value="'.$laAsistencia[$i][8].'"/>
                            <input type="hidden" id="cam_participante'.$i.'" name="participante[]" value="'.$laAsistencia[$i][8].'"/>
                            <input type="hidden" id="cam_idasistencia'.$i.'" name="idasistencia['.$i.']" value="'.$laAsistencia[$i][10].'"/></td>';
                            echo '<td style="text-align:center;">';
                            echo '<select onchange="desplegar_objetivos('.$i.')" id="cam_unidad'.$i.'" name="idunidad['.$i.']" disabled>
                            <option value="">-</option>';
                             $selected='';
                                for($j=0;$j<count($laUnidades);$j++)
                                {
                                    for($h=0;$h<count($laAsistencia[$i][11]);$h++)
                                    {
                                        $selected=($laAsistencia[$i][11][$h][0]==$laUnidades[$j]['idunidad'])?'selected':'';
                                    }
                                    echo '<option value="'.$laUnidades[$j]['idunidad'].'" '.$selected.'>'.$laUnidades[$j]['nombreuni'].'</option>';
                                }
                                echo '</select></td>';
                            echo '<td style="text-align:left;" id="coulmna_objetivo'.$i.'">';
                                $objetivo='<ul>';
                                for($h=0;$h<count($laAsistencia[$i][12]);$h++)
                                {
                                    $objetivo.=($laAsistencia[$i][12][$h][0])?'<li>'.$laAsistencia[$i][12][$h][1].'</li>':'Por favor seleccione una unidad';
                                }
                                if(count($laAsistencia[$i][12])==0)
                                    $objetivo='<li>Por favor seleccione una unidad</li>';

                                $objetivo.='</ul>';

                                echo $objetivo;
                            echo '</td>';
                                $disabled=($laAsistencia[$i][9])?'disabled':'';
                                echo '<td><textarea name="observacion['.$i.']" id="cam_observacion'.$i.'" '.$disabled.'>'.$laAsistencia[$i][13].'</textarea></td>';

                            echo '</tr>';
                        }
                    }
                ?>
                </tbody>
        </table>
</div>
<div class="botonera">
    <input type="submit" class="btn btn-success" name="btn_enviar" id="btn_enviar" onclick="return validar();" value="Aceptar">
    <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="regresar_calendario()">
</div>
<script>

    function activar_unidad(i)
    {
        asistencia=document.getElementById('cam_asistencia'+i);
        unidad=document.getElementById('cam_unidad'+i);
        if(asistencia.checked)
        {
            unidad.disabled=false;
        }
        else
        {
            unidad.disabled=true;
            unidad.value='';
            $("#coulmna_objetivo"+i).html('<label>Por favor seleccione una unidad</label>');
            document.getElementById('cam_observacion'+i).disabled=false;
        }
    }

    function desplegar_objetivos(i)
    {
        idunidad=document.getElementById('cam_unidad'+i).value;
        coulmna_objetivo=document.getElementById('coulmna_objetivo'+i);
        $.ajax({  
            type: "POST",  
            url: "../controlador/control_asignatura.php",  
            data: {idunidad:idunidad,i:i,operacion:"consular_objetivos"},  
            success: function(datos){
                if(datos!='0')
                {
                    $("#coulmna_objetivo"+i).html(datos);

                }
                else
                {
                    $("#coulmna_objetivo"+i).html('<label>Por favor seleccione una unidad</label>');                       
                }
            }
        });
    }

    function activar_observacion(i)
    {
        objetivo=document.getElementsByName('objetivo'+i+'[]');
        observacion=document.getElementById('cam_observacion'+i);
        for(j=0;j<objetivo.length;j++)
        {
            if(objetivo[j].checked)
            {
                observacion.disabled=false;
                break;
            }
            else
            {
                observacion.disabled=true;
                observacion.value='';
            }
        }
    }

    function validar()
    { 
        participante=document.getElementsByName('participante[]');
        for(i=0;i<participante.length;i++)
        {
            if($('#cam_asistencia'+i).prop('checked')==true)
            {
                if($('#cam_unidad'+i).val()!='')
                {
                    objetivo=document.getElementsByName("objetivo"+i+"[]");
                    if(objetivo.length>=1)
                    {
                        var vacio=false;
                        for(j=0;j<objetivo.length;j++)
                        {
                            if(objetivo[j].checked)
                                vacio=true;                        
                        }
                        if(vacio==false)
                        {
                            objetivo[0].focus();
                            alert("Debe seleccionar al menos un objetivo");
                            return false;
                        }
                    }
                }
                else
                {
                    $('#cam_unidad'+i).focus();
                    alert('Debe seleccionar una unidad');
                    return false;
                }
            }
            else
            {
                if($('#cam_observacion'+i).val()=='')
                {
                    $('#cam_observacion'+i).focus();
                    alert("Indique porqué el participante no asistió.");
                    return false;
                }
            }
        }


        for(i=0;i<participante.length;i++)
        {

            $('#cam_asistencia'+i).prop("disabled", false );
            $('#cam_unidad'+i).prop("disabled", false);
            $('#cam_observacion'+i).prop("disabled", false);
            objetivo=document.getElementsByName("objetivo"+i+"[]");
            for(j=0;j<objetivo.length;j++)
            {
                objetivo[j].disabled=false;
            }
            
        }
        return true;
    }

</script>