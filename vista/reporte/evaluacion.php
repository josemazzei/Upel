<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='curso/consultar_evaluacion')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='curso/registrar_evaluacion')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='curso/eliminar_evaluacion')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=curso/consultar_evaluacion&id="+id;
 }
    function eliminar(id)
  {
      document.getElementById("cam_idevaluacion").value=id;
  }

  function descativar()
  {
     if(confirm("¿Esta seguro que desea desactivar la evaluacion seleccionada?"))
    {
      document.form_evaluacion.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar la evaluacion?"))
    {
      document.getElementById("cam_idevaluacion").value=id;
      document.getElementById("cam_operacion").value='restaurar_evaluacion';
      document.form_evaluacion.submit();
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
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Evaluaciones</h3>
    <form action="../controlador/control_evaluacion.php" method="POST" name="form_evaluacion">
        <input type="hidden" value="eliminar_evaluacion" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idevaluacion" id="cam_idevaluacion"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Fecha</th><th>Curso</th><th>Participante</th><th>Instrumento</th><th>Estatus</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_evaluacion.php');
                    $lobjEvaluacion=new clsEvaluacion;
                    $laEvaluaciones=$lobjEvaluacion->consultar_evaluaciones_inactivas();
                    for($i=0;$i<count($laEvaluaciones);$i++)
                    {
                        $dependencia=false;
                        $lobjEvaluacion->set_Evaluacion($laEvaluaciones[$i][0]);
                        //$dependencia=$lobjEvaluacion->consultar_dependencia();

                         if($laEvaluaciones[$i]['estatuseva'])
                        {
                            $laEvaluaciones[$i]['estatuseva']='Activo';
                        }
                        elseif(!$laEvaluaciones[$i]['estatuseva']) 
                        {
                            $laEvaluaciones[$i]['estatuseva']='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laEvaluaciones[$i]['idevaluacion'].'</td>';
                        echo '<td>'.$laEvaluaciones[$i]['fechaeva'].'</td>';
                        echo '<td>'.$laEvaluaciones[$i]['nombrecur'].'</td>';
                        echo '<td>'.$laEvaluaciones[$i]['nombreunopar'].' '.$laEvaluaciones[$i]['apellidounopar'].'</td>';
                        echo '<td>'.$laEvaluaciones[$i]['nombreins'].'</td>';
                        echo '<td>'.$laEvaluaciones[$i]['estatuseva'].'</td>';
                        echo '<td>';
                        echo '<a class="btn btn-success" href="../reporte/evaluacion.php?idevaluacion='.$laEvaluaciones[$i]['idevaluacion'].'" target="_blank"><i class="fa fa-file-text"></i></a>';
                        echo "</td>";

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Desactivar evaluacion</h4>
              </div>
              <div class="modal-body">
                   <div class="row">
                        <div class="col-lg-3 span3">
                            <label>Razón <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Razón por la cual desea desactivar la evaluación."><i class="fa fa-question" ></i></span></label>
                            <input type="text" class="span3"  name="razondesactiva" id="cam_razondesactiva" value=""/>
                        </div>
                   </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" onclick="descativar()">Desactivar</button>
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
</script>
