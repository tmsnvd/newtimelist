/**
 * Test suite for login
 *
 * casperjs.bat test C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/front
 *
 */


casper.test.begin('NewTime Material test suite', 34, function suite(test) {

    casper.start(url + "material/admin", function () {
        this.test.assertExist("#material-grid", 'Material name grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.thenClick('div.actions a.btn', function () {
        this.echo('Create new extra material', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "material/create");
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
        this.fill('#material-form', {
            'Material[title_lt]': 'foo'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Material[title_lt]', 'foo');
        this.test.assertField('Material[title_no]', '');
        this.test.assertField('Material[title_en]', '');
        this.test.assertField('Material[unit]', '');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "material/create");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertExist("div#material-form_es_", "Error shown");
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#material-form', {
            'Material[title_lt]': 'darbas_lt',
            'Material[title_no]': 'darbas_no',
            'Material[title_en]': 'darbas_en',
            'Material[unit]': 'unit'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Material[title_lt]', 'darbas_lt');
        this.test.assertField('Material[title_no]', 'darbas_no');
        this.test.assertField('Material[title_en]', 'darbas_en');
        this.test.assertField('Material[unit]', 'unit');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "material/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#material-grid", 'Extra material grid exists');
            this.test.assertTextExists('darbas_lt', 'Material title exists in grid');
            this.test.assertTextExists('darbas_no', 'Material title exists in grid');
            this.test.assertTextExists('darbas_en', 'Material title exists in grid');
            this.test.assertTextExists('unit', 'Material title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.update', function () {
        this.echo('Update extra material', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() !== url + "material/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertField('Material[title_lt]', 'darbas_lt');
            this.test.assertField('Material[title_no]', 'darbas_no');
            this.test.assertField('Material[title_en]', 'darbas_en');
            this.test.assertField('Material[unit]', 'unit');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#material-form', {
            'Material[title_lt]': 'darbas_lt_new',
            'Material[title_no]': 'darbas_no_new',
            'Material[title_en]': 'darbas_en_new',
            'Material[unit]': 'unit'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Material[title_lt]', 'darbas_lt_new');
        this.test.assertField('Material[title_no]', 'darbas_no_new');
        this.test.assertField('Material[title_en]', 'darbas_en_new');
        this.test.assertField('Material[unit]', 'unit');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "material/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#material-grid", 'Extra material grid exists');
            this.test.assertTextExists('darbas_lt_new', 'Material title exists in grid');
            this.test.assertTextExists('darbas_no_new', 'Material title exists in grid');
            this.test.assertTextExists('darbas_en_new', 'Material title exists in grid');
            this.test.assertTextExists('unit', 'Material title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.delete', function () {
        this.echo('Delete material', 'INFO');
        casper.setFilter("page.confirm", function (msg) {
            return true;
        });
    });

    casper.thenOpen(url + "material/admin", function () {
        this.test.assertExist("#material-grid", 'Extra material grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.run(function () {
        test.done();
    });

});

