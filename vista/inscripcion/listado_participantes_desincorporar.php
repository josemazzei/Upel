<script>
 function desincorporar(id)
 {
    window.location.href="?vista=inscripcion/inscripcion_individual&id="+id+"&edad="+edad;
 }
</script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": 5                    
        });
    } );
</script>  
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3>Desincorporar por participante</h3>
      <div class="alert alert-info">
        <ul>
            En este módulo podrá seleccionar el participante a desincorporar.
        </ul>
    </div>
    <form action="#" method="POST" name="form_participante">
        <input type="hidden"  name="idparticipante" id="cam_idparticipante"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Foto</th><th>Cédula</th><th>Apellido Nombre</th><th>Edad</th><th>Nº Cursos</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_participante.php');
                    $lobjParticipante=new clsParticipante;
                    $laParticipantes=$lobjParticipante->participantes_inscritos();
                    for($i=0;$i<count($laParticipantes);$i++)
                    {
                        $laParticipantes[$i][22]=($laParticipantes[$i][22])?$laParticipantes[$i][22]:'default.png';
                        echo '<tr>';
                        echo '<td><img style="width:52px;height:52px;" src="../media/img/participantes/'.$laParticipantes[$i][22].'"/></td>';
                        echo '<td>'.$laParticipantes[$i][1].'</td>';
                        echo '<td>'.$laParticipantes[$i][4].' '.$laParticipantes[$i][5].' '.$laParticipantes[$i][2].' '.$laParticipantes[$i][3].'</td>';
                        echo '<td>'.$laParticipantes[$i][18].'</td>';
                        echo '<td>'.$laParticipantes[$i][19].'</td>';
                        echo '<td><a class="btn btn-warning" title="Desincorporar" href="?vista=inscripcion/desincorporar_participante&id='.$laParticipantes[$i][0].'"><i class="icon-edit icon-white"></i></a>';
                        echo '</tr>';
                    }
                ?>
            </tbody>
        </table>
    </form>
    
</div>