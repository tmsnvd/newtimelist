<?php

/**
 * Class TopazMessageDropDown
 * Message center drop down list
 */
class TopazGridDropDown extends CWidget
{

    public $c = "site";
    public $a = "admin";

    /**
     * Initializes the widget.
     */
    public function init()
    {

    }

    /**
     * Runs the widget.
     */
    public function run()
    {
        $grid = Yii::app()->user->getState('grid');
        $count = isset($grid[$this->c . '/' . $this->a]) ? $grid[$this->c . '/' . $this->a] : 10;

        echo CHtml::dropDownList($this->c . '_record_count', $count, array('10' => 10, '25' => '25', '50' => 50, '75' => 75, '100' => 100, '500' => 500), array('submit' => array('site/grid/c/' . $this->c . '/a/' . $this->a), 'params' => array('count' => 'js: $(this).val()'), 'class' => 'input-small', 'style' => 'margin: 0 0 0 20px; width: 70px;'));
    }

}