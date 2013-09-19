<?php

class SiteController extends Controller
{
    /**
     * Declares class-based actions.
     */
    public function actions()
    {
        return array();
    }

    /**
     * This is the default 'index' action that is invoked
     * when an action is not explicitly requested by users.
     */
    public function actionIndex()
    {
        // renders the view file 'protected/views/site/index.php'
        // using the default layout 'protected/views/layouts/main.php'
        if (Yii::app()->user->isGuest)
        {
            $this->actionLogin();
        } else
        {
            $this->render('index');
        }
    }

    /**
     * This is the action to handle external exceptions.
     */
    public function actionError()
    {
        if ($error = Yii::app()->errorHandler->error)
        {
            if (Yii::app()->request->isAjaxRequest)
                echo $error['message'];
            else
                $this->render('error', $error);
        }
    }

    /**
     * Backup DB
     */
    public function actionBackup()
    {
        Yii::import('ext.SDatabaseDumper');
        $dumper = new SDatabaseDumper;
        // Get path to backup file
        echo $file = Yii::getPathOfAlias('webroot.protected.data') . DIRECTORY_SEPARATOR . 'dump_' . date('Y-m-d_H_i_s') . '.sql';

        // Gzip dump
        if (function_exists('gzencode'))
            file_put_contents($file . '.gz', gzencode($dumper->getDump()));
        else
            file_put_contents($file, $dumper->getDump());

        echo "<br>backup done";
    }

    /**
     * Lock screen action
     */
    public function actionDb()
    {
        Yii::app()->db->createCommand("SET FOREIGN_KEY_CHECKS=0;")->execute();

        Yii::app()->db->createCommand()->truncateTable('employee');
        Yii::app()->db->createCommand()->truncateTable('company');
        Yii::app()->db->createCommand()->truncateTable('customer');
        Yii::app()->db->createCommand()->truncateTable('extra_job');
        Yii::app()->db->createCommand()->truncateTable('job');
        Yii::app()->db->createCommand()->truncateTable('job_name');
        Yii::app()->db->createCommand()->truncateTable('language');
        Yii::app()->db->createCommand()->truncateTable('material');
        Yii::app()->db->createCommand()->truncateTable('message');
        Yii::app()->db->createCommand()->truncateTable('month');
        Yii::app()->db->createCommand()->truncateTable('project');
        Yii::app()->db->createCommand()->truncateTable('size');
        Yii::app()->db->createCommand()->truncateTable('status');

        Yii::app()->db->createCommand("SET FOREIGN_KEY_CHECKS=1;")->execute();

        Yii::app()->db->createCommand('INSERT INTO `employee` (`name`, `surname`, `address`, `username`, `email`, `usertype`, `password`, `is_active`) VALUES ("Test", "User", "a", "tomnev", "test@test.lt", "admin", "$2a$04$NkdHh6Y3xC1z7VXhWwsOne3Mmqy66oS9P/AcWs.txL6G7xRwga1q2", "1")')->execute();

        $this->redirect(array("site/login"));

    }

    /**
     * Limit grid record count
     */
    public function actionGrid()
    {
        $controller = Yii::app()->request->getParam('c', 'site');
        $action = Yii::app()->request->getParam('a', 'admin');
        $count = (int)Yii::app()->request->getPost('count', 50);
        $userId = Yii::app()->user->getState('id');

        $setting = Setting::model()->find('employee_id=:eid AND title=:title', array(':eid' => $userId, ':title' => $controller . '/' . $action));

        if (!$setting)
        {
            $setting = new Setting();
            $setting->employee_id = $userId;
            $setting->title = $controller . '/' . $action;
        }

        $setting->value = $count;
        $setting->save();

        $grid = Yii::app()->user->getState('grid');
        $grid[$controller. '/' . $action] = $count;
        Yii::app()->user->setState('grid', $grid);

        $this->redirect(array($controller . '/' . $action));
    }

    /**
     * Lock screen action
     */
    public function actionLock()
    {
        $this->layout = '//layouts/lock';
        $this->render('lock');
    }

    /**
     * Displays the login page
     */
    public function actionLogin()
    {
        $this->layout = '//layouts/login';
        $model = new LoginForm;

        // if it is ajax validation request
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'login-form')
        {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }

        // collect user input data
        if (isset($_POST['LoginForm']))
        {
            $model->attributes = $_POST['LoginForm'];

            // validate user input and redirect to the previous page if valid
            if ($model->validate() && $model->login())
            {
                $this->redirect(Yii::app()->user->returnUrl);
            }
        }
        // display the login form
        $this->render('login', array('model' => $model));
    }

    /**
     * Logs out the current user and redirect to homepage.
     */
    public function actionLogout()
    {
        $this->layout = '//layouts/login';
        $model = new LoginForm;

        Yii::app()->user->logout();
        $this->redirect('login');

        //$this->render('login', array('model' => $model));
    }
}