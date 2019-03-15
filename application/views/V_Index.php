<!DOCTYPE html>
<html>
<head>
	<title>Review App</title>
	<link href="<?php echo base_url('assets/plugins/bootstrap/3.3.6/css/bootstrap.min.css') ?>" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/Font-Awesome/3.2.0/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.btn{
			border-radius: 20px !important;
		}
		.checked {
		  color: orange;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="col-md-12">
		<table width="100%" class="table">
			<tr>
				<td>
					<h4>Review</h4>
				</td>
				<td>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control">
						
					</textarea>
				</td>
			</tr>
			<tr>
				<td class="text-left">
					<button class="btn btn-md btn-default">Upload Gambar</button>
				</td>
				<td class="text-right">
					<button class="btn btn-md btn-success">Kirim</button>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
<script type="text/javascript" src="<?php echo base_url('assets/js/jQuery-2.2.0.min.js')?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/plugins/bootstrap/3.3.6/js/bootstrap.min.js')?>"></script>
</html>