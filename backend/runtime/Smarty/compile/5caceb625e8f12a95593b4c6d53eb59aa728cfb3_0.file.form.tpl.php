<?php
/* Smarty version 3.1.31, created on 2017-10-22 03:16:52
  from "D:\xampp\htdocs\smartvillage\backend\views\master\user\form.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.31',
  'unifunc' => 'content_59ebab3443d8c1_73768783',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5caceb625e8f12a95593b4c6d53eb59aa728cfb3' => 
    array (
      0 => 'D:\\xampp\\htdocs\\smartvillage\\backend\\views\\master\\user\\form.tpl',
      1 => 1508616916,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59ebab3443d8c1_73768783 (Smarty_Internal_Template $_smarty_tpl) {
?>




<div id="result-user"></div>
<form id="form-user" onsubmit="return false;" class="form-horizontal" enctype="multipart/form-data">
    <div class="form-group">
        <label for="name" class="col-sm-3 col-xs-12 control-label">Nama</label>
        <div class="col-sm-8 col-xs-12">
            <?php echo yii\helpers\Html::input("text","name",$_smarty_tpl->tpl_vars['data']->value->name,array("class"=>"form-control","required"=>''));?>

        </div>
    </div>
    <div class="form-group">
        <label for="roles_id" class="col-sm-3 col-xs-12 control-label">Role</label>
        <div class="col-sm-8 col-xs-12">
            <?php if ($_smarty_tpl->tpl_vars['data']->value->id == 0) {?>
                <?php echo yii\helpers\Html::dropDownList("roles_id",$_smarty_tpl->tpl_vars['data']->value->roles_id,$_smarty_tpl->tpl_vars['roleOption']->value,array("class"=>"form-control"));?>

            <?php } else { ?>
                <?php echo yii\helpers\Html::input("text","roles_id",$_smarty_tpl->tpl_vars['data']->value->role->name,array("readonly"=>'',"class"=>"form-control","required"=>''));?>

            <?php }?>
        </div>
    </div>
	 <div class="form-group">
        <label for="username" class="col-sm-3 col-xs-12 control-label">Username</label>
        <div class="col-sm-8 col-xs-12">
            <?php echo yii\helpers\Html::input("text","username",$_smarty_tpl->tpl_vars['data']->value->username,array("class"=>"form-control","required"=>''));?>

        </div>
    </div>
	 <div class="form-group">
        <label for="email" class="col-sm-3 col-xs-12 control-label">Email</label>
        <div class="col-sm-8 col-xs-12">
            <?php echo yii\helpers\Html::input("email","email",$_smarty_tpl->tpl_vars['data']->value->email,array("class"=>"form-control","required"=>''));?>

        </div>
    </div>
    <div class="form-group">
        <label for="photo" class="col-sm-3 col-xs-12 control-label">Foto</label>
        <div class="col-sm-8 col-xs-12">
            <?php echo yii\helpers\Html::fileInput('Uploader[file]',null,array('class'=>'form-control'));?>

        </div>
    </div>

    <?php if (intval($_smarty_tpl->tpl_vars['data']->value->id) == 0) {?>
    <div class="form-group">
        <label for="password" class="col-sm-3 col-xs-12 control-label">Password</label>
        <div class="col-sm-8 col-xs-12">
            <?php echo yii\helpers\Html::passwordInput("password",null,array("class"=>"form-control","required"=>''));?>

        </div>
    </div>
    <div class="form-group">
        <label for="password2" class="col-sm-3 col-xs-12 control-label">Konfirmasi Password</label>
        <div class="col-sm-8 col-xs-12">
            <?php echo yii\helpers\Html::passwordInput("password2",null,array("class"=>"form-control","required"=>''));?>

        </div>
    </div>
    <?php }?>

    <div class="form-group">
        <label class="col-sm-3 col-xs-12 control-label"></label>
        <div class="col-sm-8 col-xs-12">
            <input class="btn btn-primary" type="submit" value="Simpan">
            <?php if (intval($_smarty_tpl->tpl_vars['data']->value->id) != 0) {?>
            <a onclick="loadModal(this)" target="master/user/change-password" data="id=<?php echo $_smarty_tpl->tpl_vars['data']->value->id;?>
" class="btn btn-primary">Ubah Password</a>
            <?php }?>
        </div>
    </div>

    <?php echo yii\helpers\Html::hiddenInput('id',$_smarty_tpl->tpl_vars['data']->value->id);?>

    <?php echo yii\helpers\Html::hiddenInput(Yii::$app->request->csrfParam,Yii::$app->request->csrfToken);?>

</form>

<?php echo '<script'; ?>
>
    $("#form-user").submit(function () {
        var data = getFormData("form-user");
        ajaxTransfer("master/user/save", data, "#result-user");
    })

    $('select[name=roles_id]').chosen();
<?php echo '</script'; ?>
><?php }
}
