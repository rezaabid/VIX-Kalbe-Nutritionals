# Challenge 1: Scheduling Task with Cron Jobs

Challenge 1 has the goal of creating a bash script that contains a command to check the availability of a directory in the path, and then the bash script is scheduled using the Linux terminal.

In the bash script, which in this case is named `challenge_1.sh`, it checks if `name_of_directory` is available in `path`. If the check is true, it will display a message that the directory is available. Otherwise, a message is displayed that the directory is not available and the directory was created in the specified path. The full code display can be seen below:

```bash
#!/usr/bin/bash

path=/hdfs/data/data1
name_of_directory=data1

if [[ -d $path/$name_of_directory ]]; then
    echo “There is $ name_of_directory Directory Exists!”
else
    echo “$name_of_directory Directory Not Exists!”
    sudo mkdir -p $path/$name_of_directory
fi
```

After that, the `challenge_1.sh` will be scheduled using crontab which can be accessed using the command

```bash
crontab -e
```

and set the scheduler to run every day at 07.00 AM which can be done by writing the following command:
```bash
0 7 * * * /usr/bin/bash /root/challenge_1.sh
```



