prereq 

check if java sdk is installed.
if not install it via 
choco install jdk8 -y #run as admin


To install jenkins agent properly you need

1. Go to http://somexampleJenkinsservername:8080 logon 
2. Go to manage jenkins -example node and choose
3. configure = launch agent by connecting it to the master click save
4. copy command line from next screen

example bellow (to be inputed inside file Start-agent-jenksin-nssm.ps1)

java -jar agent.jar -jnlpUrl http://somexampleJenkinsservername:8080/computer/somexamplejenkinsbuild/slave-agent.jnlp -secret 5bd1f4c53ec4dSomeexamplejenkins_key_codec79f8579ab2e9c39eff2ec6c70 -workDir "C:\Jenkins_New\JenkinsSlaveConfig"

bear in mind that "test" is a name of node and secret changes with every node

copy agent.jar file to folder Jenkins node

example 
c:\Jenkins_agent

then copy files from repo Install-nssm.ps1 and Jenkins_agent.ps1. Change data in file Start-agent-jenksin-nssm.ps1 as in example.

5. Open powershell ise as admin and run file install-nssm.ps1
6. Check conncetivity on jenkins server. 