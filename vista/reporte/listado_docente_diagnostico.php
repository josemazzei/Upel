
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
    <h3>Listado de docentes por condición visual</h3>
    <form action="../controlador/control_diagnostico.php" method="POST" name="form_diagnostico">
        <input type="hidden" value="eliminar_diagnostico" name="operacion" id="cam_operacion"/>
        <input type="hidden"  name="iddiagnostico" id="cam_iddiagnostico"/>
        <?php
        if($registrar)
        {
            echo '<a id="btn_registrar" class="btn btn-success" href="?vista=archivo/registrar_diagnostico"><i class="icon-plus icon-white"></i> Registrar diagnostico</a>';
        }
        ?>
        <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable" id="filtro">
            <thead>
                <th>Código</th><th>Nombre</th><th>Acción</th>
            </thead>
            <tbody>
            <?php
                    require_once('../clases/clase_diagnostico.php');
                    $lobjDiagnostico=new clsDiagnostico;
                    $laDiagnosticos=$lobjDiagnostico->consultar_diagnosticos_inactivos();
                    for($i=0;$i<count($laDiagnosticos);$i++)
                    {
                        $dependencia=false;
                        $lobjDiagnostico->set_Diagnostico($laDiagnosticos[$i][0]);
                        $dependencia=$lobjDiagnostico->consultar_dependencia();
                        if($laDiagnosticos[$i][2])
                        {
                            $laDiagnosticos[$i][2]='Activo';
                        }
                        elseif(!$laDiagnosticos[$i][2]) 
                        {
                            $laDiagnosticos[$i][2]='Inactivo';
                        }

                        echo '<tr>';
                        echo '<td>'.$laDiagnosticos[$i][0].'</td>';
                        echo '<td>'.$laDiagnosticos[$i][1].'</td>';
                        echo '<td><a class="btn btn-success" href="../reporte/listado_docentes_diagnostico.php?id_diagnostico='.$laDiagnosticos[$i][0].'" target="_blank"><i class="fa fa-file-text"></i></a></td>';
                            

                        echo '</tr>';
                    }
                ?>
                </tbody>
        </table>
    </form>
    
</div>