<?php

$LogedinAlert;

session_start();
// $_SESSION['logedin'] = "lol";



if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $_SESSION['logedin'] = false;
    $LogedinAlert = false;

    require('./partial/connection.php');

    $username = $_POST['username'];
    $password = $_POST['password'];

    if (isset($username) && isset($password)) {

        $query = "select `uid`,`password` from `user` where `email` = '$username' limit 1";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) != 0) {

            $passwordhash;
            $uid;
            foreach ($result as $foo) {
                $passwordhash = $foo['password'];
                $uid = $foo['uid'];
            }
            if (password_verify($password, $passwordhash)) {

                $LogedinAlert = true;

                $_SESSION['logedin'] = true;
                $_SESSION['userid'] = $uid;
                if (isset($_POST['keepLogedin'])) {
                    setcookie("username", $username, 86400 * 30 + time(), '/');
                    // setcookie("password", $password, 86400 * 120 + time());
                    setcookie("password", $passwordhash, 86400 * 30 + time(), '/');
                }
            }
        }
    }
    // } elseif ( isset($_SESSION['logedin']) && $_SESSION['logedin'] == false &&  isset($_COOKIE['username']) && isset($_COOKIE['password'])) {
} elseif (count($_SESSION) == 0 &&  isset($_COOKIE['username']) && isset($_COOKIE['password'])) {

    $_SESSION['logedin'] = false;

    require('./partial/connection.php');

    $username = $_COOKIE['username'];
    $password = $_COOKIE['password'];

    if (isset($username) && isset($password)) {
        $query = "select `uid`,`password` from `user` where `email` = '$username' limit 1";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) != 0) {
            $passwordhash;
            $uid;
            foreach ($result as $foo) {
                $passwordhash = $foo['password'];
                $uid = $foo['uid'];
            }

            // if (password_verify($password, $passwordhash)) {
            if ($password == $passwordhash) {

                $LogedinAlert = true;
                $_SESSION['logedin'] = true;
                $_SESSION['userid'] = $uid;
            }
        }
    }
}


?>


<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <?php
    require('./partial/link.php');
    ?>

    <title>Cookie Jar</title>

    <style>
        .carousel-inner>.carousel-item>img {
            min-height: 60vh;
            max-height: 60vh;
            width: 100%;
            object-fit: cover;
        }
    </style>

</head>

<body>

    <?php
    require('./partial/nav.php');

    if (isset($LogedinAlert)) {
        if ($LogedinAlert == true) {
            echo ' <div class="alert alert-success shadow a-msg" role="alert" id="logedin-alert">
           <b>' . $username . '</b>, You have successfully loged in.
    </div>';
        } else {
            echo '<div class="alert alert-danger shadow a-msg" role="alert" id="logedin-alert">
        Sorry! Invalid credential, Please try again to Log in.
    </div>';
        }
    } elseif ($_SERVER['REQUEST_METHOD'] == "GET" && isset($_GET['logout']) && $_GET['logout'] == true) {
        echo ' <div class="alert alert-success shadow a-msg" role="alert" id="logedin-alert">
           You have successfully <b> loged out </b>.
    </div>';
    }


    ?>



    <?php
    // require('./partial/carousel.php');
    ?>



</body>
<?php
require('./partial/script.php');
// require('./partial/cart_script.php');
?>
<script>
    // active link highlight 
    let link = document.getElementById('home');
    link.classList.add('active');

    function destroyalert() {
        setTimeout(() => {
            var myAlert = document.getElementById("logedin-alert");
            var bsAlert = new bootstrap.Alert(myAlert);
            bsAlert.close();
        }, 5000);
    }

    <?php

    if ((isset($LogedinAlert)) || (($_SERVER['REQUEST_METHOD'] == "GET" && isset($_GET['logout']) && $_GET['logout'] == true))) {
        echo "destroyalert()";
    }

    ?>

    var myCarousel = document.querySelector('#Gcarousel')
    var carousel = new bootstrap.Carousel(myCarousel)
</script>



</html>