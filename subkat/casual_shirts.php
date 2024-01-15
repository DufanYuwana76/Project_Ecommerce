<!--All Products-->
<div class="top-products">
	<div class="container">
		<div class="row product" style="margin-top: 10px;">
			<div class="col-lg-12">
				<h1 class="text-center text1">VELG</h1>
			</div>
			<?php
			$perpage = 20;
			$page = isset($_GET['page']) ? $_GET['page'] : 1;
						
			if ($page < 1) {
				$page = 1;
			}
			
			$num = ($page - 1) * $perpage;
			
			$query = "SELECT * FROM items INNER JOIN brands ON brands.brd_id = items.brd_id INNER JOIN subcategories ON subcategories.scat_id = items.scat_id WHERE items.available = 'Ada' AND subcategories.subcategory = 'Casual Shirts' ORDER BY item_id ASC LIMIT $num, $perpage";
			
			$result = mysqli_query($conn, $query);
			
			while ($row = mysqli_fetch_array($result)){
				$totalDisc = $row['price'];
				
				if (isset($row['disc']) && $row['disc'] > 0) {
					$totalDisc -= $row['price'] * ($row['disc'] / 100);
				}
			?>
			<div class="col-md-3 col-xs-6 product-left">
				<div class="p-one">
					<a href="#">
						<img src="../miiadmin/img/<?php echo $row['bgimg']; ?>"/>
						<div class="mask">
							<a href="../index.php?p=single&id=<?php echo $row['item_id']; ?>"><span>Lihat Detail</span></a>
						</div>
					</a>
					<h4><?php echo $row['item_name']; ?></h4>
					<div class="item_price">
						<p>
							<?php if (isset($row['disc']) && $row['disc'] > 0) { ?>
								<i>Rp <?php echo number_format($row['price'], 0, ".", "."); ?></i>
							<?php } ?>
							<span>Rp <?php echo number_format($totalDisc, 0, ".", "."); ?></span>
						</p>
					</div>
				</div>
			</div>	
			<?php
			}
			
			$sql = mysqli_query($conn, "SELECT COUNT(*) AS total FROM items INNER JOIN brands ON brands.brd_id = items.brd_id INNER JOIN subcategories ON subcategories.scat_id = items.scat_id WHERE items.available = 'Ada' AND subcategories.subcategory = 'Casual Shirts'");
			$row = mysqli_fetch_assoc($sql);
			$total_record = $row['total'];
			$total_page = ceil($total_record / $perpage);
			?>
			<div class="col-lg-12">
				<nav class="text-center">
					<ul class="pagination">
						<?php
						if ($page > 1) {
							$prev = "<a href='../index.php?p=casualshirt&page=1'><span aria-hidden='true'>First</span></a>";
						} else {
							$prev = "<a href=''><span aria-hidden='true'>First</span></a>";
						}
						
						$number = '';
						for ($i = 1; $i <= $total_page; $i++) {
							if ($i == $page) {
								$number .= "<a href='../index.php?p=casualshirt&page=$i'>$i</a>";
							} else {
								$number .= "<a href='../index.php?p=casualshirt&page=$i'>$i</a>";
							}
						}
						
						if ($page < $total_page) {
							$link = $page + 1;
							$next = "<a href='../index.php?p=casualshirt&page=$total_page'><span aria-hidden='true'>Last</span></a>";
						} else {
							$next = "<a href=''><span aria-hidden='true'>Last</span></a>";
						}
						?>
						<li><?php echo $prev; ?></li>
						<li><?php echo $number; ?></li>
						<li><?php echo $next; ?></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
