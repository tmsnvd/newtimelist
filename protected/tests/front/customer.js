/**
 * Test suite for login
 *
 * casperjs.bat test C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/front
 *
 */


casper.test.begin('NewTime Customer test suite', 20, function suite(test) {

    casper.start(url + "customer/admin", function () {
        this.test.assertExist("#customer-grid", 'Customer name grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.thenClick('div.actions a.btn', function () {
        this.echo('Create new extra customer', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "customer/create");
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
        this.fill('#customer-form', {
            'Customer[title]': '',
            'Customer[description]': 'bar'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Customer[title]', '');
        this.test.assertField('Customer[description]', 'bar');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "customer/create");
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
        this.fill('#customer-form', {
            'Customer[title]': 'foo',
            'Customer[description]': 'bar'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Customer[title]', 'foo');
        this.test.assertField('Customer[description]', 'bar');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "customer/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#customer-grid", 'Extra customer grid exists');
            this.test.assertTextExists('foo', 'Customer title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.update', function () {
        this.echo('Update extra customer', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() !== url + "customer/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("form.form-vertical", "Form rendered");
            this.test.assertField('Customer[title]', 'foo');
            this.test.assertField('Customer[description]', 'bar');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render form', 'ERROR');
            test.done();
        }
    );

    casper.then(function () {
        this.fill('#customer-form', {
            'Customer[title]': 'foo_new',
            'Customer[description]': 'bar'
        }, true); // false means don't autosubmit the form
        this.test.assertField('Customer[title]', 'foo_new');
        this.test.assertField('Customer[description]', 'bar');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "customer/admin");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#customer-grid", 'Extra customer grid exists');
            this.test.assertTextExists('foo_new', 'Customer title exists in grid');
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to render grid', 'ERROR');
            test.done();
        }
    );

    casper.thenClick('td.button-column a.delete', function () {
        this.echo('Delete customer', 'INFO');
        casper.setFilter("page.confirm", function (msg) {
            return true;
        });
    });

    casper.thenOpen(url + "customer/admin", function () {
        this.test.assertExist("#customer-grid", 'Extra customer grid exists');
        this.test.assertExist("span.empty", 'No data in grid');
    });

    casper.run(function () {
        test.done();
    });

});

