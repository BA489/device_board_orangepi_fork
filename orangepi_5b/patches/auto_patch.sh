function auto_patch()
{
    local patch_dir=$1
    git_path_string=$(basename $patch_dir)
    cur_git_path=$T/${git_path_string//#/\/};
    echo "[path]: ${cur_git_path}"

    for file in $patch_dir/*
    do
        if [ -f "$file" ] && [ "${file##*.}" == "patch" ]
        then
            local change_id=`grep 'Change-Id' $file | cut -f 2 -d " "`
            cur_ptach_file=$file
            if [ -d "$cur_git_path" ]
            then
                if [ "$change_id" == "" ]
                then
                    echo -e "\033[31m!!! Patch Ignore !!!\033[0m"
                    echo "### patch_dir ${patch_dir##*/} $file have not change_id."
                    continue
                fi
                cd $cur_git_path; git log -n 100 | grep $change_id 1>/dev/null 2>&1;
                if [ $? -ne 0 ]; then
                    #echo "###patch ${file##*/}###      "
                    cd $cur_git_path; git am --ignore-whitespace -q $file 1>/dev/null 2>&1;
                    if [ $? != 0 ]
                    then
                        git am --abort
                        echo -e "\033[31m!!! Patch Warnning !!!\033[0m"
                        echo "### patch_dir ${patch_dir##*/} $file failed,maybe already patched    "
                        continue
                    fi
                fi
            fi
        fi
    done
}

function traverse_patch_dir()
{
    local local_dir=$1
    for file in `ls $local_dir`
    do
        if [[ "$file" =~ ".md" || "$file" =~ ".sh" ]]
        then
            continue
        fi

        if [ -d $local_dir$file ]
        then
            local dest_dir=$local_dir$file
            auto_patch $dest_dir
        fi
    done
    echo "!!! Patch Finish !!! "
    cd $T
}

T=`pwd`
ALL_PATCH_DIR_PATH=$T/$(dirname $0)/

traverse_patch_dir $ALL_PATCH_DIR_PATH

if [ $? != 0 ]
then
    echo "patch error"
    return 1
fi
