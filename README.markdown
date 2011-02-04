**This is my vim config.**
After initial clone, run 'git submodule update --init'
To add a new bundle, run 'git submodule add GIT-DEPOT .vim/bundle/NAME'

---
**Javascript**

JSLint is a javascript linter : it scans your js files and says what it has to says as you're writing your code.
JSLint need a js parser : spidermonkey or node.js (or, in lastly use : rhino)
Try 'apt-get install spidermonkey-bin' (debian) or 'pacman -S spidermonkey' (archlinux)
Then 'rake install' in bundle/jslint


I've set my .vimrc to launch the Google Closure Compiler against JS files when they are saved.
See http://code.google.com/closure/compiler/
You need to install a java runtime (like openjdk6 or sun's jre6).
You need to download the lastest compiler.jar and tweak .vimrc to tell him where to find that file.
See http://closure-compiler.googlecode.com/files/compiler-latest.zip
 
