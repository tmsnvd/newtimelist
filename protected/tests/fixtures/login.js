// casperjs.bat test --fail-fast --pre=C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/fixtures/login.js --post=C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/fixtures/logout.js C:/Users/Tomas/PhpstormProjects/newtimelist/protected/tests/front

var url = "http://185.5.54.28/time/";

casper.test.begin('NewTime Login check', 7, function suite(test) {

    casper.start(url + "site/db", function () {
        this.test.assertExist("#login", 'Login form exists');
        this.fill('#login', {
            'LoginForm[username]': 'foo',
            'LoginForm[password]': 'bar'
        }, false); // false means don't autosubmit the form
        this.test.assertField('LoginForm[username]', 'foo');
        this.test.assertField('LoginForm[password]', 'bar');
    });

    casper.thenClick('#login-button', function () {
        this.echo('Login in .... aye aye captain', 'INFO');
    });

    casper.then(function () {
        this.test.assertExist("#login", 'Login form exists');
        this.fill('#login', {
            'LoginForm[username]': 'tomnev',
            'LoginForm[password]': 'asd'
        }, true);
        this.test.assertField('LoginForm[username]', 'tomnev');
        this.test.assertField('LoginForm[password]', 'asd');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === url + "");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#yw0", "Menu rendered");
        },
        function timeout() { // step to execute if check has failed
            this.echo('Failed to login', 'ERROR');
            test.done();
        }
    );

    casper.run(function () {
        test.done();
    });

});