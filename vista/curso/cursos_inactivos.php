<script>
 function buscar(id)
 {
    window.location.href="?vista=curso/detalle_curso_inactivo&id="+id;
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
    <h3>Cursos inactivo</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá consultar los curso inactivo y los participante que estuvieron inscrito en dicho curso.
    </div> 
    <form action="../controlador/control_curso.php" method="POST" name="form_lapso">
        <input type="hidden" value="eliminar_curso" name="operacion" />
        <input type="hidden"  name="idlapso" id="cam_idlapso"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Lapso</th><th>Grupo</th><th>Nombre</th><th>Capacidad</th><th>Inscrito</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_curso.php');
                    $lobjCurso=new clsCurso;
                    $laCursos=$lobjCurso->consultar_cursos_inactivos();
                    for($i=0;$i<count($laCursos);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laCursos[$i][0].'</td>';
                        echo '<td>'.$laCursos[$i][7].'</td>';
                        echo '<td>'.$laCursos[$i][8].'</td>';
                        echo '<td>'.$laCursos[$i][1].'</td>';
                        echo '<td>'.$laCursos[$i][3].'</td>';
                        echo '<td>'.$laCursos[$i][10].'</td>';
                        echo '<td><a class="btn btn-info" title="Consultar" onclick="buscar('.$laCursos[$i][0].')"><i class="icon-search icon-white"></i></a></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>
