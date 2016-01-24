<script>
 function buscar(id)
 {
    window.location.href="?vista=curso/detalle_curso_activo&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea eliminar el lapso seleccionado?"))
    {
      document.getElementById("cam_idlapso").value=id;
      document.form_localidad.submit();
    }
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
    <h3>Historial de Cursos</h3>
    <form action="../controlador/control_curso.php" method="POST" name="form_lapso">
        <input type="hidden" value="eliminar_curso" name="operacion" />
        <input type="hidden"  name="idlapso" id="cam_idlapso"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Grupo</th><th>Lapso</th><th>Acción</th>
            </thead>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_curso.php');
                    $lobjCurso=new clsCurso;
                    $laCursos=$lobjCurso->consultar_cursos();
                    for($i=0;$i<count($laCursos);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laCursos[$i][0].'</td>';
                        echo '<td>'.$laCursos[$i][1].'</td>';
                        echo '<td>'.$laCursos[$i][8].'</td>';
                        echo '<td>'.$laCursos[$i][7].'</td>';
                        echo '<td>';
                        echo '<a class="btn btn-success" href="../reporte/historial_curso.php?idcurso='.$laCursos[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a> </td>';
                        echo '</td>';

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>
