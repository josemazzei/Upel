<script>
 function buscar(id)
 {
    window.location.href="?vista=persona/consultar_participante&id="+id;
 }
  function eliminar(id)
  {
     if(confirm("¿Esta seguro que desea eliminar el participante seleccionado?"))
    {
      document.getElementById("cam_idparticipante").value=id;
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
    <h3>Familiar por participante</h3>
    <form action="../controlador/control_participante.php" method="POST" name="form_participante">
        <input type="hidden" value="eliminar_participante" name="operacion" />
        <input type="hidden"  name="idparticipante" id="cam_idparticipante"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Cédula</th><th>Apellido Nombre</th><th>Dirección</th><th>Teléfono</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_familiar.php');
                    $lobjFamiliar=new clsFamiliar;
                    $laFamiliar=$lobjFamiliar->consultar_familiares();
                    for($i=0;$i<count($laFamiliar);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laFamiliar[$i][0].'</td>';
                        echo '<td>'.$laFamiliar[$i][1].' '.$laFamiliar[$i][3].'</td>';
                        echo '<td>'.$laFamiliar[$i][7].'</td>';
                        echo '<td>'.$laFamiliar[$i][8].'</td>';
                        echo '<td><a class="btn btn-success" href="../reporte/familiar_participante.php?id='.$laFamiliar[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
    
</div>