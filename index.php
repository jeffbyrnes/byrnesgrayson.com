<?php
if (in_array($_SERVER['REQUEST_URI'], array('/', '/index.php'))) {
    $page = 'home';
} else {
    $page = strtolower(trim($_SERVER['REQUEST_URI'], '/'));
}
?><!doctype html>
<head>
    <meta charset="utf-8">
    <title>Wedding of Morgan Byrnes & Ryan Grayson</title>
    <link href="/css/style.css" media="screen, projection" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="<?php echo $page; ?>">
    <header class="centered-navigation">
        <div class="centered-navigation-wrapper">
            <a href="/" class="mobile-logo">
                <img src="/img/monogram.png" alt="GMR monogram">
            </a>

            <a href="javascript:void(0)" id="js-centered-navigation-mobile-menu" class="centered-navigation-mobile-menu">MENU</a>

            <ul id="js-centered-navigation-menu" class="centered-navigation-menu show">
                <li class="nav-link"><a href="/">Welcome</a></li>
                <li class="nav-link nav-separator">•</li>
                <li class="nav-link"><a href="/when-where">When+Where</a></li>
                <li class="nav-link logo">
                    <a href="/">
                        <img src="/img/monogram.png" alt="GMR monogram">
                    </a>
                </li>
                <li class="nav-link"><a href="/stay-play">Stay+Play</a></li>
                <li class="nav-link nav-separator">•</li>
                <li class="nav-link"><a href="http://zola.com/registry/byrnesgrayson">Registry</a></li>
            </ul>
        </div>
    </header>

    <div class="container">
        <div class="content">
            <?php
            require_once("_{$page}.php");
            ?>
        </div>

        <p class="copyright">© 2014–<?php echo date('Y'); ?> byrnesgrayson.com</p>
    </div>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="/js/script.js" async defer></script>
    <?php
    if ($_SERVER['HTTP_HOST'] === 'local.byrnesgrayson.com') {
        ?>
        <script src="http://localhost:35729/livereload.js"></script>
        <?php
    }
    ?>
</body>
</html>
