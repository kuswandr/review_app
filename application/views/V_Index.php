<!DOCTYPE html>
<html>
<head>
	<title>Review App</title>
	<link href="<?php echo base_url('assets/plugins/bootstrap/3.3.6/css/bootstrap.min.css') ?>" rel="stylesheet" type="text/css" />
	<link href="<?php echo base_url('assets/plugins/Font-Awesome/3.2.0/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css" />
		<link href="<?php echo base_url('assets/plugins/Font-Awesome/4.3.0/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.btn{
			border-radius: 20px !important;
		}
		.str-rating {
			cursor: pointer;
		}
		.checked {
		  color: orange;
		}
	</style>
</head>
<body>
<div class="container">
	<div class="col-md-12">
		<form method="post" action="http://travling.id:8080/api/v1/reviews/" target="_blank">
		<table width="100%" class="table">
			<tr>
				<td>
					<b><h2>Review</h2></b>
				</td>
				<td class="text-right">
					<span rate="1" class="str-rating fa fa-2x fa-star"></span>
					<span rate="2" class="str-rating fa fa-2x fa-star"></span>
					<span rate="3" class="str-rating fa fa-2x fa-star"></span>
					<span rate="4" class="str-rating fa fa-2x fa-star"></span>
					<span rate="5" class="str-rating fa fa-2x fa-star"></span>
					<input type="hidden" name="rating">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control" name="review" placeholder="Insert text review.."></textarea>
				</td>
			</tr>
			<tr>
				<td class="text-left">
					<input type="file" class="btn btn-primary" id = "imagess"name="imagess">
					<input type="hidden" class="btn btn-primary" id = "image" name="image">
				</td>
				<td class="text-right">
					<button class="btn btn-md btn-success submittt" type="submit" disabled="disabled" >Kirim</button>
				</td>
			</tr>
		</form>
		</table>
	</div>
	<div class="col-md-12">
		
	</div>
</div>
</body>
<script type="text/javascript" src="<?php echo base_url('assets/js/jQuery-2.2.0.min.js')?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/plugins/bootstrap/3.3.6/js/bootstrap.min.js')?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/js/custom.js')?>"></script>
</html>