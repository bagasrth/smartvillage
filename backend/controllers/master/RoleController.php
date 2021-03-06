<?php
/**
 * Created by PhpStorm.
 * User: ELL
 * Date: 22/10/2017
 * Time: 02.31
 */

namespace backend\controllers\master;
use backend\models\Role;
use Yii;
use yii\base\Exception;
use yii\helpers\Url;

use backend\controllers\BaseController;

class RoleController extends BaseController
{
    //public $enableCsrfValidation=false;

    public function behaviors()
    {
        return parent::behaviors(); // TODO: Change the autogenerated stub
    }
    public function actions()
    {
        return parent::actions(); // TODO: Change the autogenerated stub
    }
    public function  actionIndex(){
        if(!parent::isLogin()){
            return $this->redirect(Url::toRoute('site/login'));
        }

        $role = Role::find()->all();
        $sesi = $this->activeUser;
        $isAdmin = $this->isAdmin();

        $params = [
            'role' => $role,
            'sesi' => $sesi,
            'isAdmin' => $isAdmin
        ];
        if (Yii::$app->request->isPost) {
            return $this->renderPartial('index.tpl', $params);
        } else {
            return $this->render('index.tpl', $params);
        }

    }
    public  function  actionForm(){
        $id = Yii::$app->request->post('id', 0);
        if ($id) {
            $role = Role::findOne($id);
        } else {
            $role = new Role();
        }
        $params = [
            'data' => $role,
        ];
        return $this->renderPartial('form.tpl', $params);
    }
    public  function actionSave(){
        $id = Yii::$app->request->post('id', 0);
        if ($id) {
            $role =Role::findOne($id);
        }else{
            $role= new Role();
        }
        $role->name=Yii::$app->request->post('name', '');
        try{
            $role->save();
            return "
            <div class='alert alert-success'>Data berhasil disimpan</div>
            <script> reloadData(); closeModal(1500); </script>";
        }catch (Exception $e){
            return "
            <div class='alert alert-danger'>Data gagal disimpan</div>
            <script> reloadData(); closeModal(1500); </script>";
        }
    }
    public function  actionDelete(){
        $id = Yii::$app->request->post('id', 0);
        $role = Role::findOne($id);
        try {
            $role->delete();
            return "
            <div class='alert alert-success'>Data berhasil dihapus</div>
            <script> reloadData(); closeModal(1500); </script>";
        } catch (Exception $e) {
            return "
            <div class='alert alert-danger'>Terjadi kesalahan! Data gagal dihapus</div>";
        }
    }
}