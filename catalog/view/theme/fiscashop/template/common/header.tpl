<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <meta name="author" content="">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />        
        <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
        <?php } ?>
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/fiscashop/bootstrap/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/fiscashop/bootstrap/css/bootstrap-theme.min.css" />

        <!-- Custom styles for this template -->
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/fiscashop/stylesheet/stylesheet.css" />

        <!-- Just for debugging purposes. Don't actually copy this line! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <?php foreach ($styles as $style) { ?>
        <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
        <?php foreach ($scripts as $script) { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
        <?php } ?>
        <!--[if IE 7]> 
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
        <![endif]-->
        <!--[if lt IE 7]>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
        <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
        <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
        </script>
        <![endif]-->
        <?php if ($stores) { ?>
        <script type="text/javascript"><!--
        $(document).ready(function() {
            < ?php foreach ($stores as $store) { ? >
                    $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
                    < ?php } ? >
            });
                    //--></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>

    <body>

        <div class="container">

            <div class="row">

                <div class="col-md-1">
                    <?php echo $language; ?>                                       
                </div>
                
                <div class="col-md-1">
                    <?php echo $currency; ?> 
                </div>

                <div class="col-md-5" id="welcome">
                    <?php if (!$logged) { ?>
                    <?php echo $text_welcome; ?>
                    <?php } else { ?>
                    <?php echo $text_logged; ?>
                    <?php } ?>
                </div>

                <div class="col-md-2" id="search">
                    <div class="button-search"></div>
                    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
                </div>
                
            </div> <!-- /.row -->

            <div class="row">

                <div class="col-md-3" id="logo">
                    <?php if ($logo) { ?>
                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                    <?php } ?>
                </div>

                <div class="col-md-4">
                    <?php echo $cart; ?>
                </div>

                <div class="col-md-5" class="links" style="text-align: right;">
                    <a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
                    <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
                    <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                    <a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
                    <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>                    
                </div>

            </div> <!-- /.row -->

            <?php if ($categories) { ?>
            <div class="row">
                
                <div class="col-md-12">
                    <nav class="navbar navbar-default" role="navigation" id="menu">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">

                                <?php foreach ($categories as $category) { ?>
                                    <?php if ($category['children']) { ?>
                                    <li class="dropdown">
                                    <?php } else { echo '<li>'; } ?>

                                    <?php if ($category['children']) { ?>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo $category['href']; ?>">
                                            <?php echo $category['name']; ?><b class="caret"></b>
                                        </a>
                                    <?php } else { ?>
                                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                    <? } ?>

                                    <?php if ($category['children']) { ?>

                                        <?php for ($i = 0; $i < count($category['children']);) { ?>
                                        <ul class="dropdown-menu">
                                            <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                            <?php for (; $i < $j; $i++) { ?>
                                                <?php if (isset($category['children'][$i])) { ?>
                                            <li>
                                                <a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                                            </li>
                                                <?php } ?>
                                            <?php } ?>
                                        </ul>
                                        <?php } ?>

                                    <?php } ?>
                                    </li>
                                <?php } /* END foreach */ ?>
                                
                                </ul>
                            </div>

                        </div>

                    </nav>
                </div>

            </div> <!-- /.row -->
            <?php } ?>
            
            <?php if ($error) { ?>

            <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

            <?php } ?>
            
            <div id="notification"></div>