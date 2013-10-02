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
 * @property integer $is_paid
 * @property string $payment_date
 * @property string $working_sum
 * @property string $travel_sum
 * @property string $parking_sum
 * @property string $job_sum
 *
 * The followings are the available model relations:
 * @property Customer $customer
 * @property Status $status
 */
class Project extends CActiveRecord
{

    public $working_sum;
    public $travel_sum;
    public $parking_sum;
    public $job_sum;
    public $priority;


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
            array('customer_id, status_id, is_checkout, is_paid', 'numerical', 'integerOnly' => true),
            array('pid', 'length', 'max' => 8),
            array('title', 'length', 'max' => 1024),
            array('start, project_start, project_end, payment_date', 'date', 'format' => 'dd.MM.yyyy'),
            //array('adress, start, project_start, project_end, payment_date', 'safe'),
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
            'job' => array(self::HAS_ONE, 'Job', 'project_id'),
        );
    }

    /**
     * Added custom behavior for MANY_MANY handling
     * @return array
     *
     */
    public function behaviors()
    {
        return array(
            'CAdvancedArBehavior' => array('class' => 'application.extensions.CAdvancedArBehavior'),
            'datetimeI18NBehavior' => array('class' => 'ext.DateTimeI18NBehavior')
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
            'start' => 'Įvedimo data',
            'project_start' => 'Projekto pradžia',
            'project_end' => 'Projekto pabaiga',
            'status_id' => 'Statusas',
            'is_checkout' => 'Sąskaita išsiųsta',
            'is_paid' => 'Apmokėta',
            'payment_date' => 'Apmokėti iki',
            'darbu_kiekis' => Yii::t('admin', 'Darbų kiekis'),
            'priority' => Yii::t('admin', 'Priori'),
            'parking_sum' => Yii::t('admin', 'Parkavimas'),
            'working_sum' => Yii::t('admin', 'Pradirbta'),
            'travel_sum' => Yii::t('admin', 'Kelionė'),
            'job_sum' => Yii::t('admin', 'Darbai'),
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
        $criteria->compare('is_paid', $this->is_paid);
        $criteria->compare('payment_date', $this->payment_date);

        $size = Yii::app()->user->getState('grid');
        $size = isset($size[$this->tableName() . '/admin']) ? $size[$this->tableName() . '/admin'] : 25;

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array('pageSize' => $size),
        ));
    }

    /**
     * Check unpaid projects
     * @return CActiveDataProvider
     */
    public function invoice()
    {
        $criteria = new CDbCriteria;
        $criteria->with = array('customer');
        $criteria->select = array("*", "project_priority(t.project_end,t.is_checkout,t.payment_date,t.is_paid) as priority");
        $criteria->together = true;

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
        $criteria->compare('is_paid', $this->is_paid);
        $criteria->compare('payment_date', $this->payment_date);

        $size = Yii::app()->user->getState('grid');
        $size = isset($size[$this->tableName() . '/invoice']) ? $size[$this->tableName() . '/invoice'] : 25;

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'sort' => array(
                'defaultOrder' => 'priority, ISNULL(project_end), project_end DESC',
            ),
            'pagination' => array('pageSize' => $size),
        ));
    }

    /**
     * Check unpaid projects
     * @return CActiveDataProvider
     */
    public function outlay()
    {
        $criteria = new CDbCriteria;
        $criteria->select = "*, SEC_TO_TIME(SUM(TIME_TO_SEC(job.work_end) - TIME_TO_SEC(job.work_start))) as working_sum, sum(job.parking_cost) as parking_sum, SEC_TO_TIME(SUM(TIME_TO_SEC(job.travel_time))) as travel_sum, count(job.id) as job_sum";
        $criteria->with = array('job' => array('joinType' => 'INNER JOIN'));
        $criteria->group = 't.id';
        $criteria->together = true;

        $size = Yii::app()->user->getState('grid');
        $size = isset($size[$this->tableName() . '/outlay']) ? $size[$this->tableName() . '/outlay'] : 25;

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array('pageSize' => $size),
        ));
    }

    /**
     *
     */
    public function getCssClass()
    {
        if($this->priority == 4)
            return "green";

        //if($this->project_end < date("d.m.Y") & $this->is_checkout == 0 & $this->payment_date >= date("d.m.Y"))
        if($this->priority == 3)
            return "red_leters";

        //if($this->project_end < date("d.m.Y") & $this->is_checkout == 1 & $this->payment_date >= date("d.m.Y"))
        if($this->priority == 2)
            return "red_leters yellow_back";

        //if($this->project_end < date("d.m.Y") & $this->is_checkout == 1 & $this->payment_date < date("d.m.Y") & $this->is_paid == 0)
        if($this->priority == 1)
            return "black_leters red_back";
    }


    public function getFullTitle()
    {
        return $this->pid . " / " . $this->title;
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
