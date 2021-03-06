<?php
/**
 * Created by PhpStorm.
 * User: ELL
 * Date: 02/11/2017
 * Time: 11.37
 */

namespace backend\models;


class Agama extends BaseModel
{
    public function behaviors()
    {
        return [];
    }

    public static function tableName()
    {
        return 'agama';
    }

    public static function primaryKey()
    {
        $primary_key = 'id';
        return array($primary_key);
    }

    public function attributeLabels()
    {
        $field = ['id', 'nama'];

        $attributeLabels = array();
        foreach ($field as $key) {
            $attributeLabels[$key] = ucwords(str_replace('_', ' ', $key));
        }

        return $attributeLabels;
    }
}