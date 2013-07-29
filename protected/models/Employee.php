<?php

/**
 * This is the model class for table "employee".
 *
 * The followings are the available columns in table 'employee':
 * @property integer $id
 * @property string $name
 * @property string $surname
 * @property string $address
 * @property string $password
 * @property string $username
 * @property integer $usertype
 * @property string $phone
 * @property string $started
 * @property integer $company_id
 * @property integer $language_id
 * @property integer $is_active
 * @property integer $tshirt_size_id
 * @property integer $jersey_size_id
 * @property integer $trousers_size_id
 * @property integer $boots_size_id
 * @property integer $coat_size_id
 *
 * The followings are the available model relations:
 * @property Company $company
 * @property Language $language
 * @property Size $tshirtSize
 * @property Size $jerseySize
 * @property Size $trousersSize
 * @property Size $bootsSize
 * @property Size $coatSize
 */
class Employee extends CActiveRecord
{
    /**
     * Returns the static model of the specified AR class.
     * @param string $className active record class name.
     * @return Employee the static model class
     */
    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return 'employee';
    }


    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('name, surname, password, username, usertype', 'required'),
            array('company_id, language_id, is_active, tshirt_size_id, jersey_size_id, trousers_size_id, boots_size_id, coat_size_id', 'numerical', 'integerOnly' => true),
            array('name, surname', 'length', 'max' => 255),
            array('password, phone, email', 'length', 'max' => 512),
            array('username', 'length', 'max' => 256),
            array('address, started', 'safe'),
            array('username', 'unique'),
            array('email', 'email'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, name, surname, address, password, username, email, usertype, phone, started, company_id, language_id, is_active, tshirt_size_id, jersey_size_id, trousers_size_id, boots_size_id, coat_size_id', 'safe', 'on' => 'search'),
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
            'company' => array(self::BELONGS_TO, 'Company', 'company_id'),
            'language' => array(self::BELONGS_TO, 'Language', 'language_id'),
            'tshirtSize' => array(self::BELONGS_TO, 'Size', 'tshirt_size_id'),
            'jerseySize' => array(self::BELONGS_TO, 'Size', 'jersey_size_id'),
            'trousersSize' => array(self::BELONGS_TO, 'Size', 'trousers_size_id'),
            'bootsSize' => array(self::BELONGS_TO, 'Size', 'boots_size_id'),
            'coatSize' => array(self::BELONGS_TO, 'Size', 'coat_size_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'id' => 'ID',
            'name' => Yii::t('admin', 'Vardas'),
            'surname' => Yii::t('admin', 'Pavardė'),
            'address' => Yii::t('admin', 'Adresas'),
            'password' => Yii::t('admin', 'Slaptažodis'),
            'username' => Yii::t('admin', 'Prisijungimas'),
            'email' => Yii::t('admin', 'El. paštas'),
            'usertype' => Yii::t('admin', 'Vartotojo tipas'),
            'phone' => Yii::t('admin', 'Telefonas'),
            'started' => Yii::t('admin', 'Pradėjo dirbti'),
            'company_id' => Yii::t('admin', 'Įmonė'),
            'language_id' => Yii::t('admin', 'Kalba'),
            'is_active' => Yii::t('admin', 'Vartotojas aktyvuotas'),
            'tshirt_size_id' => Yii::t('admin', 'Marškinėlių dydis'),
            'jersey_size_id' => Yii::t('admin', 'Megztinio dydis'),
            'trousers_size_id' => Yii::t('admin', 'Kelnių dydis'),
            'boots_size_id' => Yii::t('admin', 'Batų dydis'),
            'coat_size_id' => Yii::t('admin', 'Striukės dydis')
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search()
    {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('name', $this->name, true);
        $criteria->compare('surname', $this->surname, true);
        $criteria->compare('address', $this->address, true);
        $criteria->compare('password', $this->password, true);
        $criteria->compare('username', $this->username, true);
        $criteria->compare('email', $this->email, true);
        $criteria->compare('usertype', $this->usertype);
        $criteria->compare('phone', $this->phone, true);
        $criteria->compare('started', $this->started, true);
        $criteria->compare('company_id', $this->company_id);
        $criteria->compare('language_id', $this->language_id);
        $criteria->compare('is_active', $this->is_active);
        $criteria->compare('tshirt_size_id', $this->tshirt_size_id);
        $criteria->compare('jersey_size_id', $this->jersey_size_id);
        $criteria->compare('trousers_size_id', $this->trousers_size_id);
        $criteria->compare('boots_size_id', $this->boots_size_id);
        $criteria->compare('coat_size_id', $this->coat_size_id);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
        ));
    }


    /**
     * @return string
     */
    public function getFullName()
    {
        return $this->name . ' ' . $this->surname;
    }
}