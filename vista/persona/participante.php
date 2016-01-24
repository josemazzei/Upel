<?php
$consultar= $registrar= $eliminar=false;
for($i=0;$i<count($laModulos);$i++) 
    {
         
        $laServicios=$lobjRol->consultar_servicios_menu($laModulos[$i][0]); 
        for ($j=0; $j <count($laServicios) ; $j++) //Se recorre un ciclo para poder extraer los datos de cada uno de los servicios que tiene asignado el modulo para poder constuir el menú
        {
            if($laServicios[$j][2]=='persona/consultar_participante')
            {
                $consultar=true;
            }
            if($laServicios[$j][2]=='persona/registrar_participante')
            {
                $registrar=true;
            }
            if($laServicios[$j][2]=='persona/eliminar_participante')
            {
                $eliminar=true;
            }
        }
    }
?>
<script>
 function buscar(id)
 {
    window.location.href="?vista=persona/consultar_participante&id="+id;
 }
  function eliminar(id)
  {
      document.getElementById("cam_idparticipante").value=id;
  }

  function descativar()
  {
     if(confirm("¿Esta seguro que desea desactivar el participante seleccionado?"))
    {
      document.form_participante.submit();
    }
  }
  function restaurar(id)
  {
     if(confirm("¿Esta seguro que desea restaurar el docente seleccionado?"))
    {
      document.getElementById("cam_idparticipante").value=id;
      document.getElementById("cam_operacion").value='restaurar_participante';
      document.form_participante.submit();
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
    <h3>Participante</h3>
    <form action="../controlador/control_inscripcion.php" method="POST" name="form_participante">
        <input type="hidden" value="eliminar_participante" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idparticipante" id="cam_idparticipante"/>
        <a class="btn btn-success" id="btn_registrar" href="?vista=persona/registrar_participante"><i class="icon-plus icon-white"></i> Registrar Hoja de vida</a>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Edad</th><th>Dirección</th><th>Teléfono</th><th>Estatus</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_participante.php');
                    $lobjParticipante=new clsParticipante;
                    $laParticipantes=$lobjParticipante->consultar_participantes();
                    for($i=0;$i<count($laParticipantes);$i++)
                    {
                        if($laParticipantes[$i][17])
                        {
                            $laParticipantes[$i][17]='Activo';
                        }
                        elseif(!$laParticipantes[$i][17]) 
                        {
                            $laParticipantes[$i][17]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laParticipantes[$i][1].'</td>';
                        echo '<td>'.$laParticipantes[$i][2].' '.$laParticipantes[$i][4].'</td>';
                        echo '<td>'.$laParticipantes[$i][21].'</td>';
                        echo '<td>'.$laParticipantes[$i][8].'</td>';
                        echo '<td>'.$laParticipantes[$i][7].'</td>';
                        echo '<td>'.$laParticipantes[$i][17].'</td>';
                        if($consultar || $eliminar)
                        {
                            echo '<td>';
                            if($consultar && $laParticipantes[$i][17]=='Activo')
                            {
                                echo '<a class="btn btn-info" title="Consultar" onclick="buscar('.$laParticipantes[$i][0].')"><i class="icon-search icon-white"></i></a> ';
                            }
                            if($eliminar)
                            {
                                if($laParticipantes[$i][17]=='Activo')
                                {
                                echo '<a class="btn btn-danger" href="#" title="Desactivar" data-toggle="modal" data-target="#myModal" onclick="eliminar('.$laParticipantes[$i][0].')" ><i class="icon-remove icon-white"></i></a> ';
                                }
                                if($laParticipantes[$i][17]=='Inactivo')
                                {
                                    echo '<a class="btn btn-warning" title="Restaurar" href="#" onclick="restaurar('.$laParticipantes[$i][0].')" ><i class="icon-refresh icon-white"></i></a> ';
                                }
                            }
                            echo '<a class="btn btn-success" href="../reporte/plantilla_inscripcion.php?idparticipante='.$laParticipantes[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a> </td>';
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
                <h4 class="modal-title" id="myModalLabel">Descactivar participante</h4>
              </div>
              <div class="modal-body">
                   <div class="row">
                        <div class="col-lg-3 span3">
                            <label>Razón <span class="label label-warning" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="Razón por la cual desea desactivar al participante."><i class="fa fa-question" ></i></span></label>
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