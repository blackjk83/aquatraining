DevOps Assignment (Short):

Please implement the following process:

1. “Hello World” Application:
Python script name: "hello.py"
Can be run on any linux machine, required moduls are listed in "requirements.txt" file
2. Jenkinsfile to run for deployment - run on Jenkin server as Pipeline job 
  a. Github Project: https://github.com/blackjk83/aquariusengines/
  b. Pipeline -> Definition: Pipeline script from SCM -> Git 
  c. Repository URL: https://github.com/blackjk83/aquariusengines/
  d. Credentials: 
    1. User: yakov.av@gmail.com
    2. credentialsID: XXXX
  e. Branch to build: main
  f. Script Path: Jenkinsfile
3. Jenkins server pre-installed with the following plugins:
  a. Git. 
  b. Docker
  c. Version Number Plugin
4. Credentials to Git and Docker pre-configured.
3. Running in production -TBD 
  {filename}:
    run docker pull 
    run docker run 

