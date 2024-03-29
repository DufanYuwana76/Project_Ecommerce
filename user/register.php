<div class="container">
    <h1 class="well"><center>Register RCB Indonesia</center></h1>
    <div class="col-lg-12 well">
        <div class="row">
            <?php
            $genderErr = "";

            $error = false;
            $fname = $lname = $gender = $address = $city = $state = $zip = $phone = $email = $pass = "";
            $fnameErr = $lnameErr = $genderErr = $addressErr = $cityErr = $stateErr = $zipErr = $phoneErr = $emailErr = $passErr = $cpassErr = $agreeErr = "";

            if(isset($_POST['signup'])){
                $query = mysqli_query($conn,"SELECT * FROM members WHERE email='".$_POST['email']."'");

                if($_SERVER['REQUEST_METHOD'] == "POST"){
                    if(empty($_POST['fname'])){
                        $error = true;
                        $fnameErr = "Masukan isi nama pertama Anda";
                    }else{
                        $fname = $_POST['fname'];
                        if(!preg_match("/^[a-zA-Z .\-']*$/",$_POST['fname'])){
                            $error = true;
                            $fnameErr = "Isi nama harus menggunakan huruf, karakter, dan spasi";
                        }
                    }

                    if(empty($_POST['lname'])){
                        $error = true;
                        $lnameErr = "Masukan isi nama terakhir Anda";
                    }else{
                        $lname = $_POST['lname'];
                        if(!preg_match("/^[a-zA-Z .\-']*$/",$_POST['lname'])){
                            $error = true;
                            $lnameErr = "Isi nama harus menggunakan huruf, karakter, dan spasi";
                        }
                    }

                    if(trim($_POST['gender'])=="blank"){
                        $error = true;
                        $genderErr = "Pilih salah satu jenis kelamin Anda";
                    }else{
                        $gender = $_POST['gender'];
                        if($gender == "Laki-laki"){
                            $A = "selected";
                            $B = "";
                        }elseif($gender == "Perempuan"){
                            $A = "";
                            $B = "selected";
                        }
                    }

                    if(empty($_POST['address'])){
                        $error = true;
                        $addressErr = "Masukan isi alamat Anda";
                    }else{
                        $address = $_POST['address'];
                    }

                    if(empty($_POST['city'])){
                        $error = true;
                        $cityErr = "Masukan isi nama kota atau kabupaten";
                    }else{
                        $city = $_POST['city'];
                        if(!preg_match("/^[a-zA-Z -']*$/",$_POST['city'])){
                            $error = true;
                            $cityErr = "Isi nama kota atau kabupaten harus menggunakan huruf, karakter, dan spasi";
                        }
                    }

                    if(empty($_POST['state'])){
                        $error = true;
                        $stateErr = "Masukan isi provinsi";
                    }else{
                        $state = $_POST['state'];
                        if(!preg_match("/^[a-zA-Z .\-,']*$/",$_POST['state'])){
                            $error = true;
                            $stateErr = "Isi provinsi harus menggunakan huruf, karakter, dan spasi";
                        }
                    }

                    if(empty($_POST['postcode'])){
                        $error = true;
                        $zipErr = "Masukan isi kode pos";
                    }else{
                        $zip = $_POST['postcode'];
                        if(!is_numeric($zip)){
                            $error = true;
                            $zipErr = "Isi kode pos hanya menggunakan angka";
                        }
                    }

                    if(empty($_POST['phone'])){
                        $error = true;
                        $phoneErr = "Masukan isi nomor telepon";
                    }else{
                        $phone = $_POST['phone'];
                        if(!is_numeric($phone)){
                            $error = true;
                            $phoneErr = "Isi nomor telepon hanya menggunakan angka";
                        }
                    }

                    if(empty($_POST['email'])){
                        $error = true;
                        $emailErr = "Masukan isi alamat email Anda";
                    }else{
                        $email = $_POST['email'];
                        if(!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9.]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/", $_POST['email'])){
                            $error = true;
                            $emailErr = "Isi alamat email dengan benar";
                        }
                    }

                    if(empty($_POST['pass'])){
                        $error = true;
                        $passErr = "Masukan isi kata sandi";
                    }else{
                        $pass = md5($_POST['pass']);
                        if(strlen($_POST['pass']) < 6){
                            $error = true;
                            $passErr = "Kata sandi harus minimal 6 karakter";
                        }
                    }

                    if(empty($_POST['cpass'])){
                        $error = true;
                        $cpassErr = "Masukan isi konfirmasi kata sandi";
                    }else{
                        if($_POST['pass'] != $_POST['cpass']){
                            $error = true;
                            $cpassErr = "Kata sandi dan konfirmasi kata sandi tidak cocok";
                        }
                    }

                    if(!isset($_POST['agree']) || $_POST['agree'] != '1'){
                        $error = true;
                        $agreeErr = "Silakan dicentang apabila Anda menyetujuinya";
                    }
                }

                if(!$error){
                    if(mysqli_num_rows($query) > 0){
                        echo "<div class='alert alert-danger'>Email $email sudah ada, mohon gunakan yang lain!</div>";
                    }else{
                        $id = autoNumber('member_id', 'members');
                        $name = $fname . " " . $lname;
                        $email = mysqli_real_escape_string($conn, $email);
                        $pass = mysqli_real_escape_string($conn, $pass);
                        date_default_timezone_set('Asia/Jakarta');
                        $regdate = date('Y-m-d G:i');

                        mysqli_query($conn, "INSERT INTO members VALUES ('$id','$name','$gender','$address','$city','$state','$zip','$phone','$email','$pass','$regdate')");

                        // Redirect to index.php
                        echo "<script>document.location = '../index.php'; </script>";
                        exit();
                    }
                }
            }
            if(isset($_POST['nama1'])){
                $nama1 = $_POST['nama1'];
            }

            if(isset($_POST['Email1'])){
                $Email1 = $_POST['Email1'];
            }

            if(isset($_POST['Sandi1'])){
                $Sandi1 = $_POST['Sandi1'];
            }

            ?>
            <form action="../index.php?p=register" method="POST">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label for="nama1">Nama Pertama :</label>
                            <input type="text" class="form-control" name="fname" placeholder="Masukkan nama Anda" value="<?php echo isset($fname) ? $fname : ''; ?>">
                            <span class="text-danger msg-error"><?php echo $fnameErr; ?></span>
                        </div>

                        <div class="col-sm-6 form-group">
                            <label>Nama Terakhir :</label>
                            <input type="text" class="form-control" name="lname" placeholder="Masukkan nama Anda" value="<?php echo isset($lname) ? $lname : ''; ?>">
                            <span class="text-danger msg-error"><?php echo $lnameErr; ?></span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Jenis Kelamin :</label>
                            <select name="gender" class="form-control">
                                <option value="blank">--- Pilih jenis kelamin Anda ---</option>
                                <option value="Laki-laki" <?php echo $A ?? ''; ?>>Laki-laki</option>
                                <option value="Perempuan" <?php echo $B ?? ''; ?>>Perempuan</option>
                            </select>
                            <span class="text-danger msg-error"><?php echo $genderErr; ?></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <label>Alamat :</label>
                            <input type="text" class="form-control" name="address" placeholder="Masukkan alamat Anda" value="<?php echo isset($address) ? $address : ''; ?>">
                            <span class="text-danger msg-error"><?php echo $addressErr; ?></span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Kota / Kabupaten :</label>
                            <input type="text" class="form-control" name="city" placeholder="Masukkan nama kota atau kabupaten" value="<?php echo isset($city) ? $city : ''; ?>">
                            <span class="text-danger msg-error"><?php echo $cityErr; ?></span>
                        </div>

                        <div class="col-sm-6 form-group">
                            <label>Provinsi :</label>
                            <input type="text" class="form-control" name="state" placeholder="Masukkan provinsi" value="<?php echo isset($state) ? $state : ''; ?>">
                            <span class="text-danger msg-error"><?php echo $stateErr; ?></span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label>Kode Pos :</label>
                            <input type="text" class="form-control" name="postcode" placeholder="Masukkan kode pos" value="<?php echo isset($zip) ? $zip : ''; ?>">
                            <span class="text-danger msg-error"><?php echo $zipErr; ?></span>
                        </div>

                        <div class="col-sm-6 form-group">
                            <label>Nomor Telepon :</label>
                            <input type="text" class="form-control" name="phone" maxlength="14" placeholder="Masukkan nomor telepon Anda" value="+62">
                            <span class="text-danger msg-error"><?php echo $phoneErr; ?></span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-4 form-group">
                            <label for="Email1">Alamat Email :</label>
                            <input type="text" class="form-control" name="email" placeholder="Masukkan alamat email Anda" value="<?php echo isset($email) ? $email : ''; ?>">
                            <span>Contoh: yourname@mail.com</span><br/>
                            <span class="text-danger msg-error"><?php echo $emailErr; ?></span>
                        </div>
                        <div class="col-sm-4 form-group">
                            <label for="Sandi1">Kata Sandi :</label>
                            <input type="password" class="form-control" name="pass" placeholder="Masukkan kata sandi di sini">
                            <span class="text-danger msg-error"><?php echo $passErr; ?></span>
                        </div>
                        <div class="col-sm-4 form-group">
                            <label>Konfirmasi Kata Sandi :</label>
                            <input type="password" class="form-control" name="cpass" placeholder="Masukkan kata sandi lagi">
                            <span class="text-danger msg-error"><?php echo $cpassErr; ?></span>
                        </div>
                    </div>

                    <center>
                        <div class="form-group">
                            <div class="checkboxcss"><input type="checkbox" name="agree" value="1"> Saya setuju dengan aturan ini</div>
                            <span class="text-danger msg-error"><?php echo $agreeErr; ?></span>
                        </div>
                    </center>

                    <!-- Button -->
                    <center>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning" name="signup">Daftar</button>
                            <a href="../index.php"><button type="button" class="btn btn-link">Batal</button></a>
                        </div>
                    </center>

                </div>
            </form>
        </div>
    </div>
    <div class="well"><p class="text-center new-account">Sudah menjadi anggota? <a href="../index.php?p=login">Masuk</a></p></div>
</div>
