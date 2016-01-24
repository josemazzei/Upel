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
    <h3>Hoja de vida del participante</h3>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Dirección</th><th>Teléfono</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_participante.php');
                    $lobjParticipante=new clsParticipante;
                    $laParticipantes=$lobjParticipante->consultar_participantes();
                    for($i=0;$i<count($laParticipantes);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laParticipantes[$i][1].'</td>';
                        echo '<td>'.$laParticipantes[$i][2].' '.$laParticipantes[$i][4].'</td>';
                        echo '<td>'.$laParticipantes[$i][8].'</td>';
                        echo '<td>'.$laParticipantes[$i][7].'</td>';
                        echo '<td><a class="btn btn-success" href="../reporte/plantilla_inscripcion.php?idparticipante='.$laParticipantes[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <br>
    <br>
</div>