<?php
/**
 * Created by PhpStorm.
 * User: ELL
 * Date: 20/12/2017
 * Time: 13.14
 */

namespace backend\controllers\operator;

use backend\models\RequestPembangunan;
use Yii;
use yii\base\Exception;
use yii\helpers\Url;
use backend\controllers\BaseController;

class RequestPembangunanController extends BaseController
{
    public function actions()
    {
        return parent::actions(); // TODO: Change the autogenerated stub
    }
    public function behaviors()
    {
        return parent::behaviors(); // TODO: Change the autogenerated stub
    }

    public function actionIndex(){
        if(!parent::isLogin()){
            return $this->redirect(Url::toRoute('site/login'));
        }
        $params['data']=RequestPembangunan::find()->all();
        if (Yii::$app->request->isPost) {
            return $this->renderPartial('index.tpl', $params);
        } else {
            return $this->render('index.tpl', $params);
        }
    }
    public function  actionVerifikasi(){
        $id = Yii::$app->request->post('id', 0);
        $data = RequestPembangunan::findOne($id);
        $data->status='terverifikasi';
        try {
            $data->save();
            return "
            <div class='alert alert-success'>Data berhasil diverifikasi</div>
            <script> reloadData(); closeModal(1500); </script>";
        } catch (Exception $e) {
            return "
            <div class='alert alert-danger'>Terjadi kesalahan! Data gagal diverifikasi</div>";
        }
    }

    public function  actionTindak(){
        $id = Yii::$app->request->post('id', 0);
        $data = RequestPembangunan::findOne($id);
        $data->status='ditindaklanjuti';
        try {
            $data->save();
            return "
            <div class='alert alert-success'>Data berhasil ditolak</div>
            <script> reloadData(); closeModal(1500); </script>";
        } catch (Exception $e) {
            return "
            <div class='alert alert-danger'>Terjadi kesalahan! Data gagal ditolak</div>";
        }
    }

}