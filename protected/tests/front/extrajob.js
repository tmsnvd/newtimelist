/**
 * Test suite for login
 *
 * casperjs.bat test C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/front
 *
 */


casper.test.begin('NewTime Extra Job test suite', 33, function suite(test) {

    casper.start(url + "extraJob/admin", function () {
        this.test.assertExist("#extra-job-grid", 'Extra job grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.thenClick('div.actions a.btn', function () {
        this.echo('Create new extra job', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "extraJob/create");
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
        this.fill('#extra-job-form', {
            'ExtraJob[title_lt]': 'foo'
        }, true); // false means don't autosubmit the form
        this.test.assertField('ExtraJob[title_lt]', 'foo');
        this.test.assertField('ExtraJob[title_no]', '');
        this.test.assertField('ExtraJob[title_en]', '');
        this.test.assertField('ExtraJob[unit]', '');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "extraJob/create");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertExist("div#extra-job-form_es_", "Error shown");
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#extra-job-form', {
            'ExtraJob[title_lt]': 'darbas_lt',
            'ExtraJob[title_no]': 'darbas_no',
            'ExtraJob[title_en]': 'darbas_en',
            'ExtraJob[unit]': 'unit'
        }, true); // false means don't autosubmit the form
        this.test.assertField('ExtraJob[title_lt]', 'darbas_lt');
        this.test.assertField('ExtraJob[title_no]', 'darbas_no');
        this.test.assertField('ExtraJob[title_en]', 'darbas_en');
        this.test.assertField('ExtraJob[unit]', 'unit');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "extraJob/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#extra-job-grid", 'Extra job grid exists');
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
            return (this.getCurrentUrl() !== url + "extraJob/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertField('ExtraJob[title_lt]', 'darbas_lt');
            this.test.assertField('ExtraJob[title_no]', 'darbas_no');
            this.test.assertField('ExtraJob[title_en]', 'darbas_en');
            this.test.assertField('ExtraJob[unit]', 'unit');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#extra-job-form', {
            'ExtraJob[title_lt]': 'darbas_lt_new',
            'ExtraJob[title_no]': 'darbas_no_new',
            'ExtraJob[title_en]': 'darbas_en_new',
            'ExtraJob[unit]': 'unit',
        }, true); // false means don't autosubmit the form
        this.test.assertField('ExtraJob[title_lt]', 'darbas_lt_new');
        this.test.assertField('ExtraJob[title_no]', 'darbas_no_new');
        this.test.assertField('ExtraJob[unit]', 'unit');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "extraJob/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#extra-job-grid", 'Extra job grid exists');
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

    casper.thenOpen(url + "extraJob/admin", function () {
        this.test.assertExist("#extra-job-grid", 'Extra material grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.run(function () {
        test.done();
    });

});

