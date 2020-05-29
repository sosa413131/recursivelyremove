# Recursively erase solved folders from activities labeled “student” and “everyone”

# Copy class activities folder from Curriculum repo to class repo

# STEP 1
find . -type d -name "*Evr*" -exec echo {}>> paths.txt \;

# STEP 2
find . -type d -name "*Stu*" -exec echo {}>> paths.txt \;

# STEP 3
find . -type d -name "*Par*" -exec echo {}>> paths.txt \;

# STEP 4
filename='paths.txt'
n=1
while read line; do
# reading each line
rm -rf "$line"/Solved
n=$((n+1))
done < $filename

# STEP 5
# At the end of navigate to the corresponding curriculum repo move the paths.txt file here then run the following

classrepo=RU-JER-DATA-PT-01-2020
filename='paths.txt'
lesson='01-Lesson-Plans/18-R/1/'
n=1
while read line; do
# reading each line
echo 'moving from' "$line"/Solved 'to' ~/Desktop/"$classrepo"/"$lesson""${line:2}"/
cp -R "$line"/Solved ~/Desktop/"$classrepo"/"$lesson""${line:2}"/
n=$((n+1))
done < $filename
