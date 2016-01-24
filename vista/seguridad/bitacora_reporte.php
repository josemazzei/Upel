
<script>
 function buscar(id)
 {
    window.location.href="?vista=seguridad/consultar_bitacora_reporte&id="+id;
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
<div style="float: left" class="col-lg-11 span11 pull-left">
    <h3>Auditoria de reporte</h3>
    <form action="" method="POST" >
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>dirección</th><th>Fecha/hora</th><th>Usuario</th><th>Reporte</th><th>Código</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_bitacora.php');
                    $lobjBitacora=new clsBitacora;
                    $laBitacoras=$lobjBitacora->listar_bitacora_reporte();
                    for($i=0;$i<count($laBitacoras);$i++)
                    {
                        echo '<tr>';
                        echo '<td>'.$laBitacoras[$i][0].'</td>';
                        echo '<td>'.$laBitacoras[$i][1].'</td>';
                        echo '<td>'.$laBitacoras[$i][2].'</td>';
                        echo '<td>'.$laBitacoras[$i][4].'</td>';
                        echo '<td>'.$laBitacoras[$i][5].'</td>';
                        echo '<td>'.$laBitacoras[$i][6].'</td>';
                        echo '<td><a class="btn btn-info" href="#" onclick="buscar('.$laBitacoras[$i][0].')"><i class="icon-search icon-white"></i></a>
                        <a class="btn btn-success" href="../reporte/'.$laBitacoras[$i][5].'.php?'.$laBitacoras[$i][10].'='.$laBitacoras[$i][7].'" target="_blank" ><i class="fa fa-file-text"></i></a></td>';
                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
</div>