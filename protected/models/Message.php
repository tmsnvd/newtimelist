<?php

/**
 * This is the model class for table "message".
 *
 * The followings are the available columns in table 'message':
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $create_time
 * @property integer $read
 * @property integer $employee_id
 *
 * The followings are the available model relations:
 * @property Employee $employee
 */
class Message extends CActiveRecord
{
    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return 'message';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('title, description, create_time, employee_id', 'required'),
            array('read, employee_id', 'numerical', 'integerOnly' => true),
            array('title', 'length', 'max' => 256),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('id, title, description, create_time, read, employee_id', 'safe', 'on' => 'search'),
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
            'employee' => array(self::BELONGS_TO, 'Employee', 'employee_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'id' => 'ID',
            'title' => 'Pavadinimas',
            'description' => 'Tekstas',
            'create_time' => 'Data',
            'read' => 'Perskaitytas',
            'employee_id' => 'Darbuotojas',
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
        $criteria->compare('title', $this->title, true);
        $criteria->compare('description', $this->description, true);
        $criteria->compare('create_time', $this->create_time, true);
        $criteria->compare('read', $this->read);
        $criteria->compare('employee_id', $this->employee_id);

        $size = Yii::app()->user->getState('grid');
        $size = isset($size[$this->tableName() . '/admin']) ? $size[$this->tableName() . '/admin'] : 10;

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array('pageSize' => $size),
        ));
    }

    /**
     * Get latest messages ordered by creation time
     * @param int $limit
     * @return $this
     */
    public function recently($limit = 5)
    {
        $this->getDbCriteria()->mergeWith(array(
            'order' => 'create_time DESC',
            'limit' => $limit,
        ));
        return $this;
    }

    /**
     * Get unread messages
     * @return $this
     */
    public function unread()
    {
        $this->getDbCriteria()->mergeWith(array(
            'condition' => "`read` = '0'"
        ));
        return $this;
    }

    /**
     * Returns the static model of the specified AR class.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Message the static model class
     */
    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }
}
