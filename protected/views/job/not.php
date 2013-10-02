<?php

$this->breadcrumbs = array(
    Yii::t('admin', 'Nedarbo dienos')
);

$form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id' => 'not-form',
    'htmlOptions' => array(
        'class' => 'form-vertical',
    ),
    'enableAjaxValidation' => false,
));


$model->comment = "Išeiginės";
$model->holiday = date("d.m.Y");

?>

    <div class="box box-bordered box-color">
        <div class="box-title">
            <h3><i class="icon-th-list"></i> <?php echo Yii::t('admin', 'Išeiginė') ?></h3>
        </div>
        <div class="box-content">
            <?php echo $form->errorSummary($model); ?>
            <?php
            echo $form->textFieldRow($model, 'holiday', array('class' => 'datepick', 'maxlength' => 10, 'labelOptions'=>array('label'=>"Nuo " . $model->holiday . " iki ")));
            echo $form->textAreaRow($model, 'comment', array('class' => 'span5', 'maxlength' => 1024));
            ?>
            <div class="form-actions">
                <?php $this->widget('bootstrap.widgets.TbButton', array(
                    'buttonType' => 'submit',
                    'type' => 'primary',
                    'label' => $model->isNewRecord ? Yii::t('admin', 'Sukurti') : Yii::t('admin', 'Išsaugoti'),
                )); ?>
            </div>
        </div>
    </div>


<?php $this->endWidget(); ?>