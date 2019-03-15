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
		<form method="post" id="formrate" action="http://travling.id:8080/api/v1/reviews/" target="_blank">
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
						<button class="btn btn-md btn-success submittt" type="button" >Kirim</button>
				</td>
			</tr>
		</form>
		</table>
	</div>
	<div class="col-md-12">
	<h4>Result Ratings:</h4>
			<div class="col-md-12">
					<?php if ($hasil) { 
						foreach ($hasil['data'] as $key => $value) { ?>
				<table class="table table-responsive table-bordered">
					<tr class="bg-success">
						<td width="20%">
							<b>
								user <?= $value['id'] ?>
							</b>
						</td>
						<td width="40%">
							<?php
								for ($i=1; $i < 6; $i++) {  ?>
								<span rate="<?= $i ?>" class="fa fa-star <?= $value['rating'] != '0' ? (($value['rating'] >= $i) ? 'checked' : '') :'' ?>"></span>
							<?php 	}
							echo $value['rating'];
							?>
						</td>
						<td class="text-right" width="40%">
							<input type="hidden" name="rate_u" value="<?= $value['rating'] ?>">
							<input type="hidden" name="review_u" value="<?= $value['review'] ?>">
							<button class="btn btn-xs btn-danger delrow" id="<?= $value['id'] ?>"> <b class="fa fa-times "></b></button>
							<button data-toggle="modal" data-target="#myModal" class="btn btn-xs btn-primary btnedit"> <b class="fa fa-edit "></b></button>
						</td>
					</tr>
					<tr >
						<td colspan="3">
							<i>
								<?= $value['review'] ?>
								<?php if ($value['image']) { ?>
									<img src="<?= $value['image'] ?>" alt="" />
								<?php } ?>
							</i>
						</td>
					</tr>
				</table>
				<?php } } ?>
			</div>
			
	</div>
	<div id="myModal" class="modal fade" role="dialog">
							  <div class="modal-dialog">

							    <!-- Modal content-->
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal">&times;</button>
							        <h4 class="modal-title">Edit Data</h4>
							      </div>
							      <div class="modal-body">
							      	<form method="post" id="formUpdate" action="http://travling.id:8080/api/v1/reviews/" target="_blank">
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
											</td>
										</tr>
									</form>
									</table>
							      </div>
							      <div class="modal-footer">
							        <button type="submit" class="btn btn-success" >Update Data</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							      </div>
							      	</form>
							    </div>
							  </div>
						</div>
</div>
</body>
<script type="text/javascript">
	
var baseurl = '<?= base_url(); ?>';
</script>
<script type="text/javascript" src="<?php echo base_url('assets/js/jQuery-2.2.0.min.js')?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/plugins/bootstrap/3.3.6/js/bootstrap.min.js')?>"></script>
<script type="text/javascript" src="<?php echo base_url('assets/js/custom.js')?>"></script>
</html>