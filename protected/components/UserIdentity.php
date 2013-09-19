<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
    private $_id;

    /**
     * Authenticates a user.
     * The example implementation makes sure if the username and password
     * are both 'demo'.
     * In practical applications, this should be changed to authenticate
     * against some persistent user identity storage (e.g. database).
     * @return boolean whether authentication succeeds.
     */
    public function authenticate()
    {
        $record = Employee::model()->findByAttributes(array('username' => $this->username)); // here I use Email as user name which comes from database

        if ($record === null)
        {
            $this->_id = 'user Null';
            $this->errorCode = self::ERROR_USERNAME_INVALID;
        }
        else if (CPasswordHelper::verifyPassword($this->password, $record->password) == false) // here I compare db password with password field
        {
            $this->_id = $this->username;
            $this->errorCode = self::ERROR_PASSWORD_INVALID;
        }
        else if ($record['is_active'] != 1) //  here I check status as Active in db
        {
            $this->errorCode = Y::t('login', 'Prisijungimas išjungtas');
        }
        else
        {
            $this->_id = $record->usertype;
            $this->errorCode = self::ERROR_NONE;

            $this->setState('__name', $record->usertype);
            $this->setState('title', $record->name);
            $this->setState('id', $record->id);

            $settings = Setting::model()->findAll('employee_id=:eid', array(':eid' => $record->id));
            $grid = array();

            foreach($settings as $s)
            {
                $grid[$s->title] = $s->value;
            }
            $this->setState('grid', $grid);
            Yii::app()->user->setState('_timeZone', 'Europe/Vilnius');

            //Yii::app()->localtime->Locale = 'lt_lt'; // eg 'en_gb'
            //Yii::app()->localtime->TimeZone = 'Europe/Vilnius'; //$user->timezone->name;
            //Yii::app()->localtime->dateFormat = 'long'; //$user->timezone->name;


        }

        return !$this->errorCode;
    }


    /**
     * @return mixed|string
     */
    public function getId() //  override Id
    {
        return $this->_id;
    }
}