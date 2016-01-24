<script>
 function buscar(id)
 {
    window.location.href="?vista=curso/consultar_lapso&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea desactivar el lapso seleccionado?"))
    {
      document.getElementById("cam_idlapso").value=id;
      document.form_lapso.submit();
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
    <h3>Historial de lapso</h3>
    <form action="../controlador/control_lapso.php" method="POST" name="form_lapso">
        <input type="hidden" value="eliminar_lapso" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="idlapso" id="cam_idlapso"/>
        
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Estado</th><th>Estatus</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_lapso.php');
                    $lobjLapso=new clsLapso;
                    $laLapsos=$lobjLapso->consultar_lapsos();
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
                            echo '<td>';
                            echo '<a class="btn btn-success" href="../reporte/historial_lapso.php?idlapso='.$laLapsos[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a> </td>';
                            echo "</td>";
    

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>
