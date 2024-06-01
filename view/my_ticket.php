<style>
    span {
        padding: 0 10px;
        
    }

    span a {
        color: #fff;
    }
</style>

<section class="details-banner hero-area bg_img" data-background="url(assets/images/banner/banner04.jpg" style="background-image: url('assets/images/banner/banner04.jpg');">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-content">
                <h3 style="font-size: 24px; padding: 60px 0 0 0;">Thông tin vé đặt</h3>
                <span><a href="index.php?act=my_ticket">Vé đã mua</a></span>
                <span><a href="index.php?act=used_ticket">Vé đã xem</a></span>
            </div>
        </div>
    </div>
</section>
<!-- <div class="container">

    </div> -->
    <div class="tab-area" style=" background-image: -webkit-linear-gradient(0deg, #001232 0%, #06327f 100%); margin: 0px 0 60px 0;">
        <table  style="text-align: center;">
            <thead>
                <th>Tên</th>
                <th>Tên Phim</th>
                <th>Khung Giờ Chiếu</th>
                <th>Rạp Chiếu</th>
                <th>Phòng Chiếu</th>
                <th>Ghế ngồi</th>
                <th>Ngày Chiếu</th>
                <th>Số lượng vé</th>
                <th>Giá</th>
                <th>Ngày đặt</th>
                <th>Trạng thái</th>
            </thead>
    
            <tbody>
                <?php
                foreach ($list_ticket as $value) {
                    extract($value);
                ?>
                    <tr>
    
                    </tr>
                    <td><?= $username ?></td>
                    <td><?= $name_film ?></td>
                    <td><?= $start_time . " - " . $end_time ?></td>
                    <td><?= $name_cinema ?></td>
                    <td><?= $name_room ?></td>
                    <td><?= $seat_order ?></td>
                    <td><?= $show_date ?></td>
                    <td><?= $quantity ?></td>
                    <td><?= $price ?></td>
                    <td><?= $order_date ?></td>
                    <td><?= $status ?></td>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>