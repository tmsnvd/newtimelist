casper.test.begin('NewTime Logout check', 1, function suite(test) {

    casper.start("http://185.5.54.28/time/");

    casper.thenClick('#logout', function () {
        this.echo('Login OUT.... aye captain', 'INFO');
    });

    casper.waitFor(function check() {
            return (this.getCurrentUrl() === "http://185.5.54.28/time/site/login");
        },
        function then() { // step to execute when check() is ok
            this.test.assertExist("#login", 'Login form exists');
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