
<script>
 function buscar(id)
 {
    window.location.href="?vista=seguridad/consultar_bitacora&id="+id+"&o=Consultar";
 }

</script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        oTable = $('#filtro').dataTable({
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
             "aaSorting": [[ 0, "desc" ]],
            "iDisplayLength": 10                    
        });
    } );
</script>   
<div style="float: left" class="col-lg-10 span10 pull-left">
    <h3>Auditoria de sistema</h3>
    <form action="../controlador/control_servicio.php" method="POST" name="form_servicio">
        <input type="hidden" value="eliminar_servicio" name="operacion" />
        <input type="hidden"  name="idservicio" id="cam_idservicio"/>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>dirección</th><th>Fecha/hora</th><th>Usuario</th><th>Servicio</th><th>Operación</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_bitacora.php');
                    $lobjBitacora=new clsBitacora;
                    $laBitacoras=$lobjBitacora->listar_bitacora();
                    for($i=0;$i<count($laBitacoras);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laBitacoras[$i][0].'</td>';
                        echo '<td>'.$laBitacoras[$i][1].'</td>';
                        echo '<td>'.$laBitacoras[$i][2].'</td>';
                        echo '<td>'.$laBitacoras[$i][4].'</td>';
                        echo '<td>'.$laBitacoras[$i][5].'</td>';
                        echo '<td>'.$laBitacoras[$i][8].'</td>';
                        echo '<td><a class="btn btn-info" href="#" onclick="buscar('.$laBitacoras[$i][0].')"><i class="icon-search icon-white"></i></a></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>