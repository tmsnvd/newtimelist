<?php
/**
 * The following variables are available in this template:
 * - $this: the BootCrudCode object
 */
?>
<?php
echo "<?php\n";
$nameColumn=$this->guessNameColumn($this->tableSchema->columns);
$label=$this->pluralize($this->class2name($this->modelClass));
echo "\$this->breadcrumbs=array(
	'$label'=>array('index'),
	\$model->{$nameColumn}=>array('view','id'=>\$model->{$this->tableSchema->primaryKey})
);\n";
?>
/*
$this->menu=array(
	array('label'=>'List <?php echo $this->modelClass; ?>','url'=>array('index')),
	array('label'=>'Create <?php echo $this->modelClass; ?>','url'=>array('create')),
	array('label'=>'View <?php echo $this->modelClass; ?>','url'=>array('view','id'=>$model-><?php echo $this->tableSchema->primaryKey; ?>)),
	array('label'=>'Manage <?php echo $this->modelClass; ?>','url'=>array('admin')),
);
*/
?>
<div class="box box-color box-bordered">

    <div class="box-title">
        <h3>
            <i class="icon-th-list"></i><?php echo "<?php echo Yii::t('admin', 'Redaguoti'), ' ', Yii::t('admin', 'projektą'); ?>"; ?>: <?php echo '<?php echo $model->title; ?>'; ?>
        </h3>
    </div>

    <div class="box-content">
        <?php echo "<?php echo \$this->renderPartial('_form',array('model'=>\$model)); ?>"; ?>
    </div>

</div>