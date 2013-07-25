<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Tomas
 * Date: 13.7.10
 * Time: 11.43
 * To change this template use File | Settings | File Templates.
 */

Yii::import('zii.widgets.grid.CDataColumn');

class TbGridColumn extends CDataColumn
{

    public $filterInputHtmlOptions = array();

    public function init()
    {
        parent::init();
    }


    /**
     * Renders the header cell.
     */
    public function renderHeaderCell()
    {
        $this->headerHtmlOptions['id'] = $this->id;
        echo CHtml::openTag('th', $this->headerHtmlOptions, 'sorting_asc');
        $this->renderHeaderCellContent();
        echo "</th>";
    }

    /**
     *
     */
    public function renderFilterCell()
    {
        echo CHtml::openTag('th', $this->filterHtmlOptions);
        echo CHtml::openTag('span', array('class' => 'filter_column filter_text'));
        $this->renderFilterCellContent();
        echo "</span>";
        echo "</th>";
    }

    /**
     *
     */
    protected function renderFilterCellContent()
    {
        if (is_string($this->filter))
            echo $this->filter;
        elseif ($this->filter !== false && $this->grid->filter !== null && $this->name !== null && strpos($this->name, '.') === false)
        {
            if (is_array($this->filter))
                echo CHtml::activeDropDownList($this->grid->filter, $this->name, $this->filter, array('id' => false, 'prompt' => ''));
            elseif ($this->filter === null)
            {
                $class = isset($this->filterInputHtmlOptions['input_class']) ? $this->filterInputHtmlOptions['input_class'] : "";
                $id = isset($this->filterInputHtmlOptions['input_id']) ? $this->filterInputHtmlOptions['input_id'] : "";
                $readonly = isset($this->filterInputHtmlOptions['readonly']) ? 1 : 0;

                echo CHtml::activeTextField($this->grid->filter, $this->name, array('id' => $id, 'class' => 'text_filter search_init ' . $class, 'readonly' => $readonly ));
            }
        } else
            parent::renderFilterCellContent();
    }

}