<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

Yii::setPathOfAlias('bootstrap', dirname(__FILE__) . '/../extensions/bootstrap');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'NewTime',
    'theme' => 'flat',
    'sourceLanguage' => 'lt',
    'language' => 'lt',
    // preloading 'log' component
    'preload' => array(
        'log',
    ),
    'onBeginRequest' => array('Controller', 'beginRequest'),
    // autoloading model and component classes
    'import' => array(
        'application.models.*',
        'application.components.*',
        'ext.giix.components.*', // giix components
    ),

    'modules' => array( // uncomment the following to enable the Gii tool
        'gii' => array(
            'class' => 'system.gii.GiiModule',
            'password' => 'qweasd',
            // If removed, Gii defaults to localhost only. Edit carefully to taste.
            'ipFilters' => array('127.0.0.1', '::1', '87.247.96.77'),
            'generatorPaths' => array(
                //'bootstrap.gii',
                //'ext.giix.generators',
                'bootstrap.gii',
            ),
        ),
        /**/
    ),

    // application components
    'components' => array(
        'user' => array(
            // enable cookie-based authentication
            'class' => 'WebUser',
            'allowAutoLogin' => true
        ),
        'bootstrap' => array(
            'class' => 'bootstrap.components.Bootstrap',
        ),
        // uncomment the following to enable URLs in path-format
        'urlManager' => array(
            'urlFormat' => 'path',
            'showScriptName' => false,
            'rules' => array(
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ),
        ), /*
        'db' => array(
            'connectionString' => 'sqlite:' . dirname(__FILE__) . '/../data/testdrive.db',
        ),
        // uncomment the following to use a MySQL database
        */
        'db' => array(
            'connectionString' => 'mysql:host=localhost;dbname=newtimelist',
            'emulatePrepare' => true,
            'username' => 'dev',
            'password' => 'dev',
            'charset' => 'utf8',
            'enableProfiling' => true,
            'enableParamLogging' => true
        ),

        'errorHandler' => array(
            // use 'site/error' action to display errors
            'errorAction' => 'site/error',
        ),
        /*
        'messages' => array (
            // Pending on core: http://code.google.com/p/yii/issues/detail?id=2624
            'extensionBasePaths' => array(
                'giix' => 'ext.giix.messages', // giix messages directory.
            ),
        ),
        */
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'ext.yii-debug-toolbar.YiiDebugToolbarRoute',
                    'ipFilters' => array('127.0.0.1', '87.247.96.77'),
                ),
            ),
            /*
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, warning',
                ),
                // uncomment the following to show log messages on web pages
                /*
                array(
                    'class'=>'CWebLogRoute',
                ),

            ),*/
        ),
    ),
    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params' => array(
        // this is used in contact page
        'adminEmail' => '',
    ),
);