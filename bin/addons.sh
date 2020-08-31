cd vendor/pauple/starcat-review-cpt && yarn copyfiles
cd dist && cpy * ../../../../artifacts/addons/starcat-review-cpt --parents
bestzip ../../../../starcat-review-cpt.zip *
cd ../../../../
cd vendor/pauple/starcat-review-ct && yarn copyfiles
cd dist && cpy * ../../../../artifacts/addons/starcat-review-ct --parents
bestzip ../../../../starcat-review-ct.zip *
cd ../../../../
cd vendor/pauple/starcat-review-woo-notify && yarn copyfiles
cd dist && cpy * ../../../../artifacts/addons/starcat-review-woo-notify --parents
bestzip ../../../../starcat-review-cpt.zip *
cd ../../../../
cd vendor/pauple/starcat-review-photo-reviews && yarn copyfiles
cd dist && cpy * ../../../../artifacts/addons/starcat-review-photo-reviews --parents
bestzip ../../../../starcat-review-cpt.zip *
cpy vendor/pauple/upgrader/*.php includes/lib/upgrader
cpy vendor/pauple/widgetry/*.php includes/lib/widgetry