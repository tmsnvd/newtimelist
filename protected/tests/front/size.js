/**
 * Test suite for login
 *
 * casperjs.bat test C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/front
 *
 */


casper.test.begin('NewTime Size test suite', 16, function suite(test) {

    casper.start(url + "size/admin", function () {
        this.test.assertExist("#size-grid", 'Size name grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.thenClick('div.actions a.btn', function () {
        this.echo('Create new extra size', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "size/create");
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
        this.fill('#size-form', {
            'Size[title]': ''
        }, true); // false means don't autosubmit the form
        this.test.assertField('Size[title]', '');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "size/create");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertExist("div.alert-error", "Error shown");
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#size-form', {
            'Size[title]': 'foo'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Size[title]', 'foo');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "size/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#size-grid", 'Extra size grid exists');
            this.test.assertTextExists('foo', 'Size title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.update', function () {
        this.echo('Update extra size', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() !== url + "size/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertField('Size[title]', 'foo');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#size-form', {
            'Size[title]': 'foo_new'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Size[title]', 'foo_new');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "size/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#size-grid", 'Extra size grid exists');
            this.test.assertTextExists('foo_new', 'Size title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.delete', function () {
        this.echo('Delete size', 'INFO');
        casper.setFilter("page.confirm", function (msg) {
            return true;
        });
    });

    casper.thenOpen(url + "size/admin", function () {
        this.test.assertExist("#size-grid", 'Extra size grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.run(function () {
        test.done();
    });

});

