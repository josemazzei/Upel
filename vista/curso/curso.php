<script>
 function buscar(id)
 {
    window.location.href="?vista=curso/detalle_curso_activo&id="+id;
 }
   function cerrar(id)
  {
      document.getElementById("cam_idcurso").value=id;
      consultar_cursos(id);
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
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Curso activo / trasladar y cerrar curso</h3>
    <div class="alert alert-info">
        <ul>
            En este módulo podrá consultar los curso activo, los participante inscrito en dicho curso y también podrá trasladar curso a otro similar.   
        </ul>
    </div> 
    <form action="../controlador/control_curso.php" method="POST" name="form_curso">
        <input type="hidden" value="cerrar_curso" name="operacion" />
        <input type="hidden"  name="idcurso" id="cam_idcurso"/>
        
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Lapso</th><th>Grupo</th><th>Nombre</th><th>Inscritos</th><th>Capacidad</th><th>Docente</th><th>Acción</th>
            </thead>
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
                        echo '<td>'.$laCursos[$i][7].'</td>';
                        echo '<td>'.$laCursos[$i][8].'</td>';
                        echo '<td>'.$laCursos[$i][1].'</td>';
                        echo '<td>'.$laCursos[$i][10].'</td>';
                        echo '<td>'.$laCursos[$i][3].'</td>';
                        echo '<td>'.$laCursos[$i][13].' - '.$laCursos[$i][12].' '.$laCursos[$i][11].'</td>';
                        echo '<td><a class="btn btn-info" title="Consultar curso" onclick="buscar('.$laCursos[$i][0].')"><i class="icon-search icon-white"></i></a> <a class="btn btn-danger" data-toggle="modal" data-target="#myModal" title="Trasladar /Cerrar Curso" onclick="cerrar('.$laCursos[$i][0].')"><i class="icon-lock icon-white"></i></a></td>';

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"> Trasladar a otro curso similar y cerrar</h4>
              </div>
              <div class="modal-body">
                   <div class="row">
                        <div class="col-lg-3 span3">
                            <label>Curso <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Motivo por la cual desea desactivar la asignatura."><i class="fa fa-question" ></i></span></label>
                            <select class="span3"  name="idcurso_nuevo" id="cam_idcurso_nuevo" >

                            </select>
                        </div>
                        <div class="col-lg-3 span3">
                            <label>Motivo <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Motivo por la cual desea desactivar el curso."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span3"  name="razondesactiva" id="cam_razondesactiva" value=""/>
                        </div>
                   </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" onclick="cerrar_curso()">Trasladar y cerrar</button>
              </div>
            </div>
          </div>
      </div>
    </form>
</div>
<script>
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus()
      })

    function consultar_cursos(id)
    {
        $.ajax({  
            type: "POST",  
            url: "../controlador/control_curso.php",  
            data: {idcurso:id,operacion:"consultar_cursos_iguales"},  
            success: function(datos){
                if(datos!='0')
                {
                    $("#cam_idcurso_nuevo").html(datos);
                    cerrar='1'

                }
                else
                {
                    $("#cam_idcurso_nuevo").html('<option>No se encontró un curso similar al que se desea cerrar</option>');
                    cerrar='0'
                }
            }
        });
    }


      function cerrar_curso()
    {
    if(cerrar=='1')
      {
        if(confirm("¿Esta seguro que desea trasladar a otro similar y cerrar el curso seleccionado?"))
    
        {
          document.form_curso.submit();
        }
      } 
    else if(cerrar=='0') 
    {
      alert('No se pudo trasladar el curso por que no existe ninguno igual')

    }
  
  }

</script>
