<?php
require_once('../clases/clase_curso.php');
require_once('../clases/clase_grupo.php');
require_once('../clases/clase_docente.php');
$lobjCurso=new clsCurso;
$lobjDocente = new clsDocente;
$idcurso = (isset($_GET['id']))?$_GET['id']:"-1";
$lobjCurso->set_Curso($idcurso);
$Datos_Curso=$lobjCurso->consultar_datos_inscripcion();
$laDocentes= $lobjDocente->consultar_docentes();



?>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
        oTable = $('#filtro2').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );

</script>  
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Inscribir Participantes</h3>
    <form action="../controlador/control_inscripcion_curso.php" method="POST" name="form_lapso">
        <input type="hidden" value="inscribir_curso" name="operacion" />
        <input type="hidden" value="<?php print($Datos_Curso[0]);?>" name="idcurso" />
        <input type="hidden" value="<?php print($Datos_Curso[3]);?>" name="capacidad" />
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Nombre</b> <?php print($Datos_Curso[1]); ?></label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Asignatura</b> <?php print($Datos_Curso[10]); ?> </label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Grupo</b> <?php print($Datos_Curso[8]); ?></label>
            </div>
            
            <div class="col-lg-6 span6">
                <label><b>Capacidad</b> <?php print($Datos_Curso[3]); ?> </label>
            </div>
        </div>
         <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Lapso</b> <?php print($Datos_Curso[7]); ?> </label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Inscritos</b> <?php print($Datos_Curso[12]); ?> </label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Responsable:</b></label>
                <select class="span10" id="cam_idresponsable" name="idresponsable" required>
                            <option value="">Seleccione un Docente.</option>
                <?php 
                    for($a=0;$a<count($laDocentes);$a++)
                    {
                        echo '<option value="'.$laDocentes[$a][0].'" id="'.$laDocentes[$a][3].'" >'.$laDocentes[$a][0].' - '.$laDocentes[$a][1].'  '.$laDocentes[$a][3].'</option>';
                    } 
                ?>
                </select>
            </div>
        </div>
            <h5>Participantes</h5>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro"> 
            <thead>
                <th>Foto</th><th>Cedula</th><th>Apellidos</th><th>Nombre</th><th>Edad</th><th>Inscribir</th><th>Fecha</th>
            </thead>
            <tbody>
            <?php
                    if($idcurso)
                    {
                        $lobjCurso->set_Asignatura($Datos_Curso[11]);
                        $laParticipantes=$lobjCurso->consultar_participantes_noinscritos();
                        for($i=0;$i<count($laParticipantes);$i++)
                        {
                            $laParticipantes[$i][6]=($laParticipantes[$i][6])?$laParticipantes[$i][6]:'default.png';
                            echo '<tr>';
                            echo '<td><img style="width:52px;height:52px;" src="../media/img/participantes/'.$laParticipantes[$i][6].'"/></td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][4].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][2].' '.$laParticipantes[$i][3].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][0].' '.$laParticipantes[$i][1].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][7].'</td>';
                            if($i<$Datos_Curso[3])
                            {
                                $checked="checked";
                            }
                            echo '<td style="padding-top:20px"><input type="checkbox" onclick="activar_motivo(this,'.$i.')" style=" -ms-transform: scale(2);-moz-transform: scale(2);-webkit-transform: scale(2);-o-transform: scale(2);" name="participante_inscribir[]" value="'.$laParticipantes[$i][5].'" '.$checked.'/></td>';
                            echo '<td><div class="input-append date datepicker"   data-date="'.date('d-m-Y').'"  data-date-format="dd-mm-yyyy">
                            <input type="text" class="span2" value="'.date('d-m-Y').'"  name="fecha[]"  id="cam_fecha'.$i.'" value="" />
                          <span class="add-on"><i class="icon-calendar"></i></span>
                        </div></td>';
                            echo '</tr>';
                                $checked="";

                        }
                    }
                    else
                    {
                        echo '<tr><td colspan="4">NO EXISTE EL CURSO SELECCIONADO</td></tr>';
                    }
                ?>
                </tbody>
        </table>
        <h5>Participantes Inscritos</h5>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro2"> 
            <thead>
                <th>Foto</th><th>Cedula</th><th>Apellidos</th><th>Nombre</th>
            </thead>
            <tbody>
            <?php
                    if($idcurso)
                    {
                        $laParticipantes=$lobjCurso->consultar_participantes_inscritos();
                        for($i=0;$i<count($laParticipantes);$i++)
                        {
                            $laParticipantes[$i][6]=($laParticipantes[$i][6])?$laParticipantes[$i][6]:'default.png';
                            echo '<tr>';
                            echo '<td><img style="width:52px;height:52px;" src="../media/img/participantes/'.$laParticipantes[$i][6].'"/></td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][4].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][2].' '.$laParticipantes[$i][3].'</td>';
                            echo '<td style="padding-top:20px">'.$laParticipantes[$i][0].' '.$laParticipantes[$i][1].'</td>';
                            if($i<$Datos_Curso[3])
                            {
                                $checked="checked";
                            }
                           echo '</tr>';
                                $checked="";

                        }
                    }
                    else
                    {
                        echo '<tr><td colspan="4">NO EXISTE EL CURSO SELECCIONADO</td></tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="botonera">
            <input type="submit" class="btn btn-success" onclick="return validar()" name="btn_enviar" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=inscripcion/listado_cursos_inscribir';">
        </div>
    </form>
</div>
<script>
$(document).ready(function(){
$('.datepicker').datepicker({
    endDate: "<?php print(date('d-m-Y'));?>"
});
});
    function activar_motivo(e,i)
    {
        fecha=document.getElementById("cam_fecha"+i);
        if(e.checked==true)
        {
            fecha.disabled=false;
        }
        else if(e.checked==false)
        {
            fecha.disabled=true;
        }
    }

    function validar()
    {
        participante_inscribir=document.getElementsByName('participante_inscribir[]');
        fecha=document.getElementsByName('fecha[]');
        for(i=0;i<participante_inscribir.length;i++)
        {
            if(participante_inscribir[i].checked==true)
            {
                if(fecha[i].value=='')
                {
                    fecha[i].focus();
                    alert("Por favor seleccione la fecha en la cual se incorpora al participante.");   
                    return false;
                }

            }
        }
        return true;
    }
</script>