<div class="box box-color box-bordered">
    <div class="box-title">
        <h3>
            <i class="icon-table"></i>
            <?php echo Yii::t('admin', 'Darbų'), ' ', Yii::t('admin', 'sąrašas'); ?>
        </h3>

        <div class="actions">
            <a href="<?php echo CHtml::normalizeUrl(array('Job/create')); ?>" class="btn btn-small"
               rel="tooltip" data-original-title="<?php echo Yii::t('admin', 'Sukurti'); ?>"><i
                    class="icon-plus"></i> <?php echo Yii::t('admin', 'Naujas'); ?></a>
            <?php $this->widget('bootstrap.widgets.TopazGridDropDown', array('c' => 'job')); ?>
        </div>
    </div>

    <?php

    Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('job-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
    ?>

    <!--
    <p>
    You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
    or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
    </p>
    -->


    <div class="search-form" style="display:none">
        <?php $this->renderPartial('_search', array(
            'model' => $model,
        )); ?>
    </div>
    <!-- search-form -->

    <?php $this->widget('bootstrap.widgets.TbGridView', array(
        'ajaxUpdate' => false,
        'template' => '<div class="">{items}{summary}{pager}</div>',
        'dataProvider' => $model->search(),
        'filter' => $model,
        'filterCssClass' => 'thefilter',
        'summaryCssClass' => 'dataTables_info',
        'summaryCssClass' => 'table-pagination',
        'pagerCssClass' => 'table-pagination',
        'pager' => array('class' => 'bootstrap.widgets.TbPager', 'header' => ''),
        'summaryText' => Yii::t('admin', 'Rodomi įrašai:  <span>{start}</span> - <span>{end}</span> iš <span>{count}</span>'),
        'htmlOptions' => array(
            'class' => 'box-content nopadding',
        ),
        'itemsCssClass' => 'table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable',
        'id' => 'job-grid',
        'columns' => array(
            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'id',
                'type' => 'html',
                'value' => function ($data)
                {
                    return CHtml::link($data->id, CHtml::normalizeUrl(array('/Job/update/' . $data->id)));
                },
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                )),

            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'created',
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                ),
                'filterInputHtmlOptions' => array(
                    'input_class' => 'datepick',
                    'input_id' => 'created'
                )),
            /*
            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'work_hour',
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                )),

            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'travel_time',
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                )),

            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'parking_cost',
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                )),

            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'comment',
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                )),

 */
            array(
                'class' => 'bootstrap.widgets.TbGridColumn',
                'name' => 'project_id',
                'filter' => CHtml::listData(Project::model()->findAll(), 'id', 'title'),
                'headerHtmlOptions' => array(
                    'class' => 'sorting',
                    'role' => 'columnheader'
                ),
                'value' => function ($data)
                {
                    //d($data->materials);
                    //d($data->jobNames);
                    //d($data->extraJobs);
                    return $data->project->title;
                }),

            array(
                'class' => 'bootstrap.widgets.TbButtonColumn',
                'header' => Yii::t('admin', 'Veiksmai'),
                'viewButtonIcon' => false
            ),
        ),
    )); ?>
</div>