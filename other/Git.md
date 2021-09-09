Git

**Understand the Three Sections of a Git Project**
A Git project will have the following three main sections:

Git directory
Working directory (or working tree)
Staging area

The **Git directory** (located in YOUR-PROJECT-PATH/.git/) is where Git stores everything it needs to accurately track the project. This includes metadata and an object database which includes compressed versions of the project files.

The **working directory** is where a user makes local changes to a project. The working directory pulls the project’s files from the Git directory’s object database and places them on the user’s local machine.

The **staging area** is a file (also called the “index”, “stage”, or “cache”) that stores information about what will go into your next commit. A commit is when you tell Git to save these staged changes. Git takes a snapshot of the files as they are and permanently stores that snapshot in the Git directory.

With three sections, there are three main states that a file can be in at any given time: committed, modified, or staged. You modify a file any time you make changes to it in your working directory. Next, it’s staged when you move it to the staging area. Finally, it’s committed after a commit.

**Configure the Git Environment**
Git has a git config tool that allows you to customize your Git environment. You can change the way Git looks and functions by setting certain configuration variables. Run these commands from a command line interface on your machine (Terminal in Mac, Command Prompt or Powershell in Windows).

There are three levels of where these configuration variables are stored:

System: located in /etc/gitconfig, applies default settings to every user of the computer. To make changes to this file, use the --system option with the git config command.
User: located in ~/.gitconfig or ~/.config/git/config, applies settings to a single user. To make changes to this file, use the --global option with the git config command.
Project: located in YOUR-PROJECT-PATH/.git/config, applies settings to the project only. To make changes to this file, use the git config command.

If there are settings that conflict with each other, the project-level configurations will override the user-level ones, and the user-level configurations will override the system-level ones.

Note for Windows users: Git looks for the user-level configuration file (.gitconfig) in your $HOME directory (C:\Users\$USER). Git also looks for /etc/gitconfig, although it’s relative to the MSys root, which is wherever you decide to install Git on your Windows system when you run the installer. If you are using version 2.x or later of Git for Windows, there is also a system-level config file at C:\Documents and Settings\All Users\Application Data\Git\config on Windows XP, and in C:\ProgramData\Git\config on Windows Vista and newer. This config file can only be changed by git config -f FILE as an admin.

**Add Your Name and Email**
Git includes the user name and email as part of the information in a commit. You’ll want to set this up under your user-level configuration file with these commands:

```Powershell
git config --global user.name "My Name"
git config --global user.email "myemail@example.com"
```

**Change Your Text Editor**
Git automatically uses your default text editor, but you can change this. Here’s an example to use the Atom editor instead (the --wait option tells the shell to wait for the text editor so you can do your work in it before the program moves on):

```Powershell
git config --global core.editor "atom --wait"
```

**Add Color to Git Output**
You can configure your shell to add color to Git output with this command:

```Powershell
git config --global color.ui true
```

To see all your configuration settings, use the command `git config --list.`

**Initialize Git in a Project**
Once Git is installed and configured on your computer, you need to initialize it in your project to start using its version control powers. In the command line, use the cd command to navigate to the top-level (or root) folder for your project. Next, run the command git init. This installs a Git directory folder with all the files and objects Git needs to track your project.

It’s important that the Git directory is installed in the project root folder. Git can track files in subfolders, but it won’t track files located in a parent folder relative to the Git directory.