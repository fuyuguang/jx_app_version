#!/bin/sh
source /Users/fuyuguang/Documents/付玉光Notes/shell/test/shell_method_script/create_a_test_email_v2.sh

  metaDataFile=metaData.txt
  metaDataFile=$(readlink -f "${metaDataFile}")
  create_a_test_email_v2 "${metaDataFile}"


