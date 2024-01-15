<div class="top-products">
    <div class="container">
        <div class="row product" style="margin-top: 10px;">
            <div class="col-lg-12">
                <h1 class="text-center text1">MASTER REM</h1>
            </div>
            <?php
            $perpage = 20;
            $page = isset($_GET['page']) ? $_GET['page'] : 1;
            $start = ($page - 1) * $perpage;

            $query = "SELECT * FROM items
                      INNER JOIN brands ON brands.brd_id = items.brd_id
                      INNER JOIN subcategories ON subcategories.scat_id = items.scat_id
                      WHERE items.available = 'Ada' AND subcategories.subcategory = 'Jackets'
                      ORDER BY item_id ASC LIMIT $start, $perpage";
            $result = mysqli_query($conn, $query);

            while ($row = mysqli_fetch_array($result)) {
                $totalDisc = $row['price'] - ($row['price'] * ($row['disc'] ?? 0) / 100);
            ?>
                <div class="col-md-3 col-xs-6 product-left">
                    <div class="p-one">
                        <a href="#">
                            <img src="../miiadmin/img/<?php echo $row['bgimg']; ?>" />
                            <div class="mask">
                                <a href="../index.php?p=single&id=<?php echo $row['item_id']; ?>"><span>Lihat Detail</span></a>
                            </div>
                        </a>
                        <h4><?php echo $row['item_name']; ?></h4>
                        <?php if ($row['discount'] == "0") : ?>
                            <div class="item_price">
                                <p>
                                    <span>Rp <?php echo number_format($row['price'], 0, ".", "."); ?></span>
                                </p>
                            </div>
                        <?php else : ?>
                            <div class="item_price">
                                <p>
                                    <i>Rp <?php echo number_format($row['price'], 0, ".", "."); ?></i>
                                    <span>Rp <?php echo number_format($totalDisc, 0, ".", "."); ?></span>
                                </p>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            <?php
            }
            $total_records = mysqli_num_rows($result);
            $total_pages = ceil($total_records / $perpage);
            ?>
            <div class="col-lg-12">
                <nav class="text-center">
                    <ul class="pagination">
                        <?php if ($page > 1) : ?>
                            <li><a href="../index.php?p=jackets&page=1"><span aria-hidden="true">First</span></a></li>
                        <?php else : ?>
                            <li><a href="#"><span aria-hidden="true">First</span></a></li>
                        <?php endif; ?>

                        <?php for ($i = 1; $i <= $total_pages; $i++) : ?>
                            <li><a href="../index.php?p=jackets&page=<?php echo $i; ?>"><?php echo $i; ?></a></li>
                        <?php endfor; ?>

                        <?php if ($page < $total_pages) : ?>
                            <li><a href="../index.php?p=jackets&page=<?php echo $total_pages; ?>"><span aria-hidden="true">Last</span></a></li>
                        <?php else : ?>
                            <li><a href="#"><span aria-hidden="true">Last</span></a></li>
                        <?php endif; ?>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
