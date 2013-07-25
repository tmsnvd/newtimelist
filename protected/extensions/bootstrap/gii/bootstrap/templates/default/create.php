<?php
/**
 * The following variables are available in this template:
 * - $this: the BootCrudCode object
 */
?>
<?php
echo "<?php\n";
$label=$this->pluralize($this->class2name($this->modelClass));
echo "\$this->breadcrumbs=array(
	Yii::t('admin', '$label') => array('admin'),
	Yii::t('admin', 'Kurti')
);\n";
?>

/*
$this->menu=array(
	array('label'=>'List <?php echo $this->modelClass; ?>','url'=>array('index')),
	array('label'=>'Manage <?php echo $this->modelClass; ?>','url'=>array('admin')),
);
*/

?>
<div class="box box-bordered box-color">
    <div class="box-title">
        <h3><i class="icon-th-list"></i> <?php echo $this->modelClass; ?></h3>
    </div>
    <div class="box-content">
    <?php echo "<?php echo \$this->renderPartial('_form', array('model'=>\$model)); ?>"; ?>
    </div>
</div>
