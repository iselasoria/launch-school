Since the password authentication has been deprecated for Github, now we have to authenticate with something called secure shell keys or `ssh keys.` I don't claim to know a whole lot about `ssh` keys but as a high-level explanation, they are a secure way for your local machine communicate with repositories on Github. I think of them as best friend necklaces-- in order to complete the heart, both pieces are needed, your best friend has one and you have another. Same with `ssh` keys-- your computer has one, and the server where your github repo is has the other one. In order to communicate, they must have pieces that fit together. Please take the fine details with a grain of salt, I am not an expert in `ssh` this is merely an explanation that helps me make some sense of it.
![[bff.png]]

## Step 1- Generate an `ssh` key locally
At this point you're likely in prep or `RB101` so don't worry too much if the following doesn't make a whole lot of sense yet.

On you computer terminal, type the following command:
`ssh-keygen -t ed25519 -C "myemail@mail.com"`
	- `ssh-keygen` --> this is just the command to get the key generation going
	- `-t ed25519` --> this is part of the command to dictate what key-generating algorithm to use
	- `-C "myemail@mail.com"

 When you run that command your terminal will tell you it's generating private/public key pair. It's going to ask where to save it, likely it will default to a hidden folder in your home directory called `/home/myuser/.ssh/` and this is fine. Then it might ask for a passphrase, you can just hit enter without entering one. It's going to generate the private/public keys and when it's done it will show you something that looks like ASCII art. 
 

## Step 2- Retrieving the newly created `ssh` key
Now we have a key pair. Navigate to your `ssh` folder:
`/home/myuser/.shh/` take a look at what's there. You should see two files with the same name one without an extension and one with the extension `.pub`. The file with no extension is your local machine's private key-- never, ever share your private key with anyone or any one system. That's what the public key is for. We're going to copy that public key (one half of that heart) to share with our BFF Github.

From that same folder, issue the following command to copy the *public* key we just generated: 

`/Users/rosasoria/.ssh`

Your terminal will now show you some text that starts with `ssh-rsa` following by a long string of text. This is the public key! Copy it, let's go to Github.

## Step 3- Giving Github the public component of our `ssh` key pair

Now we're ready to share part of our key with Github. Login, click on the top right where your profile picture icon is and you should see a dropdown menu of your profile. Go down to "settings." This takes you to your profile settings and on the left hand side of the page there is a menu with  the following headings:
	- Access
	- Code, planning, and automation
	- Security 
	- Integrations
	- Archives
Under the Access heading, click on `SSH and GPG keys` and then click `New SSH Key`.  Call it something intuitive `my-ls-key` or something, leave the default key type and now paste the public key you copied in the last step. That's it!

## Step4- Push a commit to test the connection
Make a commit in an existing repo and try to push it to the remote Github repo.
