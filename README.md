# tidy_powerline_installer

This is a super easy way to install Powerline fonts on MacOS, with all the fonts grouped in a folder called "Powerline".

Make sure that xcode command line tools are installed. Also make sure that you've agreed to the license. You can make sure this is the case by running git:

```
git
```

You can agree to the license with the following command:
```
sudo xcodebuild -license
```

Once xcode tools are installed properly, just run this command.

```
curl https://raw.githubusercontent.com/mvknowles/tidy_powerline_installer/master/install.sh | zsh
```

Please look at the script before running it!

This script is an offshoot from another mini-project of mine called fontwrangler:

https://github.com/mvknowles/fontwrangler

Works on M1 MacOS!

![powerline](powerline.png "powerline")
