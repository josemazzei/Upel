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
    window.location.href="?vista=persona/historial_participante_detalle&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea eliminar el participante seleccionado?"))
    {
      document.getElementById("cam_idparticipante").value=id;
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
<div style="float: left" class="col-lg-8 span8 pull-left">
    <h3> Historial participante inscrito por cursos</h3>
    <form action="../controlador/control_inscripcion.php" method="POST" name="form_participante">
        <input type="hidden" value="eliminar_participante" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idparticipante" id="cam_idparticipante"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Dirección</th><th>Teléfono</th><th>Estatus</th><th>Acción</th>
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
                        echo '<td>'.$laParticipantes[$i][8].'</td>';
                        echo '<td>'.$laParticipantes[$i][7].'</td>';
                        echo '<td>'.$laParticipantes[$i][17].'</td>';
                            echo '<td>';

                            echo '<a class="btn btn-success" href="../reporte/historial_participante.php?idparticipante='.$laParticipantes[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a> </td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
    
</div>