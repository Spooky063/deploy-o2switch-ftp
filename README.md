# Deploy o2switch via FTP

If you're using [o2switch](https://www.o2switch.fr/) and want to deploy your application via Github Actions over SSH, you're in for a surprise: SSH authorizations.  
In fact, this website provider blocks SSH connections by default and lets you **add 5 IPs to your whitelist** to control access.  
The problem is that we don't know the IP of the runner that will execute our jobs, so I've come up with an alternative solution.

## The alternative

> [!TIP]
> The idea is to push a deployment folder with one file per environment deployed on the server.  
> Each file will contain the hash of the commit to be deployed.

Are we going to push our application via FTP? **definitely not** :poop:  
We'll just use the modification date of a file we send via FTP as an event to execute an action from the server.

### How it works

Sending the file by FTP will be done by Github Actions.  
And the execution of bash script to update the application will use: 
- [watch](https://linux.die.net/man/1/watch) to check file update
- [setsid](https://linux.die.net/man/1/setsid) to run bash script as deamon

#### Use setsid

To run it as a full deamon from a shell, let use the following command:

```bash
setsid /home/yosu0027/deployment_manager.sh >/dev/null 2>&1 </dev/null &
```
