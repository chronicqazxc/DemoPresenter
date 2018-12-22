#!/bin/sh

#  copy_resources.sh
#  DemoPresenter
#
#  Created by Wayne Hsiao on 2018/12/22.
#  Copyright © 2018 Wayne Hsiao. All rights reserved.

file=$SRCROOT/$TARGET_NAME.bundle

if [ -d $file ] ; then
rm -rf $file
fi

cp -R $BUILT_PRODUCTS_DIR/$TARGET_NAME.bundle $SRCROOT
