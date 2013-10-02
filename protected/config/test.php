<?php

return CMap::mergeArray(
    require(dirname(__FILE__) . '/main.php'),
    array(
        'components' => array(
            'fixture' => array(
                'class' => 'system.test.CDbFixtureManager',
            ),
            'db' => array(
                'connectionString' => 'mysql:host=localhost;dbname=newtimelist_test',
                'emulatePrepare' => true,
                'username' => 'dev',
                'password' => 'dev',
                'charset' => 'utf8',
                'enableProfiling' => true,
                'enableParamLogging' => true
            ),
            'kint' => array(
                'class' => 'ext.Kint.Kint',
            ),
            'log' => array(
                'class' => 'CLogRouter',
                'routes' => array(
                    array(
                        'class' => 'ext.yii-debug-toolbar.YiiDebugToolbarRoute',
                        'ipFilters' => array('127.0.0.1', '87.247.96.77'),
                    ),
                )
            ),
        ),
        'preload' => array('log', 'kint')
    )
);
