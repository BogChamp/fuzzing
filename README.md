# fuzzing
Requirements:
1) Composer. How to install: [https://getcomposer.org/](https://getcomposer.org)
3) Smarty. Link: https://github.com/smarty-php/smarty. 
4) Xdebug. How to install: https://xdebug.org/docs/install
5) Php-code-coverage. How to install: https://github.com/sebastianbergmann/php-code-coverage
6) Grammarinator. Documentation: https://github.com/renatahodovan/grammarinator

Prepare for work:
1) Download this repository and move to the togit directory.
1) Download composer. If you are using Ubuntu, run this:
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
2) Download Smarty. Just run in the command line: composer require smarty/smarty.
3) Run in command line: chmod +x preprocess.sh. Then run this script: ./preprocess.sh
4) Run in command line: ./scripts_for_smarty.sh. This will move scripts to Smarty code directory
5) Move into directory with Smarty code. The path is: smarty/vendor/smarty/smarty
6) Install grammarinator using pip: pip3 install grammarinator
7) Install Xdebug. If you are using Ubuntu, just run: sudo apt-get install php-xdebug
8) Install php-code-coverage. You can run: composer require phpunit/php-code-coverage. If it woudn't work, just write in composer.json in "require" tag: "phpunit/phpcov": "^8.2".
9) Run script create.sh: ./create.sh. This will generate unlexer and unparser for grammarinator.

How to fuzz:
Grammar for Smarty presented in two variants: bnf and antlr4. In bnf format you can alter probabilities manually.
To generate tests via bnf format, run ./script.sh. To generate test using grammarinator: ./grammarinator.sh

Then open index.php file and put tests names into render function argument: $smarty->display('test_name');

Run ./runcov.sh script to start collect path coverage. Then open your web app in browser. Then change tests in display function in index.php file to run diffrent tests.

After you finished end running runcov.sh and run collect.sh script to collect coverage. You will get directory "report", where you will find report about path coverage.
