{use class="yii\helpers\Url"}
{use class="yii\helpers\Html"}
{set title="SmartVillage Dashboard"}
{$user = Yii::$app->session->get('user', false)}
{$i=1}
{$j=1}
{if $user->roleAs('admin')}
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">CPU Traffic</span>
                    <span class="info-box-number">90<small>%</small></span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-adjust"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Rt/rw</span>
                    <span class="info-box-number">{$totalRtrw}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="ion ion-ios-bookmarks"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Dusun</span>
                    <span class="info-box-number">{$totalDusun}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Users</span>
                    <span class="info-box-number">{$totalUser}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Pembangunan Terbaru</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table no-margin">
                            <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Pembangunan</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            {$nomor = 1}
                            {foreach $pembangunanTerbaru as $item}
                            <tr>
                                <td>{$nomor++}</td>
                                <td>{$item->nama_pembangunan}</td>
                                <td>
                                    {if $item->status->nama == 'Progress'}
                                        <span class="label label-info">{$item->status->nama}</span>
                                    {/if}
                                    {if $item->status->nama == 'Pending'}
                                        <span class="label label-warning">{$item->status->nama}</span>
                                    {/if}
                                    {if $item->status->nama == 'Selesai'}
                                        <span class="label label-success">{$item->status->nama}</span>
                                    {/if}

                                </td>

                            </tr>
                            {/foreach}

                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.box-body -->
                <!-- /.box-footer -->
            </div>
        </div>

    </div>



{/if}
{if $user->roleAs('operator')}
<div class="row">
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>{$totalPenduduk}</h3>

                <p>Penduduk</p>
            </div>
            <div class="icon">
                <i class="fa fa-shopping-cart"></i>
            </div>
            <a href="#" class="small-box-footer">
                More info <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-green">
            <div class="inner">
                <h3>{$totalLapor}</h3>

                <p>Laporan Aduan</p>
            </div>
            <div class="icon">
                <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">
                More info <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-yellow">
            <div class="inner">
                <h3>{$totalRequest}</h3>

                <p>Request Pembangunan</p>
            </div>
            <div class="icon">
                <i class="ion ion-person-add"></i>
            </div>
            <a href="{Url::toRoute('user/', true)}" class="small-box-footer">
                More info <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-red">
            <div class="inner">
                <h3>{$totalPembangunan}</h3>

                <p>Pembangunan</p>
            </div>
            <div class="icon">
                <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">
                More info <i class="fa fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
</div>
<div class="row">
    <div class="col-md-7">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">Target to Realisasi Total</h3>
            </div>
            <div id="main-block-content" class="box-body">
                <div id="container"></div>
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title">Pembangunan</h3>
            </div>
            <div id="main-block-content" class="box-body">
                <div id="container2"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
    // Create the chart
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Progress Pembangunan di Desa Gandu'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: 'prosentase'
            }

        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{literal}{point.y:.1f}%{/literal}'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{literal}{series.name}{/literal}</span><br>',
            pointFormat: '<span style="color:{literal}{point.color}{/literal}">{literal}{point.name}{/literal}</span>: <b>{literal}{point.y:.2f}%{/literal}</b> of total<br/>'
        },
        series: [{
            name: 'Pembangunan',
            colorByPoint: true,
            data: [
                {foreach $dataPembangunan as $item}
            {
                name: '{$item->nama_pembangunan}',
                y: {$item->prosentase},
                drilldown: '{$item->nama_pembangunan}'
            },
                {/foreach}
            ]
        }],
       
    });
});
</script>
<script type="text/javascript">
    $(function () {
        $('#container2').highcharts({
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Pemerataan Pembangunan'
            },
            subtitle: {
                text: ''
            },
            plotOptions: {
                pie: {
                    innerSize: 100,
                    depth: 45
                }
            },
            series: [{
                name: 'Jumlah Pembangunan',
                data: [
                    {foreach $dataCount as $key => $item}

                    ['{$item['nama_kategori']}', {$item['jumlah']}],
                    {/foreach}
                ]
            }]
        });
    });
</script>
{/if}
{if $user->roleAs('kades')}
    <div class="row">
        <div class="col-md-8">
            <div class='box box-primary color-palette-box'>
                <div class='box-header with-border'>
                    <h3 class='box-title'><i class="fa fa-university"></i>Pemetaan Pembangunan Pembangunan</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-default" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class='box-body'>
                    <div id="map" style="width: 100%; height: 450px;"></div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        <div class="col-md-4">
            <div class='box box-primary color-palette-box'>
                <div class='box-header with-border'>
                    <h3 class='box-title'><i class="fa fa-search"></i>Cari Pembangunan</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-default" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class='box-body'>
                    <form id="form-targets" onsubmit="return false;" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-10"><b>Berdasarkan Kategori</b></div>
                            <div class="col-sm-12 col-xs-12">
                                {Html::dropDownList("kategori_pembangunan_id",'',$kategoriOption, ["class" => "form-control"])}
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10"><b>Berdasarkan Sumber Dana</b></div>
                            <div class="col-sm-12 col-xs-12">
                                {Html::dropDownList("sumber_dana_pembangunan_id",'',$sumberOption, ["class" => "form-control"])}
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10"><b>Berdasarkan Mitra</b></div>
                            <div class="col-sm-12 col-xs-12">
                                {Html::dropDownList("mitra_id", '', $mitraOption, ["class" => "form-control"])}
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-12 col-xs-12">
                                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-search"></i>Cari Data</button>

                            </div>
                        </div>
                        {Html::hiddenInput(Yii::$app->request->csrfParam, Yii::$app->request->csrfToken)}
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcG0CV3wZS1g2tLzebX2Q-Dbbp2doE1eI&callback=initMap">
    </script>


{/if}