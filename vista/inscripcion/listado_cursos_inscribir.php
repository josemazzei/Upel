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
    <h3>Inscripción masiva por curso</h3>
     <div class="alert alert-info">
        <ul>
            En este módulo podrá seleccionar el curso en donde quiera inscribir participante.
        </ul>
    </div>
    <form action="../controlador/control_curso.php" method="POST" name="form_lapso">
        <input type="hidden" value="eliminar_curso" name="operacion" />
        <input type="hidden"  name="idlapso" id="cam_idlapso"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Lapso</th><th>Grupo</th><th>Asignatura</th><th>Nombre</th><th>Capacidad</th><th>Inscritos</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_curso.php');
                    $lobjCurso=new clsCurso;
                    $laCursos=$lobjCurso->consultar_cursos_inscripcion();
                    for($i=0;$i<count($laCursos);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laCursos[$i][7].'</td>';
                        echo '<td>'.$laCursos[$i][8].'</td>';
                        echo '<td>'.$laCursos[$i][10].'</td>';
                        echo '<td>'.$laCursos[$i][1].'</td>';
                        echo '<td>'.$laCursos[$i][3].'</td>';
                        echo '<td>'.$laCursos[$i][11].'</td>';
                        echo '<td><a class="btn btn-warning" title="Inscribir" href="?vista=inscripcion/inscripcion_masiva&id='.$laCursos[$i][0].'"><i class="icon-edit icon-white"></i></a></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>
