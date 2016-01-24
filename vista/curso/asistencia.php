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
    <h3>Asistencia</h3>
     <div class="alert alert-info">
        <ul>
            En este módulo podrá registrar, consultar, editar e imprimir la asistencia de los participantes partiendo de un curso.
        </ul>
    </div> 
    <h5>Listado de Curso</h3>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Capacidad</th><th>Inscritos</th><th>Grupo</th><th>Lapso</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_curso.php');
                    $lobjCurso=new clsCurso;
                    $laCursos=$lobjCurso->consultar_cursos_activos();
                    for($i=0;$i<count($laCursos);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laCursos[$i][0].'</td>';
                        echo '<td>'.$laCursos[$i][1].'</td>';
                        echo '<td>'.$laCursos[$i][3].'</td>';
                        echo '<td>'.$laCursos[$i][10].'</td>';
                        echo '<td>'.$laCursos[$i][8].'</td>';
                        echo '<td>'.$laCursos[$i][7].'</td>';
                        echo '<td><a class="btn btn-warning" title="Registrar asistencia"href="?vista=curso/registrar_asistencia&id='.$laCursos[$i][0].'"><i class="icon-edit icon-white"></i></a></td>';

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
</div>
