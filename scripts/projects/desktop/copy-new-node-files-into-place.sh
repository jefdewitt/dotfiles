
#!/bin/sh

target_dir=/nas/drupal
src_dir=/mnt/code/Drupal_Adw


mkdir -p $target_dir/sites/twinspires.com/.deployment-packages/r22.i1
mkdir -p $target_dir/sites/twinspires.com/.deployment-packages/r22.i1/Node

cp -rf \
    $src_dir/sites/twinspires.com/.deployment-packages/r22.i1/package.yaml \
    $target_dir/sites/twinspires.com/.deployment-packages/r22.i1/package.yaml

cp -rf \
    $src_dir/sites/twinspires.com/.deployment-packages/r22.i1/Node/offers.yaml \
    $target_dir/sites/twinspires.com/.deployment-packages/r22.i1/Node/offers.yaml

cp -rf \
    $src_dir/sites/all/modules/deployment_ts_account_pages/deployment_ts_account_pages.pages_default.inc \
    $target_dir/sites/all/modules/deployment_ts_account_pages/deployment_ts_account_pages.pages_default.inc

cp -rf \
    $src_dir/sites/twinspires.com/themes/ts2/template.php \
    $target_dir/sites/twinspires.com/themes/ts2/template.php

cp -rf \
    $src_dir/sites/all/modules/brisnet/css/widget.offers.css \
    $target_dir/sites/all/modules/brisnet/css/widget.offers.css

cp -rf \
    $src_dir/sites/all/postInstall/drupalAdw.xml \
    $target_dir/sites/all/postInstall/drupalAdw.xml
