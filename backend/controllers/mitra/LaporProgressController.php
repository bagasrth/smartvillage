<?php
/**
 * Created by PhpStorm.
 * User: ELL
 * Date: 18/12/2017
 * Time: 12.11
 */

namespace backend\controllers\mitra;

use backend\models\LaporProgress;
use Yii;
use yii\base\Exception;
use yii\helpers\Url;
use backend\controllers\BaseController;
use backend\models\Pembangunan;
use backend\models\Uploader;
use yii\web\UploadedFile;


class LaporProgressController extends BaseController
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
        if (!parent::isLogin()) {
            return $this->redirect(Url::toRoute('site/login'));
        }
        $sesi = $this->activeUser;
        $params['data']=Pembangunan::find()
            ->innerJoinWith('mitra')
            ->where(['{{mitra}}.[[users_id]]'=>$sesi->id])
            ->all();
        if (Yii::$app->request->isPost) {
            return $this->renderPartial('index.tpl', $params);
        } else {
            return $this->render('index.tpl', $params);
        }
    }

    public function actionView($id){

        $pembangunan=Pembangunan::find()->where(['id'=>$id])->one();
        $data=LaporProgress::find()->where(['pembangunan_id'=>$id])->all();
        $cek=LaporProgress::find()->where(['pembangunan_id'=>$id,'tanggal'=>date('Y-m-d')])->one();
        $params=[
            'data'=>$data,
            'pembangunan'=>$pembangunan,
            'cek'=>$cek
        ];

        if (Yii::$app->request->isPost) {
            return $this->renderPartial('view.tpl', $params);
        } else {
            return $this->render('view.tpl', $params);
        }
    }

    public function actionSave(){
        $data= new LaporProgress();
        $data->tanggal=date('Y-m-d');
        $data->capaian_progress=Yii::$app->request->post('capaian_progress','');
        $data->uraian_pekerjaan=Yii::$app->request->post('uraian_pekerjaan','');
        $data->pembangunan_id=Yii::$app->request->post('pembangunan_id','');
        $file = new Uploader();
        $file->file = UploadedFile::getInstance($file, 'file');
        if (!is_null($file->file)) {
            if (!file_exists('uploads/lapor-progress')) {
                mkdir('uploads/lapor-progress', 0777, true);
            }
            $file->extension = ['jpg', 'png'];
            $file->destination = 'uploads/lapor-progress/';

            if ($file->upload()) {
                $filename = $file->uploadedFile;
            } else {
                $filename = null;
            }
            $oldFile = $data->image;
            if (strlen($oldFile) > 0) {
                @unlink('uploads/lapor-progress/' . $oldFile);
            }
            $data->image = $filename;
        }
        try{
            $data->save();
            return "
            <div class='alert alert-success'>Data berhasil disimpan</div>
            <script> reloadData(); closeModal(1500); </script>";

        }catch (Exception $e){
            return "
            <div class='alert alert-danger'>Terjadi kesalahan! Data gagal disimpan</div>";
        }

    }



}