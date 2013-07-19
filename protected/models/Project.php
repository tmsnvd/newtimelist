<?php

/**
 * This is the model class for table "project".
 *
 * The followings are the available columns in table 'project':
 * @property integer $id
 * @property string $pid
 * @property string $title
 * @property string $adress
 * @property integer $customer_id
 * @property string $start
 * @property string $project_start
 * @property string $project_end
 * @property integer $status_id
 * @property integer $is_checkout
 *
 * The followings are the available model relations:
 * @property Customer $customer
 * @property Status $status
 */
class Project extends CActiveRecord
{
    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return 'project';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('title', 'required'),
            array('customer_id, status_id, is_checkout', 'numerical', 'integerOnly' => true),
            array('pid', 'length', 'max' => 8),
            array('title', 'length', 'max' => 1024),
            array('adress, start, project_start, project_end', 'safe'),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('id, pid, title, adress, customer_id, start, project_start, project_end, status_id, is_checkout', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations()
    {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'customer' => array(self::BELONGS_TO, 'Customer', 'customer_id'),
            'status' => array(self::BELONGS_TO, 'Status', 'status_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'id' => 'ID',
            'pid' => 'Projekto ID',
            'title' => 'Pavadinimas',
            'adress' => 'Adresas',
            'customer_id' => 'Užsakovas',
            'start' => 'Pradžia',
            'project_start' => 'Projekto pradžia',
            'project_end' => 'Projekto pabaiga',
            'status_id' => 'Statusas',
            'is_checkout' => 'Sumokėta',
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     *
     * Typical usecase:
     * - Initialize the model fields with values from filter form.
     * - Execute this method to get CActiveDataProvider instance which will filter
     * models according to data in model fields.
     * - Pass data provider to CGridView, CListView or any similar widget.
     *
     * @return CActiveDataProvider the data provider that can return the models
     * based on the search/filter conditions.
     */
    public function search()
    {
        // @todo Please modify the following code to remove attributes that should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('pid', $this->pid, true);
        $criteria->compare('title', $this->title, true);
        $criteria->compare('adress', $this->adress, true);
        $criteria->compare('customer_id', $this->customer_id);
        $criteria->compare('start', $this->start, true);
        $criteria->compare('project_start', $this->project_start, true);
        $criteria->compare('project_end', $this->project_end, true);
        $criteria->compare('status_id', $this->status_id);
        $criteria->compare('is_checkout', $this->is_checkout);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
        ));
    }

    /**
     * Returns the static model of the specified AR class.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Project the static model class
     */
    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }
}
