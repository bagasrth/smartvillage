<?php
/**
 * Created by PhpStorm.
 * User: ELL
 * Date: 20/12/2017
 * Time: 10.29
 */

namespace backend\controllers\operator;

use backend\models\LaporProgress;
use backend\models\Mitra;
use backend\models\Pembangunan;
use backend\models\User;
use Yii;
use yii\base\Exception;
use yii\helpers\Url;

use backend\controllers\BaseController;

class ReportController extends BaseController
{
    public function behaviors()
    {
        return parent::behaviors(); // TODO: Change the autogenerated stub
    }
    public function actions()
    {
        return parent::actions(); // TODO: Change the autogenerated stub
    }

    public  function actionIndex(){
        if(!parent::isLogin()){
            return $this->redirect(Url::toRoute('site/login'));
        }
        $mitraOption=[];
        $mitra=Mitra::find()->all();
        foreach ($mitra as $item){
            $mitraOption[$item->id]=$item->nama_mitra;
        }
        $params=[
            'mitraOption'=>$mitraOption
        ];
        return $this->render('index.tpl',$params);
    }

    public function actionReportMitra(){
        $tanggal=strip_tags(Yii::$app->request->post('tanggal',''));
        $mitraId=intval(Yii::$app->request->post('mitra_id',0));
        $cekTanggal=LaporProgress::find()->where(['tanggal'=>$tanggal])->one();
        if(is_null($cekTanggal)){
            return "<div class='alert alert-danger'>Data Tidak Ditemukan</div>";
        }
        $ceMitra=Pembangunan::find()->where(['mitra_id'=>$mitraId])->one();
        if(is_null($ceMitra)){
            return "<div class='alert alert-danger'>Data Tidak Ditemukan</div>";
        }

        $cekData=LaporProgress::find()->where(['tanggal'=>$tanggal])
            ->JoinWith(['pembangunan'])
            ->where(['{{pembangunan}}.[[mitra_id]]'=>$mitraId])
            ->one();
        $pembangunan=Pembangunan::find()->where(['id'=>$cekData['pembangunan_id']])->one();

        $params=[
            'data'=>$cekData,
            'asPdf' => false,
            'pembangunan'=>$pembangunan
        ];
        return $this->renderPartial('report-mitra.tpl',$params);

    }




}