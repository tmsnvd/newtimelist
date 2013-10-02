<?php

/*
 * DateTimeI18NBehavior
 * Automatically converts date and datetime fields to I18N format
 * 
 * Author: Ricardo Grana <rickgrana@yahoo.com.br>, <ricardo.grana@pmm.am.gov.br>
 * Version: 1.1
 * Requires: Yii 1.0.9 version 
 */

/**
 * Class DateTimeI18NBehavior
 */
class DateTimeI18NBehavior extends CActiveRecordBehavior
{
    /**
     * @var string
     */
    public $dateOutcomeFormat = 'd-m-Y';
    /**
     * @var string
     */
    public $dateTimeOutcomeFormat = 'Y-m-d H:i:s';

    /**
     * @var string
     */
    public $dateIncomeFormat = 'd-m-Y';

    /**
     * @var string
     */
    public $dateTimeIncomeFormat = 'yyyy-MM-dd hh:mm:ss';

    /**
     * @param CModelEvent $event
     * @return bool|void
     */
    public function beforeSave($event)
    {

        //search for date/datetime columns. Convert it to pure PHP date format
        foreach ($event->sender->tableSchema->columns as $columnName => $column)
        {

            if (($column->dbType != 'date') and ($column->dbType != 'datetime')) continue;

            if (!strlen($event->sender->$columnName))
            {
                $event->sender->$columnName = null;
                continue;
            }

            if (($column->dbType == 'date'))
            {
                //$event->sender->$columnName = date($this->dateOutcomeFormat, CDateTimeParser::parse($event->sender->$columnName, Yii::app()->locale->dateFormat));
                $event->sender->$columnName = Yii::app()->dateFormatter->format('yyyy-MM-dd', CDateTimeParser::parse($event->sender->$columnName, "dd.MM.yyyy"));
            }

            /*else
            {

                $event->sender->$columnName = date($this->dateTimeOutcomeFormat,
                    CDateTimeParser::parse($event->sender->$columnName,
                        strtr(Yii::app()->locale->dateTimeFormat,
                            array("{0}" => Yii::app()->locale->timeFormat,
                                "{1}" => Yii::app()->locale->dateFormat))));
            }*/

        }

        return true;
    }

    /**
     * @param CEvent $event
     * @return bool|void
     */
    public function afterFind($event)
    {
        foreach ($event->sender->tableSchema->columns as $columnName => $column)
        {
            if (($column->dbType != 'date') and ($column->dbType != 'time')) continue;

            if (!strlen($event->sender->$columnName))
            {
                $event->sender->$columnName = null;
                continue;
            }

            if ($column->dbType == 'date')
            {
                $event->sender->$columnName = Yii::app()->dateFormatter->format('dd.MM.yyyy', CDateTimeParser::parse($event->sender->$columnName, "yyyy-MM-dd"));
            }
        }
        return true;
    }
}