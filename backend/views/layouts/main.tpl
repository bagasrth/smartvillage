{use class="yii\helpers\Html"}
{use class="yii\helpers\Url"}
{use class="backend\models\LaporAduan"}
{use class="backend\models\RequestPembangunan"}
{$user = Yii::$app->session->get('user', false)}

<!DOCTYPE html>
<html lang="{$app->language}">
<head>
    <meta charset="{$app->charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{(is_null($this->title))?$app->params['defaultTitle']:$this->title}</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    {Html::csrfMetaTags()}
    <link rel="stylesheet" href="{Url::home(true)}css/style.css">
    <link rel="stylesheet" href="{Url::home(true)}template/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="{Url::home(true)}css/font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{Url::home(true)}plugin/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="{Url::home(true)}css/backend.css">
    <link rel="stylesheet" href="{Url::home(true)}template/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="{Url::home(true)}template/dist/css/skins/skin-blue.css">
    <link rel="stylesheet" href="{Url::home(true)}template/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="{Url::home(true)}template/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="{Url::home(true)}template/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="{Url::home(true)}plugin/chosen/chosen.css">
    <link rel="stylesheet" href="{Url::home(true)}plugin/datetimepicker/jquery.datetimepicker.css">
    <link rel="stylesheet" href="{Url::home(true)}css/datatables.min.css">
    <script src="{Url::home(true)}template/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="{Url::home(true)}script/lib.js"></script>
    <script src="{Url::home(true)}script/core.min.js"></script>
    <script src="{Url::home(true)}script/spms.js"></script>
    <script src="{Url::home(true)}script/peta.js"></script>
    <script src="{Url::home(true)}template/dist/js/jquery-ui.min.js"></script>
    <script src="{Url::home(true)}script/datatables.min.js"></script>
    <script src="{Url::home(true)}script/moment.min.js"></script>
    <script src="{Url::home(true)}plugin/chosen/chosen.jquery.min.js"></script>
    <script src="{Url::home(true)}script/bootstrap.min.js"></script>
    <script src="{Url::home(true)}template/plugins/morris/morris.min.js"></script>
    <script src="{Url::home(true)}template/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="{Url::home(true)}template/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="{Url::home(true)}template/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="{Url::home(true)}template/plugins/knob/jquery.knob.js"></script>
    <script src="{Url::home(true)}template/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="{Url::home(true)}template/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="{Url::home(true)}template/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="{Url::home(true)}template/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="{Url::home(true)}template/plugins/fastclick/fastclick.min.js"></script>
    <script src="{Url::home(true)}template/dist/js/app.min.js"></script>
    <script src="{Url::home(true)}plugin/datetimepicker/jquery.datetimepicker.full.js"></script>
    <script src="{Url::home(true)}plugin/gauge/highcharts.js"></script>
    <script src="{Url::home(true)}plugin/gauge/highcharts-more.js"></script>
    <script src="{Url::home(true)}plugin/gauge/solid-gauge.js"></script>
    <script src="{Url::home(true)}template/dist/js/html5shiv.min.js"></script>
    <script src="{Url::home(true)}template/dist/js/respond.min.js"></script>
    <script src="{Url::home(true)}plugin/highcharts-4.2.5/js/highcharts.js"></script>
    <script src="{Url::home(true)}plugin/highcharts-4.2.5/js/modules/exporting.src.js"></script>
    <script>
        baseURL = "{Url::home(true)}";
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <style type="text/css">
    .box, .info-box, .small-box, .nav-tabs-custom, .callout {
    box-shadow: 0 1px 6px 0 rgba(0,0,0,0.12),0 1px 6px 0 rgba(0,0,0,0.12);
    border-radius: 2px;
    border: 0;
    }
    .main-sidebar, .left-side, .control-sidebar {
    padding-top: 60px;
    box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    }
    .main-header .navbar {
    box-shadow: 0 1px 6px 0 rgba(0,0,0,0.12),0 1px 6px 0 rgba(0,0,0,0.12);
    }
    </style>
</head>
<body class="skin-blue fixed sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <a href="{Url::home(true)}" class="logo">
            <span class="logo-mini"><b></b>SV</span>
            <span class="logo-lg"><i class="fa fa-shopping-bag" aria-hidden="true"></i> <b></b>SmartVillage</b></span>

        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                {if $user}
                <ul class="nav navbar-nav">
                    {if $user->roleAs('operator')}
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">{RequestPembangunan::find()->where(['status'=>'requestbaru'])->count()}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Anda Memiliki {RequestPembangunan::find()->where(['status'=>'requestbaru'])->count()} Request Pembangunan Baru</li>

                        </ul>
                    </li>
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">{LaporAduan::find()->where(['status'=>'laporanbaru'])->count()}</span>
                        </a>
                        <ul class="dropdown-menu">

                            <li class="header">Anda Memiliki {LaporAduan::find()->where(['status'=>'laporanbaru'])->count()}  Laporan Aduan Baru</li>
                        </ul>
                    </li>
                    {/if}
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="{(!$user)?"":$user->displayPhoto}" class="user-image"
                                 alt="User Image">
                            <span class="hidden-xs">{(!$user)?"":$user->name}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="{(!$user)?"":$user->displayPhoto}" class="img-circle"
                                     alt="User Image">
                                <p>
                                    {(!$user)?"":$user->name}
                                    <small>{(!$user)?"":$user->role->name}</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="{Url::toRoute('user/profile/', true)}" class="btn btn-default btn-flat">Profil</a>
                                </div>
                                <div class="pull-right">
                                    <a href="{Url::toRoute('site/logout', true)}" class="btn btn-default btn-flat">Keluar</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
                {/if}
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="{(!$user)?"":$user->displayPhoto}" class="img-circle"
                         alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>{(!$user)?"":$user->name}</p>
                    <a href="#">{(!$user)?"":$user->role->name}</i>

                    </a>
                </div>
            </div>
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input name="q" class="form-control" placeholder="Search..." type="text">
                    <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            {include '@app/views/layouts/nav.tpl'}
        </section>
    </aside>
    {if $this->title=='SmartVillage Dashboard'}
    <div class="content-wrapper">
        <section class="content">
                    {$content}
        </section>
    </div>
    {else}
        <div class="content-wrapper">
            <section class="content">
                <div class="row">
                    <div class='col-md-12'>
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">
                                    {(is_null($this->title))?$app->params['defaultTitle']:$this->title}
                                </h3>
                            </div>
                            <div id="main-content" class="box-body">
                                {$content}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    {/if}

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.0
        </div>
        <strong>Copyright &copy; 2017 <a href="{Url::home(true)}">SMART Village</a>.</strong> All rights reserved.
    </footer>
</div>
{Html::hiddenInput(Yii::$app->request->csrfParam, Yii::$app->request->csrfToken)}
</body>
</html>
