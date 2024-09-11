# Connect to your github repo using SSH
In this readME file, i will explain how to connect to your github account using SSH .

### step1 : check for ssh key 
```bash
$ ls -al ~/.ssh
```
### step2 : generate one if there is not any ssh key exists

```bash
$  ssh-keygen -t rsa -b 4096 -C "exxxxxxxxxxxx3@gmail.com" 
```
### step 3 : add your private key to ssh agent 
```bash
$ ssh-add YOUR_PRIVATE_KEY_PATH
```
example:

```bash
$ ssh-add ~/ssh/ssh_github 
```

### Step 4: Copy the SSH public key
xclip -sel clip < /home/ezzat/orange_DevOps/1_git/ssh_github.pub

### step 5 : Open Your GitHub account and add the SSH public Key
1. Open Settings
![image](https://github.com/user-attachments/assets/4ff4b12c-eae4-4df4-a17c-3d5252ec8c39)

2. Open SSH and GPG keys and select add SSH key
![image](https://github.com/user-attachments/assets/5072d45c-862e-4c61-be4b-62838a99120a)

3. Paste the copied public key and select the expire time, ALL DONE :)
 
## source : -
```http
https://www.geeksforgeeks.org/using-github-with-ssh-secure-shell/
```

