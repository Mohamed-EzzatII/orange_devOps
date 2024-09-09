source : https://www.geeksforgeeks.org/using-github-with-ssh-secure-shell/

step1 : check for ssh key 
$ ls -al ~/.ssh

step2 : generate one if there is not any ssh key exists
$  ssh-keygen -t rsa -b 4096 -C "ezzatmohamed683@gmail.com" 
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ezzat/.ssh/id_rsa): ssh_github
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in ssh_github
Your public key has been saved in ssh_github.pub
The key fingerprint is:
---------- e---------------@gmail.com
The key's randomart image is:
+---[RSA 4096]----+

step 3 : add your ssh key to ssh agent 
$ ssh-add YOUR_SSH_KEY_PATH
example:
$ ssh-add /home/ezzat/orange_DevOps/1_git/ssh_github 

Step 4: Add the SSH Key to your GitHub Account

//copy the ssh key
xclip -sel clip < /home/ezzat/orange_DevOps/1_git/ssh_github.pub

step 5 : open github and add it to your github account

