/**
 * Test suite for login
 *
 * casperjs.bat test C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/front
 *
 */


casper.test.begin('NewTime Job Name test suite', 34, function suite(test) {

    casper.start(url + "jobName/admin", function () {
        this.test.assertExist("#job-name-grid", 'Job name grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.thenClick('div.actions a.btn', function () {
        this.echo('Create new extra job', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "jobName/create");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form ' + this.getCurrentUrl(), 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#job-name-form', {
            'JobName[title_lt]': 'foo'
        }, true); // false means don't autosubmit the form
        this.test.assertField('JobName[title_lt]', 'foo');
        this.test.assertField('JobName[title_no]', '');
        this.test.assertField('JobName[title_en]', '');
        this.test.assertField('JobName[unit]', '');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "jobName/create");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertExist("div#job-name-form_es_", "Error shown");
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#job-name-form', {
            'JobName[title_lt]': 'darbas_lt',
            'JobName[title_no]': 'darbas_no',
            'JobName[title_en]': 'darbas_en',
            'JobName[unit]': 'unit'
        }, true); // false means don't autosubmit the form
        this.test.assertField('JobName[title_lt]', 'darbas_lt');
        this.test.assertField('JobName[title_no]', 'darbas_no');
        this.test.assertField('JobName[title_en]', 'darbas_en');
        this.test.assertField('JobName[unit]', 'unit');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "jobName/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#job-name-grid", 'Extra job grid exists');
            this.test.assertTextExists('darbas_lt', 'Job title exists in grid');
            this.test.assertTextExists('darbas_no', 'Job title exists in grid');
            this.test.assertTextExists('darbas_en', 'Job title exists in grid');
            this.test.assertTextExists('unit', 'Job title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.update', function () {
        this.echo('Update extra job', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() !== url + "jobName/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertField('JobName[title_lt]', 'darbas_lt');
            this.test.assertField('JobName[title_no]', 'darbas_no');
            this.test.assertField('JobName[title_en]', 'darbas_en');
            this.test.assertField('JobName[unit]', 'unit');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#job-name-form', {
            'JobName[title_lt]': 'darbas_lt_new',
            'JobName[title_no]': 'darbas_no_new',
            'JobName[title_en]': 'darbas_en_new',
            'JobName[unit]': 'unit'
        }, true); // false means don't autosubmit the form
        this.test.assertField('JobName[title_lt]', 'darbas_lt_new');
        this.test.assertField('JobName[title_no]', 'darbas_no_new');
        this.test.assertField('JobName[title_en]', 'darbas_en_new');
        this.test.assertField('JobName[unit]', 'unit');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "jobName/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#job-name-grid", 'Extra job grid exists');
            this.test.assertTextExists('darbas_lt_new', 'Job title exists in grid');
            this.test.assertTextExists('darbas_no_new', 'Job title exists in grid');
            this.test.assertTextExists('darbas_en_new', 'Job title exists in grid');
            this.test.assertTextExists('unit', 'Job title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.delete', function () {
        this.echo('Delete job', 'INFO');
        casper.setFilter("page.confirm", function (msg) {
            return true;
        });
    });

    casper.thenOpen(url + "jobName/admin", function () {
        this.test.assertExist("#job-name-grid", 'Extra material grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.run(function () {
        test.done();
    });

});

