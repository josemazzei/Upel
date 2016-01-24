<div style="float: left;margin-bottom:50px;" class="col-lg-10 span10 pull-left">
<h2>Bienvenido al Sistema</h2>
	<div class="row-fluid">
		<div class="span6">
			<table class="table table-striped table-hover table-bordered bootstrap-datatable datatable dataTable">
				<tr>
					<th>Ultimo acceso</th>
					<td><?php echo $_SESSION['ultimo_acceso'];?></td>
				</tr>
				<tr>
					<th>Tiempo de conexión</th>
					<td><?php echo $_SESSION['tiempo'];?></td>
				</tr>
			</table>
		</div>
		<div class="span6">
			<img src="../media/images/logo.jpg" style="width:100%;height:300px;" alt="">
		</div>
	</div>
</div>
