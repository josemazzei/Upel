<?php
include('../clases/clase_participante.php');
require_once('../clases/clase_docente.php');
$lobjParticipante = NEW clsParticipante();
$lobjDocente = new clsDocente;
$id=(isset($_GET['id']))?$_GET['id']:"";

$lobjParticipante->set_Idparticipante($id);
$Datos_Participante = $lobjParticipante->consultar_participante_bitacora();
$laDocentes= $lobjDocente->consultar_docentes();

?>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 10                    
        });
    } );
</script>  
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Participante</h3>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Nombres</b> <?php print($Datos_Participante['nombreunopar'].' '.$Datos_Participante['nombredospar']); ?></label>
            </div>
            <div class="col-lg-6 span6">
                <label><b>Apellidos</b> <?php print($Datos_Participante['apellidounopar'].' '.$Datos_Participante['apellidodospar']); ?> </label>
            </div>
        </div>
        <div class="row-fluid">
            <div class="col-lg-6 span6">
                <label><b>Sexo</b> <?php print(($Datos_Participante['sexopar']=='F')?'Femenino':'Masculino'); ?></label>
            </div>
            
            <div class="col-lg-6 span6">
                <label><b>Edad</b> <?php print($_GET['edad']); ?> Años</label>
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
    <h3>CURSOS INSCRITOS</h3>
    <form action="../controlador/control_inscripcion.php" method="POST" name="form_inscripcion">
        <input type="hidden" value="desincorporar_participante" name="operacion" />
        <input type="hidden" value="<?php echo $_GET['id'];?>" name="idparticipante" />
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Capacidad</th><th>Grupo</th><th>Asignatura</th><th>Desincorporar</th><th>Fecha</th><th>Motivo</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_curso.php');
                    $lobjCurso=new clsCurso;
                    $laCursos=$lobjCurso->cursos_inscritos($_GET['id']);
                    for($i=0;$i<count($laCursos);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laCursos[$i][0].'</td>';
                        echo '<td>'.$laCursos[$i][1].'</td>';
                        echo '<td>'.$laCursos[$i][3].'</td>';
                        echo '<td>'.$laCursos[$i][8].'</td>';
                        echo '<td>'.$laCursos[$i][11].'</td>';
                        echo '<td><input type="checkbox" style=" -ms-transform: scale(2);-moz-transform: scale(2);-webkit-transform: scale(2);-o-transform: scale(2);" onclick="activar_motivo(this,'.$i.')" name="idcurso[]" value="'.$laCursos[$i][0].'" /></td>';
                       echo '<td><div class="input-append date datepicker"   data-date="'.date('d-m-Y').'"  data-date-format="dd-mm-yyyy">
                            <input type="text" class="span2" value="'.date('d-m-Y').'"  name="fecha[]"  id="cam_fecha'.$i.'" value="" disabled/>
                          <span class="add-on"><i class="icon-calendar"></i></span>
                        </div></td>';
                        echo '<td><textarea name="motivo[]" id="cam_motivo'.$i.'" disabled></textarea></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
            <div class="botonera">
            <input type="submit" class="btn btn-success" name="btn_enviar" onclick="return validar()" id="btn_enviar" value="Aceptar">
            <input type="button" class="btn btn-danger" name="btn_regresar" id="btn_regresar" value="Regresar" onclick="window.location.href='?vista=inscripcion/listado_participantes_desincorporar';">
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
        motivo=document.getElementById("cam_motivo"+i);
        fecha=document.getElementById("cam_fecha"+i);
        if(e.checked==true)
        {
            motivo.disabled=false;
            fecha.disabled=false;
        }
        else if(e.checked==false)
        {
            motivo.disabled=true;
            fecha.disabled=true;
        }
    }

    function validar()
    {
        idcurso=document.getElementsByName('idcurso[]');
        motivo=document.getElementsByName('motivo[]');
        fecha=document.getElementsByName('fecha[]');
        for(i=0;i<idcurso.length;i++)
        {
            if(idcurso[i].checked==true)
            {
                if(fecha[i].value=='')
                {
                    fecha[i].focus();
                    alert("Por favor seleccione la fecha en la cual se desincorporar al participante.");   
                    return false;
                }
                if(motivo[i].value=='')
                {
                    motivo[i].focus();
                    alert("Por favor ingrese el motivo por el cual se desincorporar participante.");
                    return false;
                }
            }
        }
        return true;
    }
</script>