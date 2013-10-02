<?php

class JobController extends Controller
{
    /**
     * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
     * using two-column layout. See 'protected/views/layouts/column2.php'.
     */
    public $layout = '//layouts/column2';

    /**
     * @return array action filters
     */
    public function filters()
    {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    /**
     * Specifies the access control rules.
     * This method is used by the 'accessControl' filter.
     * @return array access control rules
     */
    public function accessRules()
    {
        return array(
            array('allow', // allow all users to perform 'index' and 'view' actions
                'actions' => array('index', 'view'),
                'users' => array('*'),
            ),
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'actions' => array('create', 'update', 'worker', 'ajaxGetUnit', 'not'),
                'users' => array('@'),
            ),
            array('allow', // allow admin user to perform 'admin' and 'delete' actions
                'actions' => array('admin', 'delete', 'ajaxGetUnit'),
                'users' => array('admin'),
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    /**
     * Displays a particular model.
     * @param integer $id the ID of the model to be displayed
     */
    public function actionView($id)
    {
        $this->render('view', array(
            'model' => $this->loadModel($id),
        ));
    }

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreate()
    {
        $model = new Job;

        // Uncomment the following line if AJAX validation is needed
        // $this->performAjaxValidation($model);

        if (isset($_POST['Job']))
        {
            $connection = Yii::app()->db;
            $transaction = $connection->beginTransaction();
            try
            {
                $model->attributes = $_POST['Job'];
                $model->employee_id = Yii::app()->user->getState('id');

                $jobNames = Yii::app()->request->getPost('jobNames', array());
                $cleanNames = array();
                foreach ($jobNames as $name)
                {
                    if($name[0] != '')
                        $cleanNames[] = $name;
                }

                $jobNames2 = Yii::app()->request->getPost('jobNames2', array());
                $cleanNames2 = array();
                foreach ($jobNames2 as $name)
                {
                    if($name[0] != '')
                        $cleanNames2[] = $name;
                }

                $model->jobNames = $cleanNames + $cleanNames2;

                $materials = Yii::app()->request->getPost('materials', array());
                $cleanMaterials = array();
                foreach ($materials as $name)
                {
                    if($name[0] != '')
                        $cleanMaterials[] = $name;
                }
                $model->materials = $cleanMaterials;

                $extraJob = Yii::app()->request->getPost('extraJobs', array());
                $cleanJobs = array();
                foreach ($extraJob as $name)
                {
                    if($name[0] != '')
                        $cleanJobs[] = $name;
                }
                $model->extraJobs = $cleanJobs;

                if ($model->save())
                {
                    //$transaction->rollback();
                    $transaction->commit();
                    $type = Yii::app()->user->getId();
                    $this->redirect(array($type));
                }
            }
            catch (Exception $e)
            {
                d($e);
                d($e);
                $transaction->rollback();
            }
        }

        $this->render('create', array(
            'model' => $model,
        ));

        //d($jobs);
    }

    /**
     * Updates a particular model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id the ID of the model to be updated
     * @throws CHttpException
     */
    public function actionUpdate($id)
    {
        $model = Job::model()->with('nameValue', 'jobNameValues')->findByPk($id); //$this->loadModel($id);

        if($model->employee_id != Yii::app()->user->getState('id'))
        {
            if(Yii::app()->user->getId() != "admin")
                throw new CHttpException(404, 'Not your job!');
        }

        if (isset($_POST['Job']))
        {
            $model->attributes = $_POST['Job'];

            if ($model->save())
                $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
        }

        $this->render('update', array(
            'model' => $model,
        ));
    }

    /**
     * Deletes a particular model.
     * If deletion is successful, the browser will be redirected to the 'admin' page.
     * @param integer $id the ID of the model to be deleted
     * @throws CHttpException
     */
    public function actionDelete($id)
    {
        $model = $this->loadModel($id);

        if($model->employee_id != Yii::app()->user->getState('id'))
        {
            if(Yii::app()->user->getId() != "admin")
                throw new CHttpException(404, 'Not your job!');
        }

        $model->delete();

        if (!isset($_GET['ajax']))
            $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));

    }

    /**
     * Manages all models.
     */
    public function actionAdmin()
    {
        $model = new Job('search');
        $model->unsetAttributes(); // clear any default values

        if (isset($_GET['Job']))
            $model->attributes = $_GET['Job'];

        $this->render('admin', array(
            'model' => $model,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionWorker()
    {
        $model = new Job('search');
        $model->unsetAttributes(); // clear any default values

        if (isset($_GET['Job']))
            $model->attributes = $_GET['Job'];

        $model->employee_id = Yii::app()->user->getState('id');

        $this->render('worker', array(
            'model' => $model,
        ));
    }

    /**
     * @todo Tą dieną, kai nedirbama, negalima pildyti darbų
     */
    public function actionNot()
    {
        $model = new Job();
        $model->unsetAttributes(); // clear any default values

        if (isset($_POST['Job']))
        {
            $model->attributes = $_POST['Job'];
            $model->employee_id = Yii::app()->user->getState('id');
            $model->project_id = 187; //187
            $model->created = date("d.m.Y");
            $model->work_start = "00:00";
            $model->work_end = "00:00";

            if ($model->save())
                $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('worker'));
        }

        $this->render('not', array(
            'model' => $model,
        ));
    }


    /**
     * Returns the data model based on the primary key given in the GET variable.
     * If the data model is not found, an HTTP exception will be raised.
     * @param $id
     * @throws CHttpException
     * @return \CActiveRecord
     * @internal param \the $integer ID of the model to be loaded
     */
    public function loadModel($id)
    {
        $model = Job::model()->with(array('jobNames', 'materials', 'extraJobs'))->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, 'Užklausa negali būti įvykdyta');
        return $model;
    }



    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model)
    {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'job-form')
        {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }
}
