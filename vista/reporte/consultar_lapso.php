<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='curso/consultar_lapso')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='curso/registrar_lapso')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='curso/eliminar_lapso')
            {
                $eliminar=true;
            }
        }
    }
?>
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
    <h3>Lapsos</h3>
    <form action="../controlador/control_lapso.php" method="POST" name="form_lapso">
        <input type="hidden" value="eliminar_lapso" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idlapso" id="cam_idlapso"/>
        <a class="btn btn-success" id="btn_registrar" href="?vista=curso/registrar_lapso"><i class="icon-plus icon-white"></i> Aperturar lapso</a>

        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Estado</th><th>Estatus</th><?php if($consultar || $eliminar)
                        { echo '<th>Acción</th>';}?>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_lapso.php');
                    $lobjLapso=new clsLapso;
                    $laLapsos=$lobjLapso->consultar_lapsos_participante($_GET['idparticipante']);
                    for($i=0;$i<count($laLapsos);$i++)
                    {
                        $dependencia=false;
                        $lobjLapso->set_Lapso($laLapsos[$i][0]);
                        $dependencia=$lobjLapso->consultar_dependencia();

                         if($laLapsos[$i][5])
                        {
                            $laLapsos[$i][5]='Activo';
                        }
                        elseif(!$laLapsos[$i][5]) 
                        {
                            $laLapsos[$i][5]='Inactivo';
                        }
                        echo '<tr>';
                        echo '<td>'.$laLapsos[$i][0].'</td>';
                        echo '<td>'.$laLapsos[$i][1].'</td>';
                        echo '<td>'.$laLapsos[$i][2].'</td>';
                        echo '<td>'.$laLapsos[$i][3].'</td>';
                        echo '<td>'.$laLapsos[$i][4].'</td>';
                        echo '<td>'.$laLapsos[$i][5].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar)
                            {
                                echo '<a class="btn btn-info" href="#" title="Consultar" onclick="buscar('.$laLapsos[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar && $dependencia==false)
                            {
                                if($laLapsos[$i][5]=='Activo')
                                {
                                    echo '<a class="btn btn-danger" href="#" title="Desactivar" data-toggle="modal" data-target="#myModal" onclick="eliminar('.$laLapsos[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                elseif ($laLapsos[$i][5]=='Inactivo') 
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laLapsos[$i][0].')" ><i class="icon-refresh icon-white"></i></a>';
                                }
                            }
                            echo "</td>";
                        }

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
                <h4 class="modal-title" id="myModalLabel">Descactivar lapso</h4>
              </div>
              <div class="modal-body">
                   <div class="row">
                        <div class="col-lg-3 span3">
                            <label>Razón <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Razón por la cual desea desactivar la asignatura."><i class="fa fa-question" ></i></span></label>
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
