<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
    /**
     * @var string the default layout for the controller view. Defaults to '//layouts/column1',
     * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
     */
    public $layout = '//layouts/column1';
    /**
     * @var array context menu items. This property will be assigned to {@link CMenu::items}.
     */
    public $menu = array();
    /**
     * @var array the breadcrumbs of the current page. The value of this property will
     * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
     * for more details on how to specify this property.
     */
    public $breadcrumbs = array();

    /**
     * @param CEvent $event
     */
    public static function beginRequest(CEvent $event)
    {
        Yii::app()->language = 'lt';
        Yii::app()->theme = 'flat';
    }

    /**
     * Action before any function
     * @param $action
     * @return bool
     */
    protected function beforeAction($action)
    {
        $baseUrl = Yii::app()->baseUrl . '/';
        $cs = Yii::app()->getClientScript();

        $js = 'js/plugins/';
        $css = 'css/plugins/';

        $cs->registerCssFile($baseUrl . 'css/bootstrap.min.css');
        $cs->registerCssFile($baseUrl . 'css/bootstrap-responsive.min.css');
        $cs->registerCssFile($baseUrl . 'css/style.css');
        $cs->registerCssFile($baseUrl . 'css/themes.css');
        $cs->registerCssFile($baseUrl . 'css/customized.css');

        $cs->registerCoreScript('jquery');

        #$cs->registerScriptFile($baseUrl . '/js/jquery-1.8.3.min.js');
        $cs->registerScriptFile($baseUrl . 'js/jquery-migrate-1.2.1.min.js');
        $cs->registerScriptFile($baseUrl . 'js/bootstrap.min.js');

        switch ($action->getId())
        {
            case "index":
            case "login":
            case "invoice":
            case "admin":
            case "outlay":
            case "worker":

                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.core.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.datepicker.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'datepicker/locales/bootstrap-datepicker.' . Yii::app()->language . '.js');
                $cs->registerScriptFile($baseUrl . $js . 'datepicker/bootstrap-datepicker.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.widget.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.mouse.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.sortable.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.resizable.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'nicescroll/jquery.nicescroll.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'maskedinput/jquery.maskedinput.min.js');

                $cs->registerCssFile($baseUrl . $css . 'datepicker/datepicker.css');

                if (Yii::app()->user->hasFlash('success'))
                {
                    $cs->registerScriptFile($baseUrl . $js . 'gritter/jquery.gritter.min.js');
                    $cs->registerCssFile($baseUrl . $css . 'gritter/jquery.gritter.css');

                    $script = '
                    $.gritter.add({
                        title: "' . Yii::t('admin', 'NewTime') . '",
                        text: "' . Yii::app()->user->getFlash('success') . '",
                        time: 2000,
                    });
                    ';

                    Yii::app()->clientScript->registerScript('someId', $script);
                }

                break;

            case "update":
            case "create":
            case "not":

                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.core.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.datepicker.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'datepicker/bootstrap-datepicker.js');
                $cs->registerScriptFile($baseUrl . $js . 'datepicker/locales/bootstrap-datepicker.' . Yii::app()->language . '.js');
                $cs->registerScriptFile($baseUrl . $js . 'daterangepicker/moment.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'daterangepicker/daterangepicker.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.widget.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.mouse.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.sortable.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'jquery-ui/jquery.ui.resizable.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'nicescroll/jquery.nicescroll.min.js');
                $cs->registerScriptFile($baseUrl . $js . 'maskedinput/jquery.maskedinput.min.js');

                $cs->registerCssFile($baseUrl . $css . 'datepicker/datepicker.css');
                $cs->registerCssFile($baseUrl . $css . 'daterangepicker/daterangepicker.css');

                break;
        }


        $cs->registerCssFile($baseUrl . '/css/plugins/timepicker/bootstrap-timepicker.min.css');
        $cs->registerScriptFile($baseUrl . '/js/plugins/timepicker/bootstrap-timepicker.min.js');

        $cs->registerScriptFile($baseUrl . 'js/ipad.js');
        $cs->registerScriptFile($baseUrl . 'js/application.js');
        $cs->registerScriptFile($baseUrl . 'js/eakroko.js');

        return true;
    }
}