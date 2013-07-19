<?php
/**
 * The following variables are available in this template:
 * - $this: the BootCrudCode object
 */
?>
<div class="box box-bordered">
    <div class="box-title">
        <h3>
            <i class="icon-table"></i>
            <?php echo $this->pluralize($this->class2name($this->modelClass)); ?>
            <?php echo "<?php echo Yii::t('admin', '__-'), ' ', Yii::t('admin', 'sąrašas');"; ?></h3>
        </h3>
    </div>

<?php
echo "<?php\n";
$label=$this->pluralize($this->class2name($this->modelClass));
echo "\$this->breadcrumbs=array(
	Yii::t('admin', '$label') => array('admin'),
	Yii::t('admin', 'Valdyti'),
);\n";
?>

$this->menu=array(
	array('label'=>'List <?php echo $this->modelClass; ?>','url'=>array('index')),
	array('label'=>'Create <?php echo $this->modelClass; ?>','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('<?php echo $this->class2id($this->modelClass); ?>-grid', {
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

<?php /* echo "<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>"; */ ?>

<div class="search-form" style="display:none">
<?php echo "<?php \$this->renderPartial('_search',array(
	'model'=>\$model,
)); ?>\n"; ?>
</div><!-- search-form -->

<?php echo "<?php"; ?> $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'<?php echo $this->class2id($this->modelClass); ?>-grid',
    'template' => '<div id="table" class="table table-hover table-nomargin" role="grid">{items}{summary}{pager}</div>',
    'dataProvider'=>$model->search(),
    'filter'=>$model,
    'filterCssClass' => 'thefilter',
    'summaryCssClass' => 'dataTables_info',
    'pagerCssClass' => 'table-pagination',
    'pager' => array('class' => 'bootstrap.widgets.TbPager', 'header' => ''),
    'summaryText' => 'Showing <span>{start}</span> - <span>{end}</span> of <span>{count}</span> entries',
    'htmlOptions' => array(
    'class' => 'box-content nopadding',
    ),
    'itemsCssClass' => 'table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable',
	'columns'=> array(
<?php
$count=0;
foreach($this->tableSchema->columns as $column)
{
    if($column->name == 'id')
        continue;

	if(++$count==7)
		echo "\t\t/*\n";
	    echo "\t\t";
    if($column->name == 'title')
    {
    ?>
    array(
        'class'=>'bootstrap.widgets.TbGridColumn',
        'name'=>'<?php echo $column->name; ?>',
        'type' => 'html',
        'value' => function($data){
            return CHtml::link($data->title, CHtml::normalizeUrl(array('/<?php echo $this->class2name($this->modelClass) ?>/update/' . $data->id)));
        },
        'headerHtmlOptions' => array(
            'class' => 'sorting',
            'role' => 'columnheader'
    )),
    <?php
    }
    else
    {
    ?>
    array(
        'class'=>'bootstrap.widgets.TbGridColumn',
        'name'=>'<?php echo $column->name; ?>',
        'headerHtmlOptions' => array(
            'class' => 'sorting',
            'role' => 'columnheader'
    )),
    <?php
    }
    echo "\n";
}
if($count>=7)
	echo "\t\t*/\n";
?>
        array(
            'class'=>'bootstrap.widgets.TbButtonColumn',
            'header' => 'Actions',
            'viewButtonIcon' => false
        ),
	),
)); ?>
</div>