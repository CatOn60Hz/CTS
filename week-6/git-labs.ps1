$ErrorActionPreference = "Continue"

mkdir C:\Users\iqbal\Java-FSE\week-6\Git-HOL -ErrorAction SilentlyContinue
cd C:\Users\iqbal\Java-FSE\week-6\Git-HOL

Write-Host "--- Setup Simulated Environment ---"
git init --bare RemoteRepo.git
git clone RemoteRepo.git LocalRepo
cd LocalRepo

git config user.name "username"
git config user.email "username@cognizant.com"
echo "Initial content" > initial.txt
git add initial.txt
git commit -m "Initial commit"
git push origin master

Write-Host "`n--- Lab 1: Clean up and push back to remote Git ---"
git status
git branch -a
git pull origin master
echo "Lab 1 changes" > lab1.txt
git add lab1.txt
git commit -m "Git-T03-HOL_002 changes"
git push origin master
git ls-remote origin

Write-Host "`n--- Lab 2: Merge conflict ---"
git status
git checkout -b GitWork
echo "<hello>world</hello>" > hello.xml
echo "<hello>GitWork</hello>" > hello.xml
git status
git add hello.xml
git commit -m "Add hello.xml in GitWork branch"
git checkout master
echo "<hello>master</hello>" > hello.xml
git add hello.xml
git commit -m "Add hello.xml in master branch"
git log --oneline --graph --decorate --all
git diff master GitWork
git merge GitWork
Write-Host "Git Mark up after merge conflict:"
cat hello.xml
echo "<hello>resolved</hello>" > hello.xml
git add hello.xml
git commit -m "Resolve merge conflict for hello.xml"
git status
echo "*.orig" >> .gitignore
git add .gitignore
git commit -m "Add backup files to .gitignore"
git branch -a
git branch -d GitWork
git log --oneline --graph --decorate

Write-Host "`n--- Lab 3: Branching and merging ---"
git branch GitNewBranch
git branch -a
git checkout GitNewBranch
echo "new feature" > newfile.txt
git add newfile.txt
git commit -m "Add newfile.txt in GitNewBranch"
git status
git checkout master
git diff master GitNewBranch
git merge GitNewBranch
git log --oneline --graph --decorate
git branch -d GitNewBranch
git status

Write-Host "`n--- Lab 4: Git ignore ---"
echo "log" > test.log
mkdir log_folder -ErrorAction SilentlyContinue
echo "log inside folder" > log_folder/test.log
echo "*.log" >> .gitignore
echo "log_folder/" >> .gitignore
git add .gitignore
git commit -m "Update gitignore for log files and log folders"
git status

Write-Host "`n--- Lab 5: Setup and Basic commands ---"
cd C:\Users\iqbal\Java-FSE\week-6\Git-HOL
git version
git config --global user.name "username"
git config --global user.email "username@cognizant.com"
git init GitDemo
cd GitDemo
echo "Welcome to the version control" > welcome.txt
cat welcome.txt
git status
git add welcome.txt
git commit -m "Added welcome text"
git status
