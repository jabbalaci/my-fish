function gitup -d "Upload local changes to the git repo"
    git status
    echo
    echo "# Step 1) git add -A ."
    echo "Press ENTER to continue..."
    read -P ""
    git add -A .
    git status
    echo
    echo "# Step 2) git commit"
    echo "Press ENTER to continue..."
    read -P ""
    git commit
    git status
    echo
    echo "# Step 3) git push"
    echo "Press ENTER to continue..."
    read -P ""
    git push
    git status
end
