<div style="float: left;margin-bottom:50px;" class="col-lg-8 span8 pull-left">
    <h3>Mantenimiento de Base de datos</h3>
	<div class="row-fluid formulario">
		<div class="span4">
			<a href="../libreria/exportar_bd.php" target="_blank" class="btn btn-success"><i class="fa fa-download"></i> Exportar Bd</a>
		</div>
		<div class="span8">
			<form action="../libreria/restaurar_bd.php" method="POST" target="_blank" enctype="multipart/form-data">
				<input type="file" name="archivo">
				<button type="submit" value="restaurar" class="btn btn-warning"><i class="fa fa-upload"></i> Restaurar BD</button>
			</form>
		</div>
	</div>
</div>