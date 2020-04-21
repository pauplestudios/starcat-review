cd vendor/pauple/starcat-review-cpt && yarn copyfiles
cd dist && cpy * ../../../../artifacts/addons/starcat-review-cpt --parents
bestzip ../../../../starcat-review-cpt.zip *
cd ../../../../
cd vendor/pauple/starcat-review-ct && yarn copyfiles
cd dist && cpy * ../../../../artifacts/addons/starcat-review-ct --parents
bestzip ../../../../starcat-review-ct.zip *