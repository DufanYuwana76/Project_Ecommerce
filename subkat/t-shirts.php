<!--All Products-->
<div class="top-products">
    <div class="container">
        <div class="row product" style="margin-top: 10px;">
            <div class="col-lg-12">
                <h1 class="text-center text1">CALIPER</h1>
            </div>
            <?php
            $perpage = 20;
            $page = isset($_GET['page']) ? $_GET['page'] : "";
                        
            if(empty($page)){
                $num = 0;
                $page = 1;
            }else{
                $num = ($page - 1) * $perpage;
            }
            $query = "SELECT * FROM items 
                      INNER JOIN brands ON brands.brd_id = items.brd_id 
                      INNER JOIN subcategories ON subcategories.scat_id = items.scat_id 
                      WHERE items.available = 'Ada' AND subcategories.subcategory = 'T-Shirt' 
                      ORDER BY item_id ASC LIMIT $num, $perpage";
            $result = mysqli_query($conn, $query);
            while($row = mysqli_fetch_array($result)){
                $totalDisc = $row['price'] - ($row['price'] * ($row['disc'] ?? 0) / 100);
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
                    <?php
                    if(isset($row['disc']) && ($row['disc'] == "0" || !isset($row['disc']))){
                        echo '
                        <div class="item_price">
                            <p>
                                <span>Rp '.number_format($row['price'],0,".",".").'</span>
                            </p>
                        </div>
                        ';
                    }else{
                        echo '
                        <div class="item_price">
                            <p>
                                <i>Rp '.number_format($row['price'],0,".",".").'</i>
                                <span>Rp '.number_format($totalDisc,0,".",".").'</span>
                            </p>
                        </div>
                        ';
                    }
                    ?>
                </div>
            </div>    
            <?php
            }
            $sql = mysqli_query($conn, "SELECT COUNT(*) AS total FROM items 
                                        INNER JOIN brands ON brands.brd_id = items.brd_id 
                                        INNER JOIN subcategories ON subcategories.scat_id = items.scat_id 
                                        WHERE items.available = 'Ada' AND subcategories.subcategory = 'T-Shirt'");
            $row = mysqli_fetch_assoc($sql);
            $total_record = $row['total'];
            $total_page = ceil($total_record / $perpage);
            ?>
         <div class="col-lg-12">
    <nav class="text-center">
        <ul class="pagination">
            <?php
            if($page > 1){
                $prev = "<a href='../index.php?p=tshirt&page=1'><span aria-hidden='true'>First</span></a>";
            }else{
                $prev = "<a href=''><span aria-hidden='true'>First</span></a>";
            }
            $number = '';
            for($i=1; $i<=$total_page; $i++){ 
                if($i == $page){
                    $number .= "<a href='../index.php?p=tshirt&page=$i'>$i</a>";
                }else{
                    $number .= "<a href='../index.php?p=tshirt&page=$i'>$i</a>";
                }
            }
            if($page < $total_page){
                $link = $page + 1;
                $next = "<a href='../index.php?p=tshirt&page=$total_page'><span aria-hidden='true'>Last</span></a>";
            }else{
                $next = "<a href=''><span aria-hidden='true'>Last</span></a>";
            }
            echo "<li>".$prev."</li>";
            echo "<li>".$number."</li>";
            echo "<li>".$next."</li>";
            ?>
        </ul>
    </nav>
</div>
